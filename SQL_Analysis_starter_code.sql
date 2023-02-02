-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

SELECT cpn.backers_count, cpn.cf_id, cpn.outcome
FROM campaign as cpn
WHERE (cpn.outcome = 'live')
ORDER BY cpn.backers_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

SELECT COUNT (bk.cf_id), bk.cf_id
FROM backers as bk
GROUP BY bk.cf_id
ORDER BY COUNT(bk.cf_id) DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT con.first_name, con.last_name, con.email, (cpn.goal - cpn.pledged) as remaining_goal_amount 
INTO email_contacts_remaining_goal_amount
FROM campaign as cpn
INNER JOIN contacts as con
ON (cpn.contact_id = con.contact_id)
WHERE (cpn.outcome = 'live')
ORDER BY remaining_goal_amount DESC;


-- Check the table

select * from email_contacts_remaining_goal_amount;
-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

SELECT bk.email, bk.first_name, bk.last_name, cpn.cf_id, cpn.company_name, cpn.description, (cpn.goal - cpn.pledged) as left_of_goal 
INTO email_backers_remaining_goal_amount
FROM campaign as cpn
INNER JOIN backers as bk
ON (cpn.cf_id = bk.cf_id)
WHERE (cpn.outcome = 'live')
ORDER BY bk.last_name, bk.email;



-- Check the table
SELECT * FROM email_backers_remaining_goal_amount;


