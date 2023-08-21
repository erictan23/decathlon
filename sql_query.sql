CREATE TEMP TABLE temp_table AS
SELECT c.birthdate, EXTRACT (YEAR FROM current_date) - EXTRACT(YEAR FROM c.birthdate) AS age, 
CASE
	WHEN EXTRACT (YEAR FROM current_date) - EXTRACT(YEAR FROM c.birthdate) < 20 THEN 'Teens: BELOW 20 YO'
	WHEN EXTRACT (YEAR FROM current_date) - EXTRACT(YEAR FROM c.birthdate) < 40 THEN 'Young Adults: BELOW 40 YO'
	WHEN EXTRACT (YEAR FROM current_date) - EXTRACT(YEAR FROM c.birthdate) < 60 THEN 'Adults: BELOW 60 YO'
	WHEN EXTRACT (YEAR FROM current_date) - EXTRACT(YEAR FROM c.birthdate) >= 60 THEN 'Seniors: 60 YO and above'
END AS age_range
FROM public."Customer" as c ,public."Transaction Detail" as t 
WHERE cast(c.loyalty_card_num as integer) = t.ctm_customer_id