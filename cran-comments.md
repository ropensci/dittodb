## Resubmission
This is a resubmission. In this submission I have:

* Expanded on all accronyms either writting them out fully everywhere or noting 
  the use of the accronym when used for the first time in a section.

* The package does not reference any academic publications.

* Runnable examples - TODO

* Thank you for the note about `system.file()`. The function `use_dittodb()` is 
  intended to help a developer get started with dittodb by adding the necesary 
  files and declarations to use dittodb for the package source located at the 
  path provided in the `path` argument. I've added more details to the 
  `use_dittodb()` documentation that clairfies its use and what happens when it 
  is used. 

* options - TODO

* Thank you for the note about `installed.package()` being slow. I have edited 
  the code that called `installed.package()`to use the `requireNamespace()` 
  function instead.

### In a previous re-submission:
* Corrected 3 (possibly) invalid file URIs in 
  man/nycflights13_create_sql.Rd, man/nycflights_sqlite.Rd, and README.md


## Test environments
* local R installation, R 4.0.0
* ubuntu 18.04 (on GitHub actions), R 3.3-4.0
* macOS (on GitHub actions), R 3.6, 4.0, devel
* windows (on GitHub actions), R 4.0

## R CMD check results

0 errors | 0 warnings | 1 note

* The note is that this is a new release.

