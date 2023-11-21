SELECT 
CASE 
when Country_name in (
"Angola", "Botswana","Comoros","Decmocratic Republic of Congo","Eswatini","Lesotho","Madagascar","Malawi","Mauritius","Mozambique","Namibia","Seychelles","South Africa","United Republic Tanzania","Zambia","Zimbabwe")
Then "SADC"
When Country_name in ( "Morocco","Algeria","Tunisia","Libya","Mauritania")
Then "UMA"
ELSE "Not Classified"
End As Regional_Economic_Community,
Min(Pct_managed_drinking_water_services) As Min_Pct_managed_drinking_water_services,
avg(Pct_managed_drinking_water_services) AS AVG_Pct_managed_drinking_water_services,
Max(Pct_managed_drinking_water_services) AS Max_Pct_managed_drinking_water_services
FROM united_nations.access_to_basic_services
Where Region like '%Africa%'
Group by CASE 
when Country_name in (
"Angola", "Botswana","Comoros","Decmocratic Republic of Congo","Eswatini","Lesotho","Madagascar","Malawi","Mauritius","Mozambique","Namibia","Seychelles","South Africa","United Republic Tanzania","Zambia","Zimbabwe")
Then "SADC"
When Country_name in ( "Morocco","Algeria","Tunisia","Libya","Mauritania")
Then "UMA"
ELSE "Not Classified"
End;