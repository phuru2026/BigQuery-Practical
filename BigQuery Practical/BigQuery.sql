SELECT *
 FROM `project-7e5673c8-0d9a-431d-a43.1234.retail dataset`;


 ---Q1: Filter all the transactions that occured in the year 2023
 SELECT *
 FROM  `project-7e5673c8-0d9a-431d-a43.1234.retail dataset`
 WHERE EXTRACT(YEAR FROM Date) = 2023;

 ---Q2: Display all transactions where the total amount is more than the average total amount of the entire dataset
 SELECT*
 FROM `project-7e5673c8-0d9a-431d-a43.1234.retail dataset`
 WHERE `Total Amount` > (SELECT AVG(`Total Amount`) FROM `project-7e5673c8-0d9a-431d-a43.1234.retail dataset`);

 ---Q3: Calculating the total revenue
 SELECT SUM(`Price per Unit`*Quantity) AS Total_Revenue
 FROM `project-7e5673c8-0d9a-431d-a43.1234.retail dataset`;

 ---Q4: Display all distinct product categories in the dataset
 SELECT DISTINCT `Product Category`
 FROM `project-7e5673c8-0d9a-431d-a43.1234.retail dataset`;

 ---Q5: For each product category, calculate the total quantity sold
 SELECT `Product Category`,
        SUM(Quantity) AS Total_Quantity
FROM `project-7e5673c8-0d9a-431d-a43.1234.retail dataset`
GROUP BY `Product Category`;

---Q6: Create a column called Age_Group that classifies customers as: 'Youth' (<30),– 'Adult' (30–59),'Senior' (60+)
SELECT `Customer ID`,
        Age,
CASE
    WHEN Age < 30 THEN 'Youth'
    WHEN Age BETWEEN 30 AND 59 THEN 'Adult'
    ELSE 'Senior'
END AS Age_Group
FROM `project-7e5673c8-0d9a-431d-a43.1234.retail dataset`
GROUP BY `Customer ID`,
          Age;

---Q7: For each Gender, count how many high-value transactions occurred (where Total Amount > 500)
SELECT Gender,
      COUNT(CASE WHEN `Total Amount` > 500 THEN 1 END) AS High_value_transactions
FROM `project-7e5673c8-0d9a-431d-a43.1234.retail dataset`
GROUP BY Gender;

---Q8: For each Product Category, show only those categories where the total revenue exceeds 5,000
SELECT `Product Category`,
        SUM(`Price per Unit`*Quantity) AS Total_Revenue
FROM `project-7e5673c8-0d9a-431d-a43.1234.retail dataset`
GROUP BY`Product Category`
HAVING Total_Revenue > 5000;

---Q9: Display a new column called Unit_Cost_Category that labels a transaction as:'Cheap' if Price per Unit < 50, 'Moderate' if Price per Unit between 50 and 200, Expensive' if Price per Unit > 200
SELECT `Transaction ID`,
        `Price per Unit`,
CASE
    WHEN `Price per Unit` < 50 THEN 'Cheap'
    WHEN `Price per Unit` BETWEEN 50 AND 200 THEN 'Moderate'
    ELSE 'Expensive'
END AS Unit_Cost_Category
FROM `project-7e5673c8-0d9a-431d-a43.1234.retail dataset`
GROUP BY `Transaction ID`,
        `Price per Unit`;

---Q10: Display all transactions from customers aged 40 or older and add a column Spending_Level showing:'High' if Total Amount > 1000, 'Low' otherwise

SELECT `Customer ID`,
        Age,
        `Total Amount`,
CASE
    WHEN `Total Amount`> 1000 THEN 'HIGH'
    ELSE 'Low'
END AS Spending_level
FROM `project-7e5673c8-0d9a-431d-a43.1234.retail dataset`;
