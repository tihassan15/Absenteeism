--Create a join table--
SELECT *
FROM absenteeism_at_work AS a
INNER JOIN compensation AS c
ON a.id = c.id
LEFT JOIN reasons AS r
ON a.reason_for_absence = r.number

--Find the healthiest employees for the bonus--
SELECT *
FROM absenteeism_at_work
WHERE social_drinker = 0 AND social_smoker = 0
AND body_mass_index < 25 AND 
absenteeism_time_in_hours < (SELECT AVG(absenteeism_time_in_hours) FROM absenteeism_at_work)

--Compensation rate for non-smokers where the budget is $983,221--
SELECT COUNT(*) AS nonsmokers
FROM absenteeism_at_work
WHERE social_smoker = 0
--686 nonsmokers
--(5 days a week x 8 hours a day) = 40 hours a week; (40 hours a week x 52 weeks in a year) = 2,080 hours a year--
--(2,080 hours a year x 686 nonsmokers) = 1,426,880 total hours worked by nonsmokers--
--($983,221 budget / 1,426,880 total hours worked by nonsmokers) = $0.69 increase per hour--
--(2,080 hours a year x $0.69 increase per hour = $1,435.20 a year as additional pay for each nonsmoker employee--


