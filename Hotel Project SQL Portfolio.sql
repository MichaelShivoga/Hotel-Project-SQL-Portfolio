

--USING CTE Table and Union Expression to Determine yearly revenue

Select *
From dbo.['2018$']

Select *
From dbo.['2019$']

Select *
From dbo.['2020$']

--Using Union to join all the tables

Select *
From dbo.['2018$']
Union
Select *
From dbo.['2019$']
Union
Select *
From dbo.['2020$']

--Creating a CTE Table

With CTE_Hotel as 
(Select *
From dbo.['2018$']
Union
Select *
From dbo.['2019$']
Union
Select *
From dbo.['2020$'])

Select*
From CTE_Hotel

--Is the hotel Revenue Growing by Year and Hotel Type?


With CTE_Hotel as 
(Select *
From dbo.['2018$']
Union
Select *
From dbo.['2019$']
Union
Select *
From dbo.['2020$'])

Select arrival_date_year, hotel, round(Sum((stays_in_weekend_nights + stays_in_week_nights)* adr),2) as revenue
From CTE_Hotel
group by arrival_date_year, hotel

--Joining based on Market Segment
--To be transferred to Power Bi for visualization

With CTE_Hotel as 
(Select *
From dbo.['2018$']
Union
Select *
From dbo.['2019$']
Union
Select *
From dbo.['2020$'])

Select*
From CTE_Hotel
left join dbo.market_segment$
	on CTE_Hotel.market_segment = market_segment$.market_segment
left join dbo.meal_cost$
	on dbo.meal_cost$.meal = CTE_Hotel.meal


