create database fitness;
use fitness;

CREATE TABLE fitness_tracker (
Id BIGINT, #ID
Date DATE, #ActivityDate
TotalSteps INT, #TotalSteps
TotalDistance FLOAT, #TotalDistance
VeryActiveMinutes INT, #VeryActiveMinutes_x
FairlyActiveMinutes INT, #FairlyActiveMinutes_x
LightlyActiveMinutes INT, #LightlyActiveMinutes_x
SedentaryMinutes INT, #SedentaryMinutes_x
Calories INT, #Calories
VeryActiveDistance FLOAT, #VeryActiveDistance_x
ModeratelyActiveDistance FLOAT, #ModeratelyActiveDistance_x
LightActiveDistance FLOAT, #LightActiveDistance_x
TotalMinutesAsleep INT, #TotalMinutesAsleep
TotalTimeInBed INT, #TotalTimeInBed
SleepEfficiency FLOAT, #SleepEfficiency	
WeightKg FLOAT, #WeightKg
BMI FLOAT #BMI
);

SELECT * FROM fitness.fitness_tracker;

#User Activity
SELECT Id, AVG(TotalSteps)
FROM fitness_tracker
GROUP BY Id;

#Most Active Users
SELECT Id, SUM(TotalSteps)
FROM fitness_tracker
GROUP BY Id
ORDER BY 2 DESC
LIMIT 10;

#Average Calories
SELECT AVG(Calories) FROM fitness_tracker;

#Average Sleep
SELECT AVG(TotalMinutesAsleep)
FROM fitness_tracker;

#Sleep Efficiency
SELECT AVG(SleepEfficiency)
FROM fitness_tracker;

#Activity vs Sleep
SELECT AVG(TotalSteps), AVG(TotalMinutesAsleep)
FROM fitness_tracker;

#High Activity Days
SELECT *
FROM fitness_tracker
WHERE TotalSteps > 10000;

#Sedentary Users
SELECT *
FROM fitness_tracker
WHERE SedentaryMinutes > 1000;

#BMI Categories
SELECT 
    CASE
        WHEN BMI < 18.5 THEN 'Underweight'
        WHEN BMI < 25 THEN 'Normal'
        WHEN BMI < 30 THEN 'Overweight'
        ELSE 'Obese'
    END AS BMI_Category,
    COUNT(DISTINCT id) AS Unique_ID_Count
FROM fitness_tracker
WHERE BMI != 0
GROUP BY BMI_Category;
