--****PLEASE ENTER YOUR DETAILS BELOW****
--T4-rm-mods.sql

 

/* Comments for your marker:




*/

--(a)
ALTER TABLE competitor ADD comp_completed NUMBER(3) DEFAULT 0 NOT NULL;

COMMENT ON COLUMN competitor.comp_completed IS
    'Number of completed events for each competitor';

UPDATE competitor c
   SET
    comp_completed = (
        SELECT COUNT(*)
          FROM entry e
         WHERE e.comp_no = c.comp_no
           AND e.entry_finishtime IS NOT NULL
    );

-- Show table structural changes
desc competitor;

SELECT comp_no,
       comp_fname,
       comp_lname,
       comp_completed
  FROM competitor
 ORDER BY comp_no;

COMMIT;

--(b)
-- ALTER TABLE entry DROP COLUMN char_id;

DROP SEQUENCE ec_seq;
CREATE SEQUENCE ec_seq START WITH 1 INCREMENT BY 1;

DROP TABLE entry_charity CASCADE CONSTRAINTS PURGE;
-- create new table
-- relation with more than two attributes in the primary key must have a surrogate key added
-- so I added a surrogate key (ec_no)
CREATE TABLE entry_charity (
    ec_no         NUMBER(5) NOT NULL,
    event_id      NUMBER(6) NOT NULL,
    entry_no      NUMBER(5) NOT NULL,
    char_id       NUMBER(3) NOT NULL,
    ec_percentage NUMBER(3) NOT NULL
);

COMMENT ON COLUMN entry_charity.ec_no IS
    'Entry charity no (surrogate primary key)';

COMMENT ON COLUMN entry_charity.event_id IS
    'Event id (unique identifier)';

COMMENT ON COLUMN entry_charity.entry_no IS
    'Entry number (unique only within an event)';

COMMENT ON COLUMN entry_charity.char_id IS
    'Charity unique identifier';

COMMENT ON COLUMN entry_charity.ec_percentage IS
    'Percentage of the total funds that competitor raise that will go to each charity (0-100)'
    ;


ALTER TABLE entry_charity ADD CONSTRAINT ec_pk PRIMARY KEY ( ec_no );

ALTER TABLE entry_charity
    ADD CONSTRAINT ec_nk UNIQUE ( event_id,
                                  entry_no,
                                  char_id );

ALTER TABLE entry_charity
    ADD CONSTRAINT chk_ec_percentage CHECK ( ec_percentage BETWEEN 0 AND 100 );


-- foreign key constraints
ALTER TABLE entry_charity
    ADD CONSTRAINT entry_ec_fk
        FOREIGN KEY ( event_id,
                      entry_no )
            REFERENCES entry ( event_id,
                               entry_no );

ALTER TABLE entry_charity
    ADD CONSTRAINT char_ec_fk FOREIGN KEY ( char_id )
        REFERENCES charity ( char_id );

-- insert existing charity (assume 100% to single charity)
INSERT INTO entry_charity (
    ec_no,
    event_id,
    entry_no,
    char_id,
    ec_percentage
)
    SELECT ec_seq.NEXTVAL,
           event_id,
           entry_no,
           char_id,
           100
      FROM entry
     WHERE char_id IS NOT NULL;

-- remove charity reference from ENTRY table
ALTER TABLE entry DROP COLUMN char_id;

-- show table structural changes
DESC entry_charity;
DESC entry;

SELECT *
  FROM entry_charity
 ORDER BY ec_no;

SELECT *
  FROM entry
 ORDER BY entry_no,
          event_id;

COMMIT;