show databases;
use credit_risk_db;
show tables;
select * from credit_risk;

#1. What is the overall loan default rate?
select SUM(loan_status)/count(*)*100 
as default_rate from credit_risk;

#2. Does age affect the likelihood of default?
SELECT
    age_group,
    ROUND(SUM(loan_status) * 100.0 / COUNT(*), 2) AS default_rate
FROM credit_risk
GROUP BY age_group;

#3. Does income affect the likelihood of default?
SELECT
    income_category,
    ROUND(SUM(loan_status) * 100.0 / COUNT(*), 2) AS default_rate
FROM credit_risk
GROUP BY income_category;

#4. Which loan purposes have the highest default rates?
select loan_intent,
round(sum(loan_status)/count(*)*100,2) as default_rate
from credit_risk
group by loan_intent
order by default_rate desc;

#5 How does loan grade affect default risk?
SELECT
    loan_grade,
    ROUND(SUM(loan_status) * 100.0 / COUNT(*), 2) AS default_rate
FROM credit_risk
GROUP BY loan_grade
ORDER BY loan_grade;

#6. Does previous default history affect future defaults?
SELECT
    cb_person_default_on_file,
    ROUND(SUM(loan_status) * 100.0 / COUNT(*), 2) AS default_rate
FROM credit_risk
GROUP BY cb_person_default_on_file;

#7. Which borrower segments are highest risk?
SELECT
    age_group,
    income_category,
    person_home_ownership,
    ROUND(SUM(loan_status) * 100.0 / COUNT(*), 2) AS default_rate
FROM credit_risk
GROUP BY
    age_group,
    income_category,
    person_home_ownership
ORDER BY default_rate DESC;

#8. Which home ownership type receives the highest average loan amount?
SELECT
    person_home_ownership,
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount
FROM credit_risk
GROUP BY person_home_ownership
ORDER BY avg_loan_amount DESC;
