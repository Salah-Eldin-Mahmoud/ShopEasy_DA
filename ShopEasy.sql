-- Create Price Category for Products with labels (Low, Medium, High)
SELECT 
	ProductID,
	ProductName,
	Price,
	CASE
		WHEN Price < 50 THEN 'Low'
		WHEN Price BETWEEN 50 AND 200 THEN 'Medium'
		ELSE 'High'
	END AS PriceCategory
FROM dbo.products
ORDER BY Price DESC;

-- Join Customer table with Geography table 
SELECT 
	c.CustomerID,
	c.CustomerName,
	c.Email,
	c.Gender,
	c.Age,
	g.Country,
	g.City,

CASE 
	WHEN c.Age < 23 THEN 'young-aged'
	WHEN c.Age < 40 THEN 'middle-aged'
	ELSE 'Old-aged'
END AS AgeCategory

FROM dbo.customers as c
LEFT JOIN 
	dbo.geography as g
ON 
	c.GeographyID = g.GeographyID;

-- Clean whitespaces in the ReviewText column in Customer Reviews Table and create new table name fact_customer_reviews
SELECT 
	 ReviewID,  
    CustomerID,  
    ProductID,  
    ReviewDate,  
    Rating,
	REPLACE(ReviewText,'  ', ' ') as ReviewText
INTO fact_customer_reviews
FROM dbo.customer_reviews

-- Normalize & Clean queries for engagement table 
SELECT 
	 EngagementID,
    ContentID,
	CampaignID,
    ProductID,
	UPPER(REPLACE(ContentType,'socialmedia', 'Social Media')) ContentType,
	LEFT(ViewsClicksCombined, CHARINDEX('-',ViewsClicksCombined) -1) as Views,
	RIGHT(ViewsClicksCombined, LEN(ViewsClicksCombined) - CHARINDEX('-', ViewsClicksCombined)) as Clicks,
	Likes,
	FORMAT(CONVERT(DATE, EngagementDate), 'dd-mm-yyyy') as EngagementDate
FROM dbo.engagement_data
WHERE 
	ContentType != 'NEWSLETTER';

-- Clean duplicates and NULL values in duration in Customer Journey table
SELECT 
    JourneyID, 
    CustomerID,
    ProductID,
    VisitDate,
    Stage, 
    Action,
    COALESCE(Duration, avg_duration) AS Duration
FROM 
    (
        -- Subquery to process and clean the data
        SELECT 
            JourneyID,  
            CustomerID,
            ProductID,
            VisitDate,
            UPPER(Stage) AS Stage,
            Action,  
            Duration,  
            AVG(Duration) OVER (PARTITION BY VisitDate) AS avg_duration,
            ROW_NUMBER() OVER (
                PARTITION BY CustomerID, ProductID, VisitDate, UPPER(Stage), Action 
                ORDER BY JourneyID  
            ) AS row_num 
        FROM 
            dbo.customer_journey 
    ) AS subquery
WHERE 
    row_num = 1;