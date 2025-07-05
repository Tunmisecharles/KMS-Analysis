# Analysis Report: Kultra Mega Stores Inventory SQL Analysis

---

## 1. Background and Overview of the Analysis

**Purpose:**  
To analyze order, sales, and logistics data for Kultra Mega Stores (KMS) Abuja division to identify opportunities for revenue optimization, shipping efficiency, and customer segmentation.

**Scope:**  
- Timeframe: 2009 to 2012  
- Business Unit: KMS Abuja (part of a larger national chain)  
- Dataset: Orders, products, customer segments, profits, and shipping data

**Key Questions:**  
- Which products and customers drive the most sales and profit?  
- Which regions underperform or outperform?  
- Is shipping cost aligned with order urgency (priority)?  
- What are the top inefficiencies or missed opportunities?

**Methodology:**  
Descriptive and comparative SQL analysis using Microsoft SQL Server. SQL queries were written to group, aggregate, and filter data by key dimensions such as Product Category, Segment, and Ship Mode.

---

## 2. Data Structure Overview

**Data Sources:**  
- CSV file imported into SQL Server using SSMS  
- Table Name: `KMS_Orders`

**Variables Used:**  
- `Sales`, `Profit`, `ShippingCost` – Key financial metrics  
- `OrderPriority`, `ShipMode` – Delivery urgency and method  
- `Segment`, `CustomerName` – For profiling  
- `Region`, `ProductCategory` – For performance by geography/product

**Data Quality:**  
- Converted textual currency fields to numeric (e.g., Sales, ShippingCost)  
- Filtered and grouped for clean aggregations  
- Cleaned misaligned column types (e.g., `ShippingCost` as `NVARCHAR`)

**Tools & Technologies:**  
- Microsoft SQL Server  
- T-SQL queries  
- Manual result interpretation with tabular outputs  
- Optional: screenshots of outputs for documentation

---

## 3. Executive Summary

**Top Findings:**  
- Office Supplies had the highest total sales across categories.  
- Delivery Truck, the cheapest method, was used often even for high-priority orders.  
- A small group of Corporate customers generated a majority of profit.

**Business Impact:**  
- Inefficient shipping increased costs and potentially delayed critical deliveries.  
- Under-leveraged segments (e.g., Small Business) could be optimized with targeted strategies.

**Success Metrics:**  
- Total sales by category, region  
- Profit per customer/segment  
- Shipping cost by method and priority

---

## 4. Insights Deep Dive

**Trends & Patterns:**  
- Regular Air was the most used shipping method across all priority levels  
- High-priority orders (Critical, High) used Delivery Truck far too often  
- Consumer customers had higher return rates compared to Corporate

**Root Causes:**  
- Lack of policy enforcement on shipping method vs. order priority  
- High number of low-spending customers with no personalized engagement

**Benchmarking:**  
- Compared order counts and profits between segments  
- Identified mismatches in order priority vs. delivery mode

**Outliers & Exceptions:**  
- A few customers with low sales but unusually high shipping costs (possible error or special case orders)

---

## 5. Recommendations

**Actionable Steps:**  
- Implement rules to restrict shipping modes based on order priority  
- Target bottom 10 customers with loyalty programs or incentives  
- Focus on profitable Corporate accounts with retention campaigns

**Ownership:**  
- Operations: Shipping policy redesign  
- Sales: Customer targeting and loyalty programs  
- IT/Data: Automate shipping constraints in ordering system

**Timeline:**  
- Phase 1 (1 month): Shipping policy enforcement  
- Phase 2 (2–3 months): Customer engagement rollout

**Risks & Mitigations:**  
- Customer pushback on shipping limits → Allow override with manager approval  
- Data accuracy issues → Validate shipping cost records quarterly
