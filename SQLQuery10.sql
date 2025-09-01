use AdventureWorksDW2012 

-- Her ürüne (DimProduct) göre toplam satýþ miktarýný hesapla (FactInternetSales). 
--CTE kullanarak en çok satýþ yapan ilk 5 ürünü listele. 

/*;with Total as 
(select p.EnglishProductName ,SUM(f.SalesAmount) TotalSales from FactInternetSales f
inner join DimProduct p on f.ProductKey = p.ProductKey
Group By p.EnglishProductName)

select Top 5 * from Total
Order BY TotalSales Desc;*/



--Her yýl ve her ay için toplam satýþ (SalesAmount) deðerini bul.
--CTE kullanarak sadece 2020 yýlýna ait aylýk satýþlarý getir.
/*;with YearMonthSales as
(select d.EnglishMonthName,d.CalendarYear , SUM(f.SalesAmount) TotalSales from FactInternetSales f
inner join DimDate d on f.OrderDateKey = d.DateKey
Group By  d.EnglishMonthName,d.CalendarYear)

select * from YearMonthSales  ys
Where ys.CalendarYear>2012
*/



--Örnek müþteri tablosu içine sahte bir müþteri ekleyip (hiç sipariþ kaydý olmadan
-- Daha sonra hiç sipariþ vermemiþ müþteriyi bulalým
 

/*INSERT INTO DimCustomer (CustomerKey, FirstName, LastName)
VALUES (99999, 'Ali', 'Sipariþsiz');

;WITH TotalOrders AS
(
    SELECT c.FirstName,
           c.LastName,
           ISNULL(SUM(f.OrderQuantity), 0) AS TotalOrder
    FROM DimCustomer c
    LEFT JOIN FactInternetSales f 
        ON c.CustomerKey = f.CustomerKey
    GROUP BY c.FirstName, c.LastName
)
SELECT *
FROM TotalOrders
WHERE TotalOrder = 0
ORDER BY FirstName;*/








 
