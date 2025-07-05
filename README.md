# Analysis Report: Amazon Product Review Analysis

---

## 1. Background and Overview of the Analysis

**Purpose:**  
To analyze customer reviews on Amazon products in order to identify high-performing categories, understand sentiment trends, and guide eCommerce strategy through product and rating insights.

**Scope:**  
- Timeframe: Covers reviews from a multi-year dataset (assumed 2015–2020)  
- Data Source: CSV-based dataset of Amazon product reviews  
- Business Focus: Product category performance, customer satisfaction, and verified purchase trends

**Key Questions:**  
- Which product categories have the highest average ratings?  
- What categories or products have the most reviews?  
- Do verified purchases correlate with better ratings?  
- Which regions dominate review volume?

**Methodology:**  
Descriptive analytics using Microsoft Excel. Techniques include pivot tables, conditional formatting, charts, and filters to analyze review distribution, average ratings, and category-wise breakdowns.

---

## 2. Data Structure Overview

**Data Sources:**  
Manually imported CSV file containing Amazon product reviews.

**Variables Used:**  
- `Product Category` – Used to segment reviews  
- `Rating` – Numeric score between 1 and 5  
- `Verified Purchase` – Binary indicator  
- `Region` – Location metadata  
- `Review Text` – Not used for NLP but provides qualitative backing

**Data Quality:**  
- Minor missing values handled with filters  
- No advanced text cleaning required as analysis is quantitative  

**Tools & Technologies:**  
- Microsoft Excel  
- Excel Pivot Tables & Charts  
- Screenshot annotations for visuals

---

## 3. Executive Summary

**Top Findings:**  
- Electronics and Books have the highest average ratings (4.5+).  
- Verified purchases tend to have higher ratings (avg. 4.2) than unverified ones.  
- Some product categories with the highest review counts (e.g., Apparel) also had the most polarized ratings.

**Business Impact:**  
- High-rated categories present upselling and cross-promotional opportunities.  
- Identifying negative review patterns can reduce churn and increase conversion.

**Success Metrics:**  
- Average product rating by category  
- Total number of reviews  
- Verified vs. unverified review rating comparison

---

## 4. Insights Deep Dive

**Trends & Patterns:**  
- Verified purchases skew more positively across all categories  
- Home & Kitchen products had seasonal review peaks (e.g., holidays)

**Root Causes:**  
- Delivery issues and packaging complaints caused most 1–2 star ratings  
- Low-rated products often had high return rates (not quantified but mentioned)

**Benchmarking:**  
- Compared top category ratings to known Amazon top sellers (assumed)

**Outliers & Exceptions:**  
- Several products with fewer reviews (<10) showed suspiciously perfect ratings—potential bias or inflated feedback.

---

## 5. Recommendations

**Actionable Steps:**  
- Focus marketing on Electronics and Books  
- Improve packaging/logistics for low-rated categories  
- Encourage verified reviews via post-purchase follow-ups

**Ownership:**  
- Marketing: Product promotions  
- Logistics: Address packaging issues  
- Customer Experience: Post-purchase engagement

**Timeline:**  
- Quick wins (within 2 weeks): Email follow-ups for verified reviews  
- Medium-term (1 month): Improve logistics feedback loops

**Risks & Mitigations:**  
- Bias from incomplete review data → Cross-check with seller data  
- Reviewer fraud (perfect scores) → Flag products with low volume but perfect reviews
