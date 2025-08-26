/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T5-rm-select.sql

 


/* Comments for your marker:




*/


/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT TRIM(t.team_name),
       to_char(
           t.carn_date,
           'DD-Mon-YYYY'
       ) AS carnival_date,
       TRIM(c.comp_fname)
       || ' '
       || TRIM(c.comp_lname) AS teamleader,
       (
           SELECT COUNT(*)
             FROM entry e
            WHERE t.team_id = e.team_id
       ) AS team_no_members
  FROM team t
  LEFT JOIN entry e
ON t.team_id = e.team_id
  JOIN competitor c
ON t.event_id = e.event_id
   AND t.entry_no = e.entry_no
   AND e.comp_no = c.comp_no
 WHERE t.carn_date < sysdate
   AND t.team_name in (
    SELECT team_name
      FROM team
    HAVING COUNT(*) = (
        SELECT MAX(COUNT(*))
          FROM team
         WHERE carn_date < sysdate
         GROUP BY team_name
    )
     GROUP BY team_name
)
 ORDER BY t.team_name,
          t.carn_date;




/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT e1.eventtype_desc AS "Event",
       c1.carn_name
       || ' held '
       || to_char(
           c1.carn_date,
           'Dy DD-Mon-YYYY'
       ) AS "Carnival",
       to_char(
           e2.entry_elapsedtime,
           'hh24:mi:ss'
       ) AS "Current Record",
       to_char(
           c2.comp_no,
           '00000'
       )
       || ' '
       || CASE 
            WHEN TRIM(c2.comp_fname) IS NULL OR TRIM(c2.comp_fname) = '' 
              THEN TRIM(c2.comp_lname)
            WHEN TRIM(c2.comp_lname) IS NULL OR TRIM(c2.comp_lname) = '' 
              THEN TRIM(c2.comp_fname)
            ELSE TRIM(c2.comp_fname) || ' ' || TRIM(c2.comp_lname)
          END AS "Competitor No and Name",
       floor(months_between(
           c1.carn_date,
           c2.comp_dob
       ) / 12) AS "Age at Carnival"
  FROM eventtype e1
  JOIN event e3
ON e1.eventtype_code = e3.eventtype_code
  JOIN entry e2
ON e3.event_id = e2.event_id
  JOIN carnival c1
ON e3.carn_date = c1.carn_date
  JOIN competitor c2
ON e2.comp_no = c2.comp_no
 WHERE e2.entry_finishtime IS NOT NULL
   AND e2.entry_elapsedtime IN (
    SELECT MIN(entry_elapsedtime)
      FROM entry e1
      JOIN event e2
    ON e1.event_id = e2.event_id
     WHERE entry_elapsedtime IS NOT NULL
     GROUP BY e2.eventtype_code
)
 GROUP BY e1.eventtype_desc,
          c1.carn_name,
          c1.carn_date,
          e2.entry_elapsedtime,
          c2.comp_no,
          c2.comp_fname,
          c2.comp_lname,
          c2.comp_dob
 ORDER BY e1.eventtype_desc,
          c2.comp_no;







/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


SELECT c1.carn_name AS "Carnival Name",
       to_char(
           c1.carn_date,
           'DD Mon YYYY'
       ) AS "Carnival Date",
       e1.eventtype_desc AS "Event Description",
       CASE
           WHEN COUNT(e.entry_no) = 0 THEN
               'Not offered'
           ELSE
               lpad(
                   to_char(count(e.entry_no)),
                   17,
                   ' '
               )
       END AS "Number of Entries",
       CASE
           WHEN COUNT(e.entry_no) = 0 THEN
               ' '
           ELSE
               lpad(
                   to_char(round((COUNT(e.entry_no) * 100) /(
                       SELECT COUNT(*)
                         FROM entry e1
                         JOIN event e2
                       ON e1.event_id = e2.event_id
                        WHERE e2.carn_date = c1.carn_date
                   ))),
                   21,
                   ' '
               )
       END AS "% of Carnival Entries"
  FROM carnival c1
 CROSS JOIN eventtype e1
  LEFT JOIN event e2
ON c1.carn_date = e2.carn_date
   AND e1.eventtype_code = e2.eventtype_code
  LEFT JOIN entry e
ON e2.event_id = e.event_id
 GROUP BY c1.carn_name,
          c1.carn_date,
          e1.eventtype_desc
 ORDER BY c1.carn_date,
          CASE
              WHEN COUNT(e.entry_no) = 0 THEN
                  0
              ELSE
                  1
          END,
          COUNT(e.entry_no) DESC,
          e1.eventtype_desc;