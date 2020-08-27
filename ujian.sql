use world;
-- 1
select * from city where countrycode='USA' order by population desc limit 10;
-- 2
select ci.ID, ci.district, co.name negara, ci.population from city ci, country co
where co.code=ci.Countrycode
order by ci.population desc limit 10;
-- 3
select cl.countrycode, co.name, cl.language,cl.isofficial, cl.percentage
from countrylanguage cl, country co
where cl.language='English' and cl.isofficial='T' and co.Code=cl.Countrycode
order by cl.percentage desc limit 10;
-- 4
select co.name, co.population, co.gnp/co.population GNPperCapita, co.capital, ci.population PendudukIbuKota
from country co, city ci
where co.region='southeast asia' and ci.id=co.capital
order by 3 desc;
-- 5
select name,continent,lifeexpectancy,gnp from country
where continent='asia' and lifeexpectancy>(select avg(lifeexpectancy) from country where continent='Europe')
order by lifeexpectancy desc;
-- 1.2.1
select name country_name, region, indepyear from country where continent='asia' and indepyear is not null order by indepyear limit 3;
-- 1.2.2
select name country_name, ((gnp-gnpold)/gnpold)*100 GNP_growth from country where continent='Europe' order by 2 desc limit 3;
-- 1.2.3
select c.name country_name, c.surfacearea surface_area, cl.language, cl.isofficial from country c, countrylanguage cl
where cl.language='english' and cl.isofficial='T' and c.code=cl.countrycode and c.surfacearea>= (select avg(surfacearea) from country where continent='europe')
order by 2 desc;
