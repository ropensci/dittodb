---
title: 'Dittodb: A Test Environment for Database Requests'
authors:
- affiliation: 1
  name: Jonathan Keane
  orcid: 0000-0001-7087-9776
- affiliation: 2
  name: Mauricio Vargas
  orcid: 0000-0003-1017-7574
date: "8 August 2020"
output: pdf_document
bibliography: REFERENCES.bib
tags:
- R
- SQL
- testing
- reproducibility
affiliations:
- index: 1
  name: Socure, Inc.
- index: 2
  name: Pontifical Catholic University of Chile
---

# Summary

`dittodb::` is an R package that makes testing against databases easy, which is heavily inspired by `httptest::` (@webmockr), and follows the same philosophy to make the interaction similar.

When writing code that relies on interactions with databases, testing has been difficult without recreating test databases in your Continuous integration (CI) environment, or resorting to using SQLite databases instead of the database engines you have in production.

On the one hand, recreating database infrastructure is slow, error prone, and hard to iterate with. On the other, SQLite works well right up until you use a feature (i.e. a full outer join) or has a differenyt syntax your production database. `dittodb::` solves this by recording database interactions, saving them as mocks, and then replaying them seamlessly during testing.

With our software you can get a query from your database, record the response and reliably reproduce that response in your workflow no matter if in the context of an isolated script or in tests created with `testthat::` (@testthat).

To provide a seamless experience between using a real database connection and using the mocked version of the database `dittodb::` uses some features of R that are pretty uncommon.

In order to record fixtures while using a real database connection, we use `::trace` from base R (@base) to add code that inspects the queries, defines unique hashes, and saves the results so that they can be used later. This functionality should generally be used to see what interactions a piece of code to be tested is having with a database and either use or edit and use the fixtures it produces in testing.

When using fixtures (i.e. with a mocked database), we use some internals to mock the `::dbConnect` from `DBI::` (@DBI) and replace the true connection with a special mock connection class from `dittodb::` itself (i.e. DBIMockConnection, though there are specific sub-classes for some drivers, such as DBIMockRPostgresConnection). `dittodb::` relies on standard S4 method dispatch to find the appropriate fixture for queries being run during testing.

`pointblank::` (@pointblank), which tests against public databases, provides a good example that shows the benefits of our software. Running formal tests against it can fail because of internet connection issues or anything not related to the software or the database itself, but thanks to dittodb, all the database related tests in `pointblank::`  are mocked, therefore it prevents timeout errors or similar that would break the workflow in gh-actions and would return a false negative for the check results on gh-actions.

# References
