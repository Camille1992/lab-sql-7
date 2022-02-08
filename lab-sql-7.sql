# 1. In the table actor, which are the actors whose last names are not repeated? 
# For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
# These three actors have the same last name. So we do not want to include this last name in our output. 
# Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
SELECT
	*
FROM
	ACTOR
GROUP BY
	LAST_NAME
HAVING
	COUNT(LAST_NAME) = 1
ORDER BY
	LAST_NAME ASC;
    
# 2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
SELECT
	*, COUNT(LAST_NAME) AS Name_occurence
FROM
	ACTOR
GROUP BY
	LAST_NAME
HAVING
	COUNT(LAST_NAME) > 1
ORDER BY
	COUNT(LAST_NAME) DESC;

# 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT
	STAFF_ID, COUNT(RENTAL_ID) AS Number_of_rentals
FROM
	RENTAL
GROUP BY
	STAFF_ID;

# 4. Using the film table, find out how many films were released each year.
SELECT
	RELEASE_YEAR, COUNT(TITLE) AS Number_of_films
FROM
	FILM
GROUP BY
	RELEASE_YEAR
ORDER BY
	RELEASE_YEAR ASC;

# 5. Using the film table, find out for each rating how many films were there.
SELECT
	RATING, COUNT(TITLE) AS Number_of_films
FROM
	FILM
GROUP BY
	RATING;

# 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT
	RATING, ROUND(AVG(LENGTH), 2) AS Mean_length
FROM
	FILM
GROUP BY
	RATING
ORDER BY
	Mean_length ASC;

# 7. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT
	RATING, ROUND(AVG(LENGTH), 2) AS Mean_length
FROM
	FILM
GROUP BY
	RATING
HAVING
	ROUND(AVG(LENGTH), 2) > 120
ORDER BY
	Mean_length ASC;
	