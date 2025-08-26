/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-rm-insert.sql

 

/* Comments for your marker:
Assume we follow the system date, so the carnival (RM Winter Series Caulfield 2025 - 29/06/2025) after the system date
haven't start, the entry start time, finish time, and elapsed time of competitor who register this carnival is null.


*/

-- Task 2 Load the COMPETITOR, ENTRY and TEAM tables with your own
-- test data following the data requirements expressed in the brief

-- =======================================
-- COMPETITOR
-- =======================================
INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 1,
           'Jessica',
           'White',
           'F',
           TO_DATE('11-SEP-1998','DD-MON-YYYY'),
           'jessica@gmail.com',
           'Y',
           '0123456789' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 2,
           'John',
           'Brown',
           'M',
           TO_DATE('24-JAN-1997','DD-MON-YYYY'),
           'john@gmail.com',
           'Y',
           '0127634873' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 3,
           'Alice',
           'Wilson',
           'F',
           TO_DATE('12-MAY-2004','DD-MON-YYYY'),
           'alice@gmail.com',
           'Y',
           '0117266735' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 4,
           'Robert',
           'Jones',
           'M',
           TO_DATE('31-JUL-1978','DD-MON-YYYY'),
           'robert@gmail.com',
           'Y',
           '0114564843' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 5,
           'Emily',
           'Smith',
           'F',
           TO_DATE('05-DEC-1987','DD-MON-YYYY'),
           'emily@gmail.com',
           'Y',
           '0162473474' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 6,
           'Michael',
           'Miller',
           'M',
           TO_DATE('18-FEB-1995','DD-MON-YYYY'),
           'michael@gmail.com',
           'N',
           '0154665346' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 7,
           'Elizabeth',
           'Garcia',
           'F',
           TO_DATE('13-JAN-1988','DD-MON-YYYY'),
           'elizabeth@gmail.com',
           'N',
           '0178547657' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 8,
           'Daniel',
           'Lewis',
           'M',
           TO_DATE('29-APR-1999','DD-MON-YYYY'),
           'daniel@gmail.com',
           'N',
           '0156785875' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 9,
           'Linda',
           'Clark',
           'F',
           TO_DATE('07-OCT-2003','DD-MON-YYYY'),
           'linda@gmail.com',
           'N',
           '0167345323' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 10,
           'James',
           'Allen',
           'M',
           TO_DATE('14-JUN-2000','DD-MON-YYYY'),
           'james@gmail.com',
           'N',
           '0175637949' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 11,
           NULL,
           NULL,
           'F',
           TO_DATE('09-AUG-2001','DD-MON-YYYY'),
           'ashley@gmail.com',
           'Y',
           '0144735734' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 12,
           NULL,
           NULL,
           'U',
           TO_DATE('20-MAR-1999','DD-MON-YYYY'),
           'anony@gmail.com',
           'Y',
           '0172857753' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 13,
           NULL,
           'Gray',
           'U',
           TO_DATE('16-NOV-1988','DD-MON-YYYY'),
           'mark@gmail.com',
           'N',
           '0126546767' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 14,
           'Karen',
           'Lee',
           'U',
           TO_DATE('21-FEB-1995','DD-MON-YYYY'),
           'karen@gmail.com',
           'N',
           '0134923472' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 15,
           NULL,
           NULL,
           'M',
           TO_DATE('28-APR-1998','DD-MON-YYYY'),
           'mooon@gmail.com',
           'Y',
           '0176547834' );


-- =======================================
-- ENTRY
-- =======================================

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 1,
           1,
           TO_DATE('09:30:12','hh24:mi:ss'),
           TO_DATE('10:31:12','hh24:mi:ss'),
           TO_DATE('01:01:00','hh24:mi:ss'),
           1,
           NULL,
           1 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 3,
           1,
           TO_DATE('09:03:05','hh24:mi:ss'),
           TO_DATE('09:58:21','hh24:mi:ss'),
           TO_DATE('00:55:16','hh24:mi:ss'),
           1,
           NULL,
           1 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 6,
           1,
           TO_DATE('08:32:32','hh24:mi:ss'),
           TO_DATE('09:12:32','hh24:mi:ss'),
           TO_DATE('00:40:00','hh24:mi:ss'),
           1,
           NULL,
           3 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 13,
           1,
           NULL,
           NULL,
           NULL,
           2,
           NULL,
           4 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 11,
           1,
           TO_DATE('07:46:00','hh24:mi:ss'),
           TO_DATE('15:48:44','hh24:mi:ss'),
           TO_DATE('08:02:44','hh24:mi:ss'),
           3,
           NULL,
           2 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 7,
           1,
           TO_DATE('08:33:06','hh24:mi:ss'),
           TO_DATE('09:26:06','hh24:mi:ss'),
           TO_DATE('00:53:00','hh24:mi:ss'),
           2,
           NULL,
           2 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 4,
           1,
           TO_DATE('08:30:21','hh24:mi:ss'),
           TO_DATE('10:35:39','hh24:mi:ss'),
           TO_DATE('02:05:18','hh24:mi:ss'),
           2,
           NULL,
           4 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 10,
           1,
           TO_DATE('08:01:28','hh24:mi:ss'),
           TO_DATE('08:38:36','hh24:mi:ss'),
           TO_DATE('00:37:08','hh24:mi:ss'),
           4,
           NULL,
           3 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 12,
           1,
           NULL,
           NULL,
           NULL,
           4,
           NULL,
           3 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 6,
           2,
           TO_DATE('08:32:29','hh24:mi:ss'),
           TO_DATE('09:17:43','hh24:mi:ss'),
           TO_DATE('00:45:14','hh24:mi:ss'),
           4,
           NULL,
           1 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 2,
           1,
           TO_DATE('08:30:45','hh24:mi:ss'),
           TO_DATE('10:39:16','hh24:mi:ss'),
           TO_DATE('02:08:31','hh24:mi:ss'),
           5,
           NULL,
           3 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 14,
           1,
           NULL,
           NULL,
           NULL,
           5,
           NULL,
           3 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 8,
           1,
           TO_DATE('08:01:56','hh24:mi:ss'),
           TO_DATE('09:50:33','hh24:mi:ss'),
           TO_DATE('01:48:37','hh24:mi:ss'),
           5,
           NULL,
           2 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 5,
           1,
           TO_DATE('08:00:43','hh24:mi:ss'),
           TO_DATE('12:15:54','hh24:mi:ss'),
           TO_DATE('04:15:11','hh24:mi:ss'),
           6,
           NULL,
           1 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 6,
           3,
           TO_DATE('08:31:21','hh24:mi:ss'),
           TO_DATE('09:12:45','hh24:mi:ss'),
           TO_DATE('00:41:24','hh24:mi:ss'),
           6,
           NULL,
           3 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 12,
           2,
           NULL,
           NULL,
           NULL,
           6,
           NULL,
           3 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 9,
           1,
           TO_DATE('08:00:32','hh24:mi:ss'),
           TO_DATE('12:16:54','hh24:mi:ss'),
           TO_DATE('04:16:22','hh24:mi:ss'),
           7,
           NULL,
           4 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 1,
           2,
           TO_DATE('09:31:02','hh24:mi:ss'),
           TO_DATE('10:31:57','hh24:mi:ss'),
           TO_DATE('01:00:55','hh24:mi:ss'),
           8,
           NULL,
           1 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 5,
           2,
           TO_DATE('08:02:17','hh24:mi:ss'),
           TO_DATE('12:04:24','hh24:mi:ss'),
           TO_DATE('04:02:07','hh24:mi:ss'),
           9,
           NULL,
           2 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 14,
           2,
           NULL,
           NULL,
           NULL,
           10,
           NULL,
           3 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 11,
           2,
           TO_DATE('07:46:02','hh24:mi:ss'),
           TO_DATE('15:52:23','hh24:mi:ss'),
           TO_DATE('08:06:21','hh24:mi:ss'),
           11,
           NULL,
           4 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 11,
           3,
           TO_DATE('07:46:57','hh24:mi:ss'),
           NULL,
           NULL,
           12,
           NULL,
           1 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 8,
           2,
           TO_DATE('08:01:34','hh24:mi:ss'),
           NULL,
           NULL,
           13,
           NULL,
           2 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 5,
           3,
           TO_DATE('08:00:45','hh24:mi:ss'),
           TO_DATE('12:06:57','hh24:mi:ss'),
           TO_DATE('04:06:12','hh24:mi:ss'),
           14,
           NULL,
           3 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 2,
           2,
           TO_DATE('08:30:23','hh24:mi:ss'),
           TO_DATE('10:32:34','hh24:mi:ss'),
           TO_DATE('02:02:11','hh24:mi:ss'),
           15,
           NULL,
           4 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 7,
           2,
           NULL,
           NULL,
           NULL,
           7,
           NULL,
           1 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 10,
           2,
           NULL,
           NULL,
           NULL,
           8,
           NULL,
           2 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 3,
           2,
           NULL,
           NULL,
           NULL,
           9,
           NULL,
           3 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 9,
           2,
           NULL,
           NULL,
           NULL,
           10,
           NULL,
           4 );

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 4,
           2,
           NULL,
           NULL,
           NULL,
           11,
           NULL,
           1 );



-- =======================================
-- TEAM
-- =======================================

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES ( 1,
           'First Team',
           (
               SELECT carn_date
                 FROM event
                WHERE event_id = 1
           ),
           1,
           1 );

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES ( 2,
           'First Team',
           (
               SELECT carn_date
                 FROM event
                WHERE event_id = 3
           ),
           3,
           1 );

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES ( 3,
           'Stars',
           (
               SELECT carn_date
                 FROM event
                WHERE event_id = 6
           ),
           6,
           1 );

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES ( 4,
           'Stars',
           (
               SELECT carn_date
                 FROM event
                WHERE event_id = 13
           ),
           13,
           1 );

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES ( 5,
           'Crash',
           (
               SELECT carn_date
                 FROM event
                WHERE event_id = 11
           ),
           11,
           1 );


-- update team_id of entry

UPDATE entry
   SET
    team_id = 1
 WHERE event_id = 1
   AND entry_no = 1;

UPDATE entry
   SET
    team_id = 2
 WHERE event_id = 3
   AND entry_no = 1;

UPDATE entry
   SET
    team_id = 3
 WHERE event_id = 6
   AND entry_no = 1;

UPDATE entry
   SET
    team_id = 4
 WHERE event_id = 13
   AND entry_no = 1;

UPDATE entry
   SET
    team_id = 5
 WHERE event_id = 11
   AND entry_no = 1;

UPDATE entry
   SET
    team_id = 3
 WHERE event_id = 7
   AND entry_no = 1;

UPDATE entry
   SET
    team_id = 2
 WHERE event_id = 4
   AND entry_no = 1;

UPDATE entry
   SET
    team_id = 5
 WHERE event_id = 10
   AND entry_no = 1;

UPDATE entry
   SET
    team_id = 4
 WHERE event_id = 12
   AND entry_no = 1;

UPDATE entry
   SET
    team_id = 3
 WHERE event_id = 6
   AND entry_no = 2;

UPDATE entry
   SET
    team_id = 1
 WHERE event_id = 2
   AND entry_no = 1;

UPDATE entry
   SET
    team_id = 4
 WHERE event_id = 14
   AND entry_no = 1;

UPDATE entry
   SET
    team_id = 3
 WHERE event_id = 8
   AND entry_no = 1;

UPDATE entry
   SET
    team_id = 2
 WHERE event_id = 5
   AND entry_no = 1;

UPDATE entry
   SET
    team_id = 3
 WHERE event_id = 6
   AND entry_no = 3;

UPDATE entry
   SET
    team_id = 4
 WHERE event_id = 12
   AND entry_no = 2;

UPDATE entry
   SET
    team_id = 3
 WHERE event_id = 9
   AND entry_no = 1;

UPDATE entry
   SET
    team_id = 1
 WHERE event_id = 1
   AND entry_no = 2;

UPDATE entry
   SET
    team_id = 2
 WHERE event_id = 5
   AND entry_no = 2;

UPDATE entry
   SET
    team_id = 4
 WHERE event_id = 14
   AND entry_no = 2;

UPDATE entry
   SET
    team_id = 5
 WHERE event_id = 11
   AND entry_no = 2;

COMMIT;