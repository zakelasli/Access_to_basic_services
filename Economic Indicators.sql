Create Table united_nations.Economic_Indicators(
Country_name varchar(37),
Time_period integer,
Est_population_in_millions Numeric(5,2),
Est_gdp_in_billions numeric(5,2),
primary key (country_name, Time_period),
foreign key (Country_name) references united_nations.basic_services(country_name));

insert into united_nations.economic_indicators(country_name, Time_period, Est_population_in_millions, Est_gdp_in_billions)
select 
country_name,
time_period,
Est_population_in_millions,
Est_gdp_in_billions
From united_nations.access_to_basic_services;

Alter table united_nations.economic_indicators
modify column Est_gdp_in_billions numeric(10,2);
