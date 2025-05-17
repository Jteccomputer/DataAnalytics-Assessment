# DataAnalytics-Assessment
This is Cowry Assessment for the role of Data Analyst.
QUESTION 1
In question 1, I encountered Error 1824 which reads Failed to open the referenced table 'plans_currency'
It means that MySQl cannot find the referenced table plans_currency which is needed to enforce the foreign
key constraint on currency_id. So I decided that this for assessment and since I don't necessarily need the
foreign key check, I temporarily commented out the foreign key constraint involving plans_currency using
-- CONSTRAINT `plans_plan_currency_id_bb34dd0f_fk_plans_currency_id` FOREIGN KEY (`currency_id`) REF

I also encountered Error 1406: Data too long for column id, which means that the value that I wanted to insert into 
the id column exceeds its defined length of 32-characters, what I did was to count the id-characters and it was 34, so
I reduced it to 32 and then I was able to insert the values into the table. 

I also generated a similar table because the dataset you sent was too big for my computer, I tried inserting it twice, it
hanged my computer and automatically closed itself so I had to generate a similar value that is less cumbersome and used it
to run the queries.


