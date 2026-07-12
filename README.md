# Construction and Revonation-Operational-Performance-Dashboard
## Cost Overrun Tracking | Labor Efficiency | Subcontractor Analytics
![Alt Text](https://github.com/Lavonia697/Construction-and-Renovation-Operational-Performance-Dashboard/blob/main/screenshots/Renovation%20Performance%20Overview.png?raw=true)

---

## Project Overview
This project delivers end-to-end operational intelligence for a renovation company experiencing mild cost overruns and inconsistent profitability.

By building a relational SQL database pipeline and an interactive multi-page Power BI dashboard, this project integrates fragmented operational data across jobs, materials, and subcontractors to uncover hidden financial leakages and optimize site performance.

---

## The Business Problem
As renovation projects increase in volume and complexity, management lacks centralized visibility. Without transactional data analytics, it is difficult to monitor:
- Structural project profitability and creeping cost overruns.
- Workforce efficiency and crew cost disparities.
- Material waste and supply chain leakage.
- Subcontractor delays and vendor quality control.

  ---

  ## Tools & Technologies Used
  - **Excel:** Initial data cleaning, schema mapping, and cross-checking calculations via Pivot Tables.
  - **MySQL Workbench:** Relational database management, database schema creation, and deep analytical queries.
  - **Power BI Desktop:** Star schema data modelling, advanced DAX metrics, and interactive dashboard engineering.
 
---


## SQL Features
SQL analysis included:
- JOIN queries across operational tables
- labor cost analysis
- project profitability calculations
- material waste analysis
- subcontractor delay analysis
- aggregation and KPI calculations
- relational database modelling using primary and foreign keys

 ---

 ## SQL Script
 ```sql
 # crew performance analysis
SELECT 
    crew,
    COUNT(*) AS total_jobs,
    SUM(actual_duration) AS total_actual_duration,
    SUM(planned_duration) AS total_planned_duration,
    SUM(actual_duration - planned_duration) as total_duration_overrun,
    SUM(revenue) AS total_revenue,
    SUM(actual_cost) AS total_actual_cost,
        SUM(revenue - actual_cost) AS net_profit,
    SUM(actual_cost - budgeted_cost) AS total_cost_overrun,
    ROUND(AVG((actual_cost - budgeted_cost)/budgeted_cost)*100,2) AS avg_cost_variance_pct
FROM jobs
WHERE actual_duration > planned_duration
GROUP BY crew
ORDER BY total_duration_overrun DESC;
```
---

## Data Model
The Power BI model was designed using a star schema approach to improve analytical performance and maintain clean relationships between operational tables.

Dimension tables were used to organize crews, subcontractors, job types, and dates for scalable operational reporting.
![Alt Text](https://github.com/Lavonia697/Construction-and-Renovation-Operational-Intelligence-Dashboard/blob/main/Data%20Models/Power%20BI%20Model%20Screenshot.png?raw=true)

---

  ## Tables Used
 | Table | Purpose |
 | :--- | :--- |
 |Fact_Jobs    | Core renovation project data|
 |Fact_Labor   | Workforce hours and labor costs|
 |Fact_Material | Material usage and waste tracking|
 |Dim_Subcontractor | Subcontractor performance metrics|

 ---

## Power BI Dashboard Features
 Dashboard features included:
 - Executive KPI cards
 - Revenue and profitability analysis
- Cost overrun tracking
 - Project delay analysis
- Labor efficiency metrics
- Material usage and waste analysis
- Subcontractor performance analysis
- Dynamic slicers and drill-through functionality
- Multi-page operational reporting
  
---

## Key Metrics
| Metric | Description |
| :--- | :--- |
|Total Revenue    |Total project income|
|Net Profit       |Revenue after operational costs|
|Cost Overrun Rate |Budget vs actual cost variance|
|Avg Project Delay |Schedule performance tracking|
|Labor Cost        |Total financial spend on internal labor hours and crew wages|
|Material Waste    |Unused material quantity|
|Revenue per Labor Hour |Workforce efficiency metric|
|Revenue per FTE   |Revenue per standardized employee unit|
|Scrap Rate       |Wasted, discarded, or usable raw materials|

---

## Dashboard Pages
| Page | Focus |
| :--- | :--- |
|Executive Overview   |Revenue, profitability, delays, KPIs|
|Workforce & Materials Analysis  |Labor costs, hours, material waste|
|Subcontractor Performance       |Vendor delays, quality, reliability|

---

## Dashboard Screenshots
![Alt Text](https://github.com/Lavonia697/Construction-and-Renovation-Operational-Intelligence-Dashboard/blob/main/screenshots/Renovation%20Performance%20Overview.png?raw=true)
![Alt Text](https://github.com/Lavonia697/Construction-and-Renovation-Operational-Intelligence-Dashboard/blob/main/screenshots/Subcontractor%20Performance.png?raw=true)
![Alt Text](https://github.com/Lavonia697/Construction-and-Renovation-Operational-Intelligence-Dashboard/blob/main/screenshots/Workforce%20and%20Material%20Analysis.png?raw=true)

---

---

## Repository Structure
```
Renovation-Operational-Intelligence/
│
├── README.md
│
├── data/
│   └── renovation_dataset.csv
│
├── sql/
│   ├── table_creation.sql
│   ├── data_inserts.sql
│   ├── analysis_queries.sql
│
├── powerbi/
│   └── renovation_dashboard.pbix
│
├── images/
│   ├── dashboard_overview.png
│   ├── powerbi_model.png
│   ├── schema_diagram.png
│
└── insights/
    └── business_insights.md
```
---

## Key Business Insights
- Roofing renovations lead the business in revenue generation and labor utilization. However, severe cost overruns and schedule delays make it the least profitable sector, operating      at a low 17% margin.
- Severe variance exists across labor teams. Crew C alone accounts for a disproportionate 42% of all project labor costs.
- Tile Masters demonstrated top performance across all data metrics, achieving a 94% on time completion rate, a minimal 1.00-day average delay, and an outstanding 4.8/5.0 quality         rating
-  Data patterns indicate noticeable material waste, identifying an immediate opportunity for operational cost savings.

  ---
 
 ## Recommendations
 - Review the bidding and estimation process for roofing renovations since high revenue is being wiped out by cost overruns. Add realistic buffers to roofing schedules to mitigate the current delays and protect profitability.
  
- Recurring cost overruns may suggest that cost estimates for these project types may be inaccurate or that additional materials and labor requirements are not fully captured during planning, which may be overcome by improving cost estimation models or incorporating historical project data when budgeting to help reduce financial variance.

- Maximise the business relationship with Tile Masters by routing high-priority, margin-critical contracts with them. Analyse their scheduling and logistical workflows to establish a benchmark standard for underperforming subcontractors.

- Implement targeted inventory and material tracking protocols on job sites. Minimising material waste will directly improve the bottom-line profitability without requiring additional sales revenue.
  
- Investigate the root cause behind Crew C's 42% cost share. Determine if this variance stems from overstaffing, extended overtime, complex project assignments, or inefficiency. Standardise performance baselines across all crews to balance expenditures.


   





















  
