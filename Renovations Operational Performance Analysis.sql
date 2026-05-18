# creating the renovations analytics database
CREATE DATABASE renovations_analytics;

# setting the renovations analytics database a default database for existing session
USE renovations_analytics;

# creating jobs table
CREATE TABLE jobs (
    job_id VARCHAR(5) PRIMARY KEY,
    job_type VARCHAR(20),
    start_date DATE,
      planned_duration INT,
    actual_duration INT,
    budgeted_cost DECIMAL(12,2),
    actual_cost DECIMAL(12,2),
        revenue DECIMAL(12,2),
    crew VARCHAR(5),
    subcontractor VARCHAR(50),
    project_month INT,
    quarter INT
    );
    
# inserting into jobs table
INSERT INTO jobs VALUES
('J001','Kitchen','2025-01-05',10,11,50000,52000,65000,'A','Elite Electrical',1,1),
('J002','Bathroom','2025-01-12',8,8,30000,29500,42000,'B','Modern Roof',1,1),
('J003','Roofing','2025-02-02',12,14,60000,68000,75000,'C','Perfect Plumbing',2,1),
('J004','Painting','2025-02-15',6,5,15000,14000,25000,'A','Tile Masters',2,1),
('J005','Flooring','2025-03-01',9,10,35000,37000,48000,'B','Prime Painting',3,1),
('J006','Kitchen','2025-04-10',11,12,52000,56000,68000,'A','Elite Electrical',4,2),
('J007','Roofing','2025-04-20',13,15,62000,70000,77000,'C','Perfect Plumbing',4,2),
('J008','Bathroom','2025-05-05',8,9,32000,35000,45000,'B','Modern Roof',5,2),
('J009','Painting','2025-05-18',5,6,14000,15000,24000,'A','Tile Masters',5,2),
('J010','Flooring','2025-07-01',10,12,36000,42000,50000,'B','Prime Painting',7,3),
('J011','Roofing','2025-07-14',12,16,64000,75000,80000,'C','Perfect Plumbing',7,3),
('J012','Kitchen','2025-08-02',11,13,53000,58000,69000,'A','Elite Electrical',8,3),
('J013','Bathroom','2025-10-05',9,11,33000,38000,46000,'B','Modern Roof',10,4),
('J014','Roofing','2025-11-12',12,17,65000,78000,82000,'C','Perfect Plumbing',11,4),
('J015','Painting','2025-12-01',6,7,16000,18000,26000,'A','Tile Masters',12,4);

# update the jobs table
UPDATE jobs
SET subcontractor = 'Modern Roofing'
where subcontractor = 'Modern Roof';

# creating labor table
CREATE TABLE labor (
	labor_id INT AUTO_INCREMENT PRIMARY KEY,
	job_id VARCHAR(10),
	crew_name VARCHAR(10),
	total_hours_worked INT,
	hourly_rate DECIMAL(8,2),
	total_labor_cost DECIMAL(12,2),
	FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

# inserting data into labor table
INSERT INTO labor
(labor_id, job_id, crew_name, total_hours_worked, hourly_rate, total_labor_cost)

VALUES
(1, 'J001', 'A', 120, 180, 21600),
(2, 'J002', 'B', 95, 170, 16150),
(3, 'J003', 'C', 140, 190, 26600),
(4, 'J004', 'A', 100, 180, 18000),
(5, 'J005', 'B', 110, 175, 19250),
(6, 'J006', 'C', 130, 200, 26000),
(7, 'J007', 'A', 90, 180, 16200),
(8, 'J008', 'B', 115, 175, 20125),
(9, 'J009', 'A', 88, 180, 15840),
(10, 'J010', 'B', 115, 190, 21850),
(11, 'J011', 'C', 96, 175, 16800),
(12, 'J012', 'A', 105, 180, 18900),
(13, 'J013', 'B', 120, 200, 24000),
(14, 'J014', 'C', 92, 185, 17020),
(15, 'J015', 'A', 110, 195, 21450);

# creating materials table
CREATE TABLE materials (
    material_id INT AUTO_INCREMENT PRIMARY KEY,
    job_id VARCHAR(10),
    material_type VARCHAR(100),
    quantity_ordered INT,
    quantity_used INT,
    unit_cost DECIMAL(10,2),
    supplier VARCHAR(100),
        FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

# inserting data into materials table
INSERT INTO materials
(material_id, job_id, material_type, quantity_ordered, quantity_used, unit_cost, supplier)

VALUES
(1, 'J001', 'Tiles', 100, 90, 120, 'BuildMart'),
(2, 'J002', 'Paint', 50, 45, 80, 'ColorPro'),
(3, 'J003', 'Wood', 70, 65, 150, 'TimberMax'),
(4, 'J004', 'Cement', 40, 38, 95, 'BuildMart'),
(5, 'J005', 'Tiles', 120, 110, 120, 'TileHouse'),
(6, 'J006', 'Paint', 60, 55, 80, 'ColorPro'),
(7, 'J007', 'Wood', 90, 82, 150, 'TimberMax'),
(8, 'J008', 'Cement', 45, 40, 95, 'BuildMart');


# creating subcontractors table
CREATE TABLE subcontractors (
    subcontractor_name VARCHAR(100) PRIMARY KEY,
    specialty VARCHAR(100),
    avg_on_time_percentage DECIMAL(5,2),
    avg_delay_days DECIMAL(4,2),
    quality_rating DECIMAL(3,1),
    cost_reliability_score DECIMAL(3,1)
);

# inserting data into subcontractors table
INSERT INTO subcontractors
(subcontractor_name, specialty, avg_on_time_percentage,
avg_delay_days, quality_rating, cost_reliability_score)

VALUES
('Elite Electrical', 'Electrical', 92, 1.5, 4.6, 4.4),
('Perfect Plumbing', 'Plumbing', 88, 2.1, 4.3, 4.1),
('Modern Roofing', 'Roofing', 85, 3.0, 4.0, 3.8),
('Tile Masters', 'Tiling', 94, 1.0, 4.8, 4.5),
('Prime Painting', 'Painting', 90, 1.8, 4.5, 4.2);

# connects labor table with jobs table via job id
ALTER TABLE labor
ADD CONSTRAINT fk_labor_job
FOREIGN KEY (job_id)
REFERENCES jobs(job_id);

# connects materials table with jobs table via job id
ALTER TABLE materials
ADD CONSTRAINT fk_materials_job
FOREIGN KEY (job_id)
REFERENCES jobs(job_id);

# connects jobs table with subcontractors table via subcontractor
ALTER TABLE jobs
ADD CONSTRAINT fk_subcontractor
FOREIGN KEY (subcontractor)
REFERENCES subcontractors(subcontractor_name);

# crew vs labor cost
SELECT
j.job_type,
l.crew_name,
SUM(l.total_labor_cost) AS labor_cost
FROM jobs j
JOIN labor l
ON j.job_id = l.job_id
GROUP BY j.job_type, l.crew_name
ORDER BY labor_cost DESC;

# project profitability after labor costs
SELECT
j.job_id,
j.revenue,
j.actual_cost,
l.total_labor_cost,
(j.revenue - j.actual_cost - l.total_labor_cost) AS net_profit
FROM jobs j
JOIN labor l
ON j.job_id = l.job_id
ORDER BY net_profit DESC;

# labor cost by crew
SELECT
	crew_name,
	SUM(total_labor_cost) AS labor_cost
FROM labor
GROUP BY crew_name;

# material waste analysis
SELECT
material_type,
SUM(quantity_ordered - quantity_used) AS waste
FROM materials
GROUP BY material_type;

# best subcontractor performance
SELECT
subcontractor_name,
avg_on_time_percentage,
quality_rating
FROM subcontractors
ORDER BY avg_on_time_percentage DESC;

# total revenue, cost & profit
SELECT 
    SUM(revenue) AS total_revenue,
    SUM(actual_cost) AS total_cost,
    SUM(revenue - actual_cost) AS total_profit,
    ROUND((SUM(revenue - actual_cost)/SUM(revenue))*100,2) AS profit_margin_pct
FROM jobs;

# over-budget projects
SELECT 
    job_id,
    job_type,
    budgeted_cost,
    actual_cost,
    ROUND(((actual_cost - budgeted_cost)/budgeted_cost)*100,2) AS cost_variance_pct
FROM jobs
WHERE actual_cost > budgeted_cost
ORDER BY cost_variance_pct DESC;

# profitability by job type
SELECT 
    job_type,
    COUNT(*) AS total_jobs,
    SUM(revenue - actual_cost) AS total_profit,
    ROUND(AVG((revenue - actual_cost)/revenue)*100,2) AS avg_margin_pct
FROM jobs
GROUP BY job_type
ORDER BY avg_margin_pct ASC;

# quarterly profit trend
SELECT 
    quarter,
    SUM(revenue) AS revenue,
    SUM(actual_cost) AS cost,
    SUM(revenue - actual_cost) AS profit
FROM jobs
GROUP BY quarter
ORDER BY quarter;

# cost inflation trend ( average cost per quarter)
SELECT 
    quarter,
    ROUND(AVG(actual_cost),2) AS avg_actual_cost
FROM jobs
GROUP BY quarter
ORDER BY quarter;

# crew performance analysis
SELECT 
    crew,
    COUNT(*) AS total_jobs,
    SUM(actual_cost > budgeted_cost) AS overrun_jobs,
    ROUND(AVG((actual_cost - budgeted_cost)/budgeted_cost)*100,2) AS avg_cost_variance_pct
FROM jobs
GROUP BY crew
ORDER BY avg_cost_variance_pct DESC;

# schedule variance by crew
SELECT 
    crew,
    ROUND(AVG(actual_duration - planned_duration),2) AS avg_delay_days
FROM jobs
GROUP BY crew
ORDER BY avg_delay_days DESC;

# top 5 least profitability projects
SELECT 
    job_id,
    job_type,
    revenue - actual_cost AS profit
FROM jobs
ORDER BY profit ASC
LIMIT 5;

# projects with both cost & schedule overruns
SELECT 
    job_id,
    crew,
    job_type,
    actual_cost,
    budgeted_cost,
    actual_duration,
    planned_duration
FROM jobs
WHERE actual_cost > budgeted_cost
AND actual_duration > planned_duration;

# quarter with worst average margin
SELECT 
    quarter,
    ROUND(AVG((revenue - actual_cost)/revenue)*100,2) AS avg_margin_pct
FROM jobs
GROUP BY quarter
ORDER BY avg_margin_pct ASC
LIMIT 1;

# overall project performance
SELECT 
COUNT(job_id) AS total_projects,
	SUM(revenue) AS total_revenue,
	SUM(actual_cost) AS total_cost,
	SUM(revenue - actual_cost)  total_profit 
from jobs;

# project overruns
SELECT 
	job_id,
	budgeted_cost,
	actual_cost,
	actual_cost - budgeted_cost AS cost_overrun,
	ROUND(((actual_cost - budgeted_cost) / budgeted_cost)*100,2) AS cost_overrun_pct
FROM  jobs
WHERE actual_cost > budgeted_cost;

# total profit by job type
SELECT
	job_type,
	SUM(revenue - actual_cost) AS total_profit
FROM jobs
GROUP BY job_type
ORDER BY total_profit DESC;

# delay analysis
SELECT 
    job_id,
    planned_duration,
    actual_duration,
    (actual_duration - planned_duration) AS delay_days,
    actual_cost - budgeted_cost AS cost_variance
FROM jobs
ORDER BY delay_days DESC;

# jobs with cost and schedule overruns
SELECT 
    job_id,
    crew,
    job_type
FROM jobs
WHERE actual_cost > budgeted_cost
AND actual_duration > planned_duration;

