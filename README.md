<img width="800" height="800" alt="Gemini_Generated_Image_b2n5dfb2n5dfb2n5" src="https://github.com/user-attachments/assets/d8c2a048-3ced-4e94-8c27-2e7937c2e814" />

# MediTrack: End-to-End Product Data Analytics

**Role**: Product Data Analyst
**Tools**: Python (Polars/Pandas,Plotly), SQL (BigQuery), Machine Learning (Scikit-Learn), Amplitude, Looker Studio, Figma.

## 🚀 Project Overview
**MediTrack** is a telemedicine app connecting patients with doctors for video consultations.
**The Problem**: Despite healthy sign-up rates, the app suffered from a 60% drop-off in the booking flow and high churn among new users.
**The Goal**: As the Product Analyst, I was tasked with analyzing the user journey, predicting churn, and proposing data-driven product improvements.

## 🏗️ Tech Stack
- Data Generation: Python (Faker, Numpy)
  
- Cloud & Data Warehouse: Google Cloud Platform (GCP), Google BigQuery

- Data Analysis & Manipulation: Python (with Polars)

- Data Visualization: Plotly

- Business Intelligence Dashboard: Google Looker Studio

- Machine Learning: Scikit-learn (Random Forest for Classification, Gradient Boosting for Regression)

- Interactive Web Application: Streamlit

- Behavioral Product Analytics: Amplitude

- Design Strategy: Figma

## 🔍 Key Insights & Analysis
### 1. The "Funnel of Death" (SQL & Amplitude)
I identified a critical bottleneck in the booking flow:
- **Insight: 60% of users drop off** after viewing a doctor's profile
  
- **Root Cause:** Users were clicking 'View Profile' only to find no availability, forcing them to go back and search again ('Pogo-sticking').

- **SQL Query Used:** CTE with Conditional Aggregation.

### 2. Churn Prediction Model (Python)
I built a Random Forest Classifier to identify at-risk users.
-**Top Feature:** Total_Events (Engagement) was the #1 predictor of retention.

-**Action:** Users with <5 events in Week 1 are now flagged for re-engagement email campaign.

### 3. User Segmentation
-**Insight:** Android users had a **15% lower retention rate** than iOS users

-**Recommendation:** Initiated a 'Bug Bash' sprint for the Android engineering team.

## 📊 Dashboards & Visualizations
### [Executive Dashboard (Looker Studio)](https://lookerstudio.google.com/reporting/a5cf21f4-7b9d-4ad0-81f2-8f0b55eaa23e)
Tracks Daily Active Users (DAU), Revenue, and Platform split.

### Streamlit 'Product Lab'
An interactive tool for the Product Team to test ML predictions.

## 🎨 Product Strategy: The "Quick-Book" Experiment
Based on the funnel data, I designed a UI experiment in Figma to reduce friction

**Variant A (Control)**

Current Design

<img width="390" height="844" alt="Variant A_ Current Design (High Churn)" src="https://github.com/user-attachments/assets/c52087d4-468c-4fac-9061-9e3c393f04e6" />

Users must click to see dates.




**Variant B (The Solution)**

Proposed Design

<img width="390" height="844" alt="Variant B_ The &#39;Quick-Book&#39; Experience" src="https://github.com/user-attachments/assets/3d3e364e-5f9a-4518-aacf-07aa00e9dd10" />

**Availability shown on Search Card.**

Includes '98% Match' ML Badge.


## How to Run this Project
### 1. Install Dependencies
Bash
pip install polars pandas plotly scikit-learn streamlit

### 2. Generate Data
Bash
python data_generation.py

### 3. Run the Dashboard
Bash
streamlit run dashboard.py







