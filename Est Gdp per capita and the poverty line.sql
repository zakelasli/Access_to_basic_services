SELECT DISTINCT
    Country_name,
    Time_period,
    Est_population_in_millions,
    Est_gdp_in_billions,
    (Est_gdp_in_billions/Est_population_in_millions)*1000 AS Est_gdp_per_capita,
    IF(Time_period < 2017, 1.90, 2.50) AS Poverty_line,
    CASE
        WHEN (Est_gdp_in_billions/Est_population_in_millions)*(1000/365.25) < IF(Time_period < 2017, 1.90, 2.50)
        THEN "Low"
        WHEN (Est_gdp_in_billions/Est_population_in_millions)*(1000/365.25) > IF(Time_period < 2017, 1.90, 2.50)
        THEN "High"
        ELSE "Medium"
    END AS Income_group
FROM united_nations.access_to_basic_services
WHERE Est_gdp_in_billions IS NOT NULL;
