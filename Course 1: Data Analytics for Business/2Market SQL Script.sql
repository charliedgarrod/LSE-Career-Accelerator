-- Creating the marketing data table
create table marketing_data(
	id integer,
	year_birth integer,
	age integer,
	education varchar(100),
	marital_status varchar(100),
	income numeric,
	kidhome integer,
	teenhome integer,
	totalchildhome integer,
	recency integer,
	amount_liquids integer,
	amount_veg integer,
	amount_nonveg integer,
	amount_fish integer,
	amount_choc integer,
	date_customer date,
	amount_commodities integer,
	num_of_deals integer,
	num_web_buy integer,
	num_store_buy integer,
	num_web_visits integer,
	response integer,
	complaints integer,
	country varchar(50),
	count_lead_conv integer
);


-- Creating the ad data table
create table ad_data(
	id integer,
	bulkmail_ad integer,
	twitter_ad integer,
	insta_ad integer,
	fb_ad integer,
	brochure_ad integer
);

-- Updating the country codes to reflect the full names of the country
update marketing_data
set country = 'Spain'
where country = 'SP';

update marketing_data
set country = 'South Africa'
where country = 'SA';

update marketing_data
set country = 'Canada'
where country = 'CA';

update marketing_data
set country = 'Australia'
where country = 'AUS';

update marketing_data
set country = 'India'
where country = 'IND';

update marketing_data
set country = 'Germany'
where country = 'GER';

update marketing_data
set country = 'United States of America'
where country = 'US';

update marketing_data
set country = 'Montenegro'
where country = 'ME';

-- Total spend by country
select country,
sum(amount_liquids + amount_veg + amount_nonveg 
	+ amount_fish + amount_choc + amount_commodities) as total_spend
from marketing_data
group by 1
order by total_spend desc;

-- Total spend by country and per capita
select country,
sum(amount_liquids + amount_veg + amount_nonveg 
	+ amount_fish + amount_choc + amount_commodities) as total_spend,
sum(amount_liquids + amount_veg + amount_nonveg 
	+ amount_fish + amount_choc + amount_commodities)/count(*) as total_spend_per_capita
from marketing_data
group by 1
order by total_spend_per_capita desc;

-- Product sales by age bracket
select
case
	when age between 20 and 30 then '20-30'
	when age between 31 and 40 then '31-40'
	when age between 41 and 50 then '41-50'
	when age between 51 and 60 then '51-60'
	when age between 61 and 70 then '61-70'
	else ' Over 70'
end as age_bracket,
sum(amount_liquids) as alcohol,
	sum(amount_veg) as vegetables,
	sum(amount_nonveg) as non_vegetable_products,
	sum(amount_fish) as fish,
	sum(amount_choc) as chocolate,
	sum(amount_commodities) as commodities,
	sum(amount_liquids + amount_veg + amount_nonveg + 
		amount_fish + amount_choc + amount_commodities) as total_sales
from marketing_data
group by age_bracket
order by total_sales desc;

-- Total spend by country
select country,
	sum(amount_liquids) as alcohol,
	sum(amount_veg) as vegetables,
	sum(amount_nonveg) as non_vegetable_products,
	sum(amount_fish) as fish,
	sum(amount_choc) as chocolate,
	sum(amount_commodities) as commodities,
	sum(amount_liquids + amount_veg + amount_nonveg + 
		amount_fish + amount_choc + amount_commodities) as total_sales
from marketing_data
group by country
order by total_sales desc;

-- Total spend by product category by marital status
select marital_status,
	sum(amount_liquids) as alcohol,
	sum(amount_veg) as vegetables,
	sum(amount_nonveg) as non_vegetable_products,
	sum(amount_fish) as fish,
	sum(amount_choc) as chocolate,
	sum(amount_commodities) as commodities,
	sum(amount_liquids + amount_veg + amount_nonveg + 
		amount_fish + amount_choc + amount_commodities) as total_sales
from marketing_data
group by 1, education
order by total_sales desc;

-- Total spend by product category by education level
select education,
	sum(amount_liquids) as alcohol,
	sum(amount_veg) as vegetables,
	sum(amount_nonveg) as non_vegetable_products,
	sum(amount_fish) as fish,
	sum(amount_choc) as chocolate,
	sum(amount_commodities) as commodities,
	sum(amount_liquids + amount_veg + amount_nonveg + 
		amount_fish + amount_choc + amount_commodities) as total_sales
from marketing_data
group by 1
order by total_sales desc;

-- Product sales by marital status and number of children
select marital_status,
case
	when totalchildhome = 0 then 'No Children'
	when totalchildhome = 1 then '1 Child'
	when totalchildhome = 2 then '2 Children'
	when totalchildhome = 3 then '3 Children'
end as no_of_children,
sum(amount_liquids) as alcohol,
	sum(amount_veg) as vegetables,
	sum(amount_nonveg) as non_vegetable_products,
	sum(amount_fish) as fish,
	sum(amount_choc) as chocolate,
	sum(amount_commodities) as commodities,
	sum(amount_liquids + amount_veg + amount_nonveg + 
		amount_fish + amount_choc + amount_commodities) as total_sales
from marketing_data
group by marital_status, totalchildhome
order by no_of_children desc, total_sales desc;

-- Traiditonal media vs social media channels 
select marital_status,
	sum(ad.twitter_ad + ad.insta_ad + ad.fb_ad) as social_media,
	sum(ad.bulkmail_ad + ad.brochure_ad) as traditional_promotions
from marketing_data
join ad_data ad
using (id)
group by marital_status;

-- The most effective social media ad campaigns by country
select marital_status, 
	sum(ad.twitter_ad) as twitter, 
	sum(ad.insta_ad) as instagram,
	sum(ad.fb_ad) as facebook
from marketing_data md
left join ad_data ad
using (id)
group by marital_status;

-- Which social media channel generated the most ad revenue in the form of customer spend by country
with ad_revenue as (
	select  
		md.country,
		sum(case when ad.insta_ad > 0 then md.amount_liquids + md.amount_veg + md.amount_nonveg + md.amount_fish + md.amount_choc + md.amount_commodities else 0 end) as total_insta,
		sum(case when ad.twitter_ad > 0 then md.amount_liquids + md.amount_veg + md.amount_nonveg + md.amount_fish + md.amount_choc + md.amount_commodities else 0 end) as total_twitter,
		sum(case when ad.fb_ad > 0 then md.amount_liquids + md.amount_veg + md.amount_nonveg + md.amount_fish + md.amount_choc + md.amount_commodities else 0 end) as total_facebook,
		sum(case when ad.bulkmail_ad > 0 then md.amount_liquids + md.amount_veg + md.amount_nonveg + md.amount_fish + md.amount_choc + md.amount_commodities else 0 end) as total_bulkmail,
		sum(case when ad.brochure_ad > 0 then md.amount_liquids + md.amount_veg + md.amount_nonveg + md.amount_fish + md.amount_choc + md.amount_commodities else 0 end) as total_brochure,
		sum(md.amount_liquids + md.amount_veg + md.amount_nonveg + md.amount_fish + md.amount_choc + md.amount_commodities) as total_spend
	from ad_data ad 
	join marketing_data md
		using (id)
	group by md.country
)

select ar.country,
	ar.total_insta,
	ar.total_twitter,
	ar.total_facebook,
	ar.total_bulkmail,
	ar.total_brochure,
	sum(ar.total_insta + ar.total_twitter + ar.total_facebook + ar.total_bulkmail + ar.total_brochure) as total_all_channels,
	round(cast(sum(ar.total_insta + ar.total_twitter + ar.total_facebook + ar.total_bulkmail + ar.total_brochure)/ar.total_spend * 100 as numeric),0) as percent_of_spend,
	ar.total_spend
from ad_revenue ar
group by ar.country, ar.total_insta, ar.total_twitter, ar.total_facebook, ar.total_bulkmail, ar.total_brochure, ar.total_spend
order by ar.total_spend desc;
