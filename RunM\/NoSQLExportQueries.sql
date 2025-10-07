/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-rm-json.sql

 


/* Comments for your marker:




*/


-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    JSON_OBJECT(
        '_id' VALUE t.team_id,
                'carn_name' VALUE c1.carn_name,
                'carn_date' VALUE to_char(
            c1.carn_date,
            'DD-Mon-YYYY'
        ),
                'team_name' VALUE TRIM(t.team_name),
                'team_leader' VALUE
            JSON_OBJECT(
                'name' VALUE
                    CASE
                        WHEN leader.comp_fname IS NULL
                           AND leader.comp_lname IS NULL THEN
                            '-'
                        WHEN leader.comp_fname IS NULL THEN
                            TRIM(leader.comp_lname)
                        WHEN leader.comp_lname IS NULL THEN
                            TRIM(leader.comp_fname)
                        ELSE
                            TRIM(leader.comp_fname)
                            || ' '
                            || TRIM(leader.comp_lname)
                    END,
                        'phone' VALUE leader.comp_phone,
                        'email' VALUE leader.comp_email
            ),
                'team_no_of_members' VALUE(
            SELECT COUNT(*)
              FROM entry e
             WHERE e.team_id = t.team_id
        ),
                'team_members' VALUE JSON_ARRAYAGG(
            JSON_OBJECT(
                'competitor_name' VALUE
                    CASE
                        WHEN c2.comp_fname IS NULL
                           AND c2.comp_lname IS NULL THEN
                            '-'
                        WHEN c2.comp_fname IS NULL THEN
                            TRIM(c2.comp_lname)
                        WHEN c2.comp_lname IS NULL THEN
                            TRIM(c2.comp_fname)
                        ELSE
                            TRIM(c2.comp_fname)
                            || ' '
                            || TRIM(c2.comp_lname)
                    END,
                        'competitor_phone' VALUE c2.comp_phone,
                        'event_type' VALUE e1.eventtype_desc,
                        'entry_no' VALUE e2.entry_no,
                        'starttime' VALUE nvl(
                    to_char(
                        e2.entry_starttime,
                        'HH24:MI:SS'
                    ),
                    '-'
                ),
                        'finishtime' VALUE nvl(
                    to_char(
                        e2.entry_finishtime,
                        'HH24:MI:SS'
                    ),
                    '-'
                ),
                        'elapsedtime' VALUE nvl(
                    to_char(
                        e2.entry_elapsedtime,
                        'HH24:MI:SS'
                    ),
                    '-'
                )
            )
        )
    FORMAT JSON)
    || ','
  FROM team t
  JOIN carnival c1
ON t.carn_date = c1.carn_date
-- join team leader
  JOIN entry e
ON t.entry_no = e.entry_no
   AND t.event_id = e.event_id
  JOIN competitor leader
ON e.comp_no = leader.comp_no
--join team members
  JOIN entry e2
ON t.team_id = e2.team_id
  JOIN event e3
ON e2.event_id = e3.event_id
  JOIN eventtype e1
ON e3.eventtype_code = e1.eventtype_code
  JOIN competitor c2
ON t.team_id = e2.team_id
   AND e2.comp_no = c2.comp_no
 GROUP BY t.team_id,
          c1.carn_name,
          c1.carn_date,
          t.team_name,
          leader.comp_fname,
          leader.comp_lname,
          leader.comp_phone,
          leader.comp_email;