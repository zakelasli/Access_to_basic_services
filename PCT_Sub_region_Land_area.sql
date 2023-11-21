-- PCT sub_region Land_area
SELECT 
Sub_region,
Country_name,
Land_area,
Round(Land_area/SUM(Land_area) over (partition by Sub_region)*100) AS PCT_Sub_region_Land_area
From united_nations.access_to_basic_services
Where Time_period = 2020
and Land_area;
-- AVG Population within sub_region per year
select 
Sub_region,
Time_period,
Est_population_in_millions,
Round(Avg (Est_population_in_millions) over (partition by Sub_region), 2) As AVG_population_by_subregion
FROM united_nations.access_to_basic_services
where Est_population_in_millions is not null
Order by Time_period;
-- Order countries from wrost to best in terms of levels of access to drinking water services per year
SELECT 
Country_name,
Time_period,
Pct_managed_drinking_water_services,
rank() over (Partition by Time_period  
Order by Pct_managed_drinking_water_services ASc) as Rank_of_water_services_per_country
from united_nations.access_to_basic_services

-- The PCT of managed water changes from one year to the next in every country
SELECT 
Country_name,
Time_period,
Pct_managed_drinking_water_services,
LAG(Pct_managed_drinking_water_services, 1, 0) OVER(partition by Country_name
order by Time_period Asc) As Perv_year_PCT_managed_drinking_water_services,
Pct_managed_drinking_water_services - LAG(Pct_managed_drinking_water_services, 1, 0) OVER(partition by Country_name
order by Time_period Asc) As ARC_PCT_managed_drinking_water_services
FROM united_nations.access_to_basic_services;




