
-- Seleting Data to work on

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM [Portfolio Project]..CovidDeaths
ORDER BY 1, 2

-- Total Cases vs Total Deaths (Percentage of Deaths)
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases) * 100 AS DeathRatio
FROM [Portfolio Project]..CovidDeaths
ORDER BY location, date DESC

-- Extracting Countires (Excluding Continent-Wise Data) with respect to Population
SELECT location, MAX(population) AS Population
FROM [Portfolio Project]..CovidDeaths
WHERE continent is not NULL
GROUP BY location
ORDER by population DESC

-- Total cases vs populations (Percentage of People getting COVID 19)
SELECT location, date, total_cases, (total_cases/population) * 100 AS COVIDRatio
FROM [Portfolio Project]..CovidDeaths
ORDER BY location, date DESC

-- Look at the highet Infection rate in Percentage
SELECT location,Population, MAX(total_cases) AS HighestInfectionRate, MAX((total_cases/population) * 100) AS COVID_HighestReach_PERCENTAGE
FROM [Portfolio Project]..CovidDeaths
-- WHERE location = 'Pakistan'
Group by Location, Population
ORDER BY COVID_HighestReach_PERCENTAGE DESC

-- Total Number of Countries with Highest Death Count per population

SELECT location, MAX(cast(total_deaths as int)) AS HighestDeathRate
FROM [Portfolio Project]..CovidDeaths
-- WHERE location = 'Pakistan'
WHERE continent is not NULL 
Group by Location 
ORDER BY HighestDeathRate DESC

-- Showing the continents with hgihest Death Count

SELECT location, MAX(cast(total_deaths as int)) AS HighestDeathRate
FROM [Portfolio Project]..CovidDeaths
-- WHERE location = 'Pakistan'
WHERE continent is NULL 
Group by location
ORDER BY HighestDeathRate DESC


-- Showing the Countries with hgihest Infection Count
Select location, population, MAX(cast(total_cases as int)) AS 'Total Cases'
FROM [Portfolio Project]..CovidDeaths
WHERE continent is not NULL
Group by location, population
Order by 'Total Cases' DESC

-- Showing the Countinents with hgihest Infection Count
Select location, Population, MAX(cast(total_cases as int)) AS 'Total Infection Cases'
FROM [Portfolio Project]..CovidDeaths
WHERE continent is NULL
Group by location, population
Order by 'Total Infection Cases' DESC

-- Global Total Covid Cases and Deaths
Select SUM(New_cases) AS 'Total Global Cases', SUM(cast(new_deaths as int)) AS 'Total Global Deaths', (SUM(cast(new_deaths as int))/SUM(New_cases))*100 AS 'Total Global Percentage'
FROM [Portfolio Project]..CovidDeaths
WHERE continent is not NULL
-- Group by location, population
-- Order by 'Total Cases' DESC

-- GLOBAL Total ICU admissions of COVID Patients
SELECT SUM(cast(icu_patients as int)) AS 'Total Patients Admitted in ICU'
FROM [Portfolio Project]..CovidDeaths
WHERE continent is not null

-- Country Wise ICU Admissions
SELECT Location, SUM(cast(icu_patients as int)) AS 'Total Patients In ICU'
FROM [Portfolio Project]..CovidDeaths
WHERE continent is not null
GROUP BY Location
ORDER BY 2 DESC
-- Total People Vaccinated Country-wise
SELECT location, SUM(cast(total_vaccinations as bigint)) AS 'Total People Vaccinated'
FROM [Portfolio Project]..CovidVaccinations
WHERE continent is not null
GROUP BY location
ORDER BY 'Total People Vaccinated' Desc

