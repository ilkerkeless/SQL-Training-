use AdventureWorksDW2012 

-- Her �r�ne (DimProduct) g�re toplam sat�� miktar�n� hesapla (FactInternetSales). 
--CTE kullanarak en �ok sat�� yapan ilk 5 �r�n� listele. 

/*;with Total as 
(select p.EnglishProductName ,SUM(f.SalesAmount) TotalSales from FactInternetSales f
inner join DimProduct p on f.ProductKey = p.ProductKey
Group By p.EnglishProductName)

select Top 5 * from Total
Order BY TotalSales Desc;*/



--Her y�l ve her ay i�in toplam sat�� (SalesAmount) de�erini bul.
--CTE kullanarak sadece 2020 y�l�na ait ayl�k sat��lar� getir.
/*;with YearMonthSales as
(select d.EnglishMonthName,d.CalendarYear , SUM(f.SalesAmount) TotalSales from FactInternetSales f
inner join DimDate d on f.OrderDateKey = d.DateKey
Group By  d.EnglishMonthName,d.CalendarYear)

select * from YearMonthSales  ys
Where ys.CalendarYear>2012
*/



--�rnek m��teri tablosu i�ine sahte bir m��teri ekleyip (hi� sipari� kayd� olmadan
-- Daha sonra hi� sipari� vermemi� m��teriyi bulal�m
 

/*INSERT INTO DimCustomer (CustomerKey, FirstName, LastName)
VALUES (99999, 'Ali', 'Sipari�siz');

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








 
