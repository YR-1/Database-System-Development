--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-rm-dm.sql

 

/* Comments for your marker:




*/

--(a)
DROP SEQUENCE comp_seq;
DROP SEQUENCE team_seq;

CREATE SEQUENCE comp_seq START WITH 100 INCREMENT BY 5;

CREATE SEQUENCE team_seq START WITH 100 INCREMENT BY 5;


--(b)
INSERT INTO competitor VALUES ( comp_seq.NEXTVAL,
                                'Keith',
                                'Rose',
                                'U',
                                TO_DATE('23-JUL-2003','DD-MON-YYYY'),
                                'keith@gmail.com',
                                'Y',
                                '0422141112' );

INSERT INTO competitor VALUES ( comp_seq.NEXTVAL,
                                'Jackson',
                                'Bull',
                                'U',
                                TO_DATE('09-FEB-2005','DD-MON-YYYY'),
                                'jackson@gmail.com',
                                'Y',
                                '0422412524' );


------------- Record data to entry------------- 

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( (
    SELECT e.event_id
      FROM event e
      JOIN carnival c
    ON e.carn_date = c.carn_date
     WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
       AND e.eventtype_code = (
        SELECT eventtype_code
          FROM eventtype
         WHERE upper(eventtype_desc) = upper('10 km run')
    )
),
           (
               SELECT nvl(
                   max(e1.entry_no),
                   0
               ) + 1
                 FROM entry e1
                WHERE e1.event_id = (
                   SELECT e2.event_id
                     FROM event e2
                     JOIN carnival c2
                   ON e2.carn_date = c2.carn_date
                    WHERE upper(c2.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025'
                    )
                      AND e2.eventtype_code = (
                       SELECT eventtype_code
                         FROM eventtype
                        WHERE upper(eventtype_desc) = upper('10 km run')
                   )
               )
           ),
           NULL,
           NULL,
           NULL,
           (
               SELECT comp_no
                 FROM competitor
                WHERE comp_phone = '0422141112'
           ),
           NULL,
           (
               SELECT char_id
                 FROM charity
                WHERE upper(char_name) = upper('Salvation Army')
           ) );



INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    char_id,
    team_id
) VALUES ( (
    SELECT e.event_id
      FROM event e
      JOIN carnival c
    ON e.carn_date = c.carn_date
     WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
       AND e.eventtype_code = (
        SELECT eventtype_code
          FROM eventtype
         WHERE upper(eventtype_desc) = upper('10 km run')
    )
),
           (
               SELECT nvl(
                   max(e1.entry_no),
                   0
               ) + 1
                 FROM entry e1
                WHERE e1.event_id = (
                   SELECT e2.event_id
                     FROM event e2
                     JOIN carnival c2
                   ON e2.carn_date = c2.carn_date
                    WHERE upper(c2.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025'
                    )
                      AND e2.eventtype_code = (
                       SELECT eventtype_code
                         FROM eventtype
                        WHERE upper(eventtype_desc) = upper('10 km run')
                   )
               )
           ),
           NULL,
           NULL,
           NULL,
           (
               SELECT comp_no
                 FROM competitor
                WHERE comp_phone = '0422412524'
           ),
           (
               SELECT char_id
                 FROM charity
                WHERE upper(char_name) = upper('RSPCA')
           ),
           NULL );

------------- Record data to team------------- 

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES ( team_seq.NEXTVAL,
           'Super Runners',
           (
               SELECT carn_date
                 FROM carnival
                WHERE upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
           ),
           (
               SELECT e.event_id
                 FROM event e
                 JOIN carnival c
               ON e.carn_date = c.carn_date
                WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
                  AND e.eventtype_code = (
                   SELECT eventtype_code
                     FROM eventtype
                    WHERE upper(eventtype_desc) = upper('10 km run')
               )
           ),
           (
               SELECT e1.entry_no
                 FROM entry e1
                WHERE comp_no = (
                       SELECT comp_no
                         FROM competitor
                        WHERE comp_phone = '0422141112'
                   )
                  AND char_id = (
                   SELECT char_id
                     FROM charity
                    WHERE upper(char_name) = upper('Salvation Army')
               )
                  AND event_id = (
                   SELECT e.event_id
                     FROM event e
                     JOIN carnival c
                   ON e.carn_date = c.carn_date
                    WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025'
                    )
                      AND e.eventtype_code = (
                       SELECT eventtype_code
                         FROM eventtype
                        WHERE upper(eventtype_desc) = upper('10 km run')
                   )
               )
           ) );

------------- Update Entry ------------- 

UPDATE entry
   SET
    team_id = (
        SELECT team_id
          FROM team
         WHERE upper(team_name) = upper('Super Runners')
    )
 WHERE comp_no = (
        SELECT comp_no
          FROM competitor
         WHERE comp_phone = '0422141112'
    )
   AND event_id = (
    SELECT e.event_id
      FROM event e
      JOIN carnival c
    ON e.carn_date = c.carn_date
     WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
       AND e.eventtype_code = (
        SELECT eventtype_code
          FROM eventtype
         WHERE upper(eventtype_desc) = upper('10 km run')
    )
);

UPDATE entry
   SET
    team_id = (
        SELECT team_id
          FROM team
         WHERE upper(team_name) = upper('Super Runners')
    )
 WHERE comp_no = (
        SELECT comp_no
          FROM competitor
         WHERE comp_phone = '0422412524'
    )
   AND event_id = (
    SELECT e.event_id
      FROM event e
      JOIN carnival c
    ON e.carn_date = c.carn_date
     WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
       AND e.eventtype_code = (
        SELECT eventtype_code
          FROM eventtype
         WHERE upper(eventtype_desc) = upper('10 km run')
    )
);
COMMIT;


--(c)

UPDATE entry
   SET event_id = (
    SELECT e.event_id
      FROM event e
      JOIN carnival c
    ON e.carn_date = c.carn_date
     WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
       AND e.eventtype_code = (
        SELECT eventtype_code
          FROM eventtype
         WHERE upper(eventtype_desc) = upper('5 km run')
    )
),
       entry_no = (
           SELECT nvl(
               max(entry_no),
               0
           ) + 1
             FROM entry
            WHERE event_id = (
               SELECT e.event_id
                 FROM event e
                 JOIN carnival c
               ON e.carn_date = c.carn_date
                WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
                  AND e.eventtype_code = (
                   SELECT eventtype_code
                     FROM eventtype
                    WHERE upper(eventtype_desc) = upper('5 km run')
               )
           )
       ),
       char_id = (
           SELECT char_id
             FROM charity
            WHERE upper(char_name) = upper('Beyond Blue')
       )
 WHERE comp_no = (
        SELECT comp_no
          FROM competitor
         WHERE comp_phone = '0422412524'
    )
   AND event_id = (
    SELECT e.event_id
      FROM event e
      JOIN carnival c
    ON e.carn_date = c.carn_date
     WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
       AND e.eventtype_code = (
        SELECT eventtype_code
          FROM eventtype
         WHERE upper(eventtype_desc) = upper('10 km run')
    )
);

COMMIT;


--(d)
--delete Keith Rose

UPDATE entry
   SET
    team_id = NULL
 WHERE team_id = (
    SELECT t.team_id
      FROM team t
      JOIN carnival c
    ON t.carn_date = c.carn_date
     WHERE upper(t.team_name) = upper('Super Runners')
       AND upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
);

DELETE FROM team
 WHERE team_id = (
    SELECT t.team_id
      FROM team t
      JOIN carnival c
    ON t.carn_date = c.carn_date
     WHERE upper(t.team_name) = upper('Super Runners')
       AND upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
);


DELETE FROM entry
 WHERE comp_no = (
        SELECT comp_no
          FROM competitor
         WHERE comp_phone = '0422141112'
    )
   AND event_id IN (
    SELECT e.event_id
      FROM event e
      JOIN carnival c
    ON e.carn_date = c.carn_date
     WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
);


COMMIT;