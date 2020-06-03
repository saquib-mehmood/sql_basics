## 2. Subqueries ##

SELECT Major, Unemployment_rate
  FROM recent_grads
 WHERE Unemployment_rate < (SELECT AVG(Unemployment_rate) FROM recent_grads)
 ORDER BY Unemployment_rate;

## 3. Subquery In SELECT ##

SELECT CAST (COUNT (*) as FLOAT) / CAST((SELECT COUNT (*) FROM recent_grads) as FLOAT) AS proportion_abv_avg
  FROM recent_grads
 WHERE ShareWomen > (SELECT AVG(ShareWomen) FROM recent_grads); 

## 4. Returning Multiple Results In Subqueries ##

SELECT Major , Major_category
  FROM recent_grads
 WHERE Major_category IN (SELECT Major_category FROM recent_grads GROUP BY Major_category ORDER BY SUM(Total) DESC LIMIT 5); 

## 5. Building Complex Subqueries ##

SELECT AVG(CAST(Sample_size AS FLOAT) / CAST(Total AS FLOAT)) AS avg_ratio
  FROM recent_grads;

## 6. Practice Integrating A Subquery With The Outer Query ##

SELECT Major, Major_category, cast(Sample_size as float) / cast(Total as float) AS ratio
  FROM recent_grads
 WHERE ratio >  (select AVG(cast(Sample_size as float) / cast(Total as float)) AS avg_ratio from recent_grads);