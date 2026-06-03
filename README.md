# Marketing Analytics End-to-End Project

## Overview

This project demonstrates a complete Marketing Analytics workflow, starting from raw data extraction and cleaning in SQL Server, performing sentiment analysis in Python, and building an interactive dashboard in Power BI to generate business insights.

The goal of this project is to transform raw marketing, customer, engagement, and product data into actionable insights that support data-driven decision-making.



## Dataset

The project uses multiple datasets related to marketing operations, including:

* Customers
* Products
* Customer Reviews
* Customer Journey
* Marketing Campaigns
* Content Engagement
* Geography



## Tools & Technologies

* SQL Server
* SQL
* Python
* Pandas
* NLTK (VADER Sentiment Analysis)
* Power BI
* Data Modeling
* Data Cleaning & Transformation



## Project Workflow

### 1. Data Cleaning & Transformation (SQL)

Several SQL queries were used to prepare and improve data quality before analysis.

#### Product Analysis

* Created product price categories:

  * Low
  * Medium
  * High

#### Customer & Geography Integration

* Joined customer and geography tables.
* Added customer age segmentation:

  * Young-aged
  * Middle-aged
  * Old-aged

#### Customer Reviews Cleaning

* Removed unnecessary whitespace from review texts.
* Created a clean fact table for customer reviews.

#### Engagement Data Transformation

* Standardized content types.
* Split combined Views-Clicks field into separate metrics.
* Filtered unnecessary records.
* Normalized engagement data for reporting.

#### Customer Journey Data Cleaning

* Removed duplicate records.
* Replaced missing duration values using average duration calculations.
* Standardized customer journey stages.



### 2. Sentiment Analysis (Python)

Customer review text was analyzed using VADER Sentiment Analysis.

#### Steps Performed

* Loaded review data from SQL Server.
* Calculated sentiment scores for each review.
* Classified reviews into:

  * Positive
  * Negative
  * Neutral
  * Mixed Positive
  * Mixed Negative
* Created sentiment score buckets for deeper analysis.
* Exported enriched review data for reporting.

#### Generated Features

* SentimentScore
* SentimentCategory
* SentimentBucket



### 3. Data Modeling & Visualization (Power BI)

A Power BI dashboard was developed to visualize key marketing and customer insights.

#### Dashboard Highlights

* Customer demographics analysis
* Product performance tracking
* Marketing campaign effectiveness
* Customer engagement metrics
* Customer journey analysis
* Review sentiment distribution
* Sentiment by product and customer segment
* Geographic performance insights



## Key Business Questions Answered

* Which products perform best across customer segments?
* How do customer sentiments impact ratings?
* Which campaigns generate the highest engagement?
* What content types drive the most interactions?
* How do customer demographics influence purchasing behavior?
* Where are customers most engaged geographically?
* What stages of the customer journey require optimization?


