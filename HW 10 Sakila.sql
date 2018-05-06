Use sakila;

#1a. Display the first and last names of all actors from the table actor.
select 	first_name, last_name
from actor;

#1b. Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.
select concat(first_name,last_name) as 'Actor Name'
from actor;

#2a. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." 
#What is one query would you use to obtain this information?
select
	actor_id, first_name, last_name
from actor
where first_name='Joe';

#2b. Find all actors whose last name contain the letters GEN:
select *
from actor
where last_name regexp 'G|E|N';

#OR

select *
from actor
where last_name like '%G%' or last_name like '%E%' or last_name like '%N%';

#2c. Find all actors whose last names contain the letters LI. This time, order the rows by last name and first name, in that order:
select 
	last_name, first_name
from actor
where last_name regexp 'L|I';

#OR

select 
	last_name, first_name
from actor
where last_name like '%L%' or last_name like '%I%';

#2d. Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China:
select
	country_id, country
from country
	where country IN ('Afghanistan', 'Bangladesh', 'China');
    
#3a. Add a middle_name column to the table actor. Position it between first_name and last_name. Hint: you will need to specify the data type.
alter table actor
	add column middle_name varchar(255)
    after first_name;
    
#3b. You realize that some of these actors have tremendously long last names. Change the data type of the middle_name column to blobs.
alter table actor
modify middle_name blob;

#3c. Now delete the middle_name column.
alter table actor
drop middle_name;

#4a. List the last names of actors, as well as how many actors have that last name.
select last_name, count(*) 
from actor group by last_name;

#4b. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
select last_name, count(*) 
from actor 
group by last_name
having count(*) >=2;

#4c. Oh, no! The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS, 
#the name of Harpo's second cousin's husband's yoga teacher. Write a query to fix the record.
update actor
set first_name=replace(first_name,'GROUCHO','HARPO')
where last_name='WILLIAMS' and first_name='GROUCHO';

#4d. Perhaps we were too hasty in changing GROUCHO to HARPO. It turns out that GROUCHO was the correct name after all!
#In a single query, if the first name of the actor is currently HARPO, change it to GROUCHO. Otherwise, change the first name to 
#MUCHO GROUCHO, as that is exactly what the actor will be with the grievous error. 
#BE CAREFUL NOT TO CHANGE THE FIRST NAME OF EVERY ACTOR TO MUCHO GROUCHO, HOWEVER! 
#(Hint: update the record using a unique identifier.)

#Javier - This did not make sense, the first statement says to change Harpo to Groucho, otherwise to Mucho Groucho. Which one is it?
update actor
set first_name=replace(first_name,'HARPO','GROUCHO')
where last_name='WILLIAMS' and first_name='HARPO';

#5a. You cannot locate the schema of the address table. Which query would you use to re-create it?
#Hint: https://dev.mysql.com/doc/refman/5.7/en/show-create-table.html
show create table address;

#6a. Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address:
select staff.first_name,  staff.last_name, address.address
from staff 
left join address on 
staff.address_id=address.address_id;

#6b. Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment.
				#Javier - Check sum amounts first before creating extensive query
				#select staff_id, sum(amount)
				#from payment 
				#where (payment_date between '2005-08-01%' and '2005-08-31%')
				#group by staff_id
				#;
select payment.staff_id, staff.first_name, staff.last_name, sum(amount) as Amount
from payment
join staff on (payment.staff_id=staff.staff_id)
where (payment_date between '2005-08-01%' and '2005-08-31%')
group by payment.staff_id;

#6c. List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.
select film.title as 'Title', count(film_actor.actor_id) as '# of Actors'
from film
join film_actor on (film.film_id=film_actor.film_id)
group by film.title;

#6d. How many copies of the film Hunchback Impossible exist in the inventory system?
select count(film_id) as 'Copies of Hunchback Impossible '
from inventory
where film_id IN
	(select film_id
    from film
    where title='Hunchback Impossible');

#6e. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name:
select payment.customer_id, customer.first_name, customer.last_name, sum(amount) as Amount
from payment
join customer on (payment.customer_id=customer.customer_id)
group by payment.customer_id
order by last_name;

#7a. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q 
#have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.

select title, language_id
from film
where title like 'Q%' or title like 'K%' and language_id in
	(select language_id
    from language
    where name='English');
    
#7b. Use subqueries to display all actors who appear in the film Alone Trip.
select first_name, last_name
from actor
where actor_id in
(select actor_id
  from film_actor
  where film_id in
  (select film_id
   from film
   where title = 'Alone Trip')
);    

#7c. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. 
#Use joins to retrieve this information.