--select *
--from PortfolioProject..PersonOfYear

--Who was the Person of the Year for a 2003?
select name 
from PortfolioProject..PersonOfYear
where year = 2003

-- Youngest Person of the Year
SELECT TOP 1 Name, "Birth Year", Year - "Birth Year" AS Age, year 
where [Birth Year] is not null
ORDER BY Age ASC;

-- Oldest Person of the Year
SELECT TOP 1 Name, "Birth Year", Year - "Birth Year" AS Age, year 
from PortfolioProject..PersonOfYear
ORDER BY Age DESC;

-- Person of the year who are still alive 
select name
from PortfolioProject..PersonOfYear
where [Birth Year] is not null and [Death Year] is null

--How many individuals were honored in a specific category?
select category, count(category) as times
from PortfolioProject..PersonOfYear
group by Category
having count(category) > 0 
order by times desc

--polish poty
select year,name
from PortfolioProject..PersonOfYear
where country = 'Poland' 

-- average age of winner
select AVG([Year]-[Birth Year]) as age
from PortfolioProject..PersonOfYear
where [Birth Year] is not null 

-- people who won multiple times
SELECT Name, COUNT(*) AS Num_Honors
from PortfolioProject..PersonOfYear
GROUP BY Name
HAVING COUNT(*) > 1 
order by Num_Honors desc

--What is the total number of honors given to individuals from a specific country?
select country, count(*) as NoOfWins
from PortfolioProject..PersonOfYear
where country is not null
group by country
order by NoOfWins desc

--What is the distribution of titles?
SELECT Title, COUNT(*) AS Title_Count
from PortfolioProject..PersonOfYear
where title is not null
GROUP BY Title
ORDER BY Title_Count desc;

--How many honorees were dead at the time they received the honor?
select *
from PortfolioProject..PersonOfYear
where [Death Year] < Year

--Who are the top 10 most recent honorees(person)?
Select top 10 Year, name 
from PortfolioProject..PersonOfYear
where [Birth Year] is not null
order by year desc

