

-- IFNULL(expr1,expr2);
-- IF expr1/first_one is null THEN it return expr2/second_one
-- other wise it return expr1/first_one
SELECT IFNULL("VALUE1","VALUE2"); -- it will return value1
SELECT IFNULL(NULL,"VALUE2"); -- it will return value2

-- NULLIF(expr1,expr2)
-- if expr1/first_one = expr2/second_one then return null
-- otherwise expr1/first_one will be returned

SELECT NULLIF("VALUE1","VALUE1"); -- it will return NULL
SELECT IFNULL("VALUE1","VALUE2")  -- it will return the value1 
