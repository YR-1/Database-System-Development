# Run Monash — Database Implementation & Queries

**Version:** 1.0
**Author:** Liew Yun Ru
**Last updated:** 7th October 2025

## Project summary

Run Monash (RM) is a small, self contained relational database project that models a one day running carnival system (carnivals, events, competitors, entries, teams, charities, timing results). The repository contains the SQL scripts required to create the database schema, populate it with test data, perform transactional operations, alter the live schema, run reporting queries, and export JSON for MongoDB followed by example MongoDB queries. The behaviour and requirements implemented follow the provided system model and specification. 

---

## What’s included

* `SchemaCompletion.sql` — Complete DDL for missing tables and constraints (COMPETITOR, ENTRY, TEAM).
* `SeedData.sql` — Test data loader: inserts sample competitors, entries and teams (single transaction).
* `Management.sql` — Transactional DML scripts (sequence creation, insert/update/delete scenarios that must succeed/rollback as an atomic unit).
* `DatabaseModifications.sql` — Live schema modifications (add columns/tables, data migration and column comments).
* `SQLSelect.sql` — Reporting SQL queries that produce the required output formats.
* `NoSQLExportQueries.sql` — SQL to generate JSON documents from relational data (for MongoDB ingestion).

---

## Key behaviours & constraints implemented

* Schema follows the supplied data model (table/column names and order preserved). 
* CSV / initial data population: tables are created by `SchemaCompletion.sql`. 
* Test data rules: primary keys for Seed Data are hard coded numeric values < 100 and the entire Seed Data insert set is executed as a single transaction. 
* Transaction safety: 'Management' DML operations are written to use sequences (for numeric PKs) and are wrapped in transactions so either all changes in a scenario apply or none do. 
* No PL/SQL blocks, no VIEWS, no `SPOOL` / `SET ECHO` 

---

## Prerequisites

* Oracle RDBMS (developer edition or an accessible Oracle instance) — run all `.sql` scripts from SQL*Plus / SQLcl / SQL Developer.
  
---

## Setup & run order (recommended)

1. Ensure an empty schema (or a clean test schema) in Oracle.
2. Run `SchemaCompletion.sql` to add DDL (COMPETITOR, ENTRY, TEAM).
3. Run `SeedData.sql` — this inserts the sample dataset (single transaction). Confirm it completes without errors.
4. Run `Management.sql` — this performs the sequence creation and scenario DML operations.
5. Run `DatabaseModifications.sql` — apply live schema modifications and populate derived fields.
6. Run `SQLSelect.sql` — execute reporting queries and check outputs.
7. Run `NoSQLExportQueries.sql` to generate JSON export

> Important: follow the order above — later scripts assume earlier scripts have been executed.

---

## How scripts are organised and tested

* Each script is written to run end to end as a script file (not single statements).
* Scripts have transaction control where required, DROP statements precede CREATE statements to allow repeatable runs.
* All date handling uses `TO_DATE` / `TO_CHAR` to avoid relying on session defaults. 

