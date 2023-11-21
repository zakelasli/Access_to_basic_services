Create table united_nations.Basic_services( 
Country_name Varchar(37),
Time_period integer,
Pct_managed_drinking_water_services numeric(5,2),
Pct_managed_sanitation_services numeric(5,2),
primary key(country_name, Time_period),
foreign key(country_name) references united_nations.geographic_location(country_name));

insert into united_nations.basic_services(Country_name,Time_period, Pct_managed_drinking_water_services, Pct_managed_sanitation_services)
select 
Country_name,
Time_period,
Pct_managed_drinking_water_services,
Pct_managed_sanitation_services
From united_nations.access_to_basic_services;

