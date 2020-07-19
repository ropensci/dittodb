## Resubmission
This is a resubmission. In order to address Martina Schmirl's comments I have 
made the following changes:

* Expanded on all acronyms by either writing them out fully everywhere or noting 
  the use of the acronym when used for the first time in a section.

* The package does not reference any academic publications.

* Runnable examples - I have made all examples runnable by removing `\dontrun{}`
  with one exception: the examples for `use_dittodb()` error when they are 
  called with paths that are not the root directory of a package. I've included
  more detailed documentation, but have kept `\dontrun{}` in those examples to 
  prevent them from erroring. Additionally, the examples for 
  `capture_requests()` and `nycflights13_create_*()` which can take longer than 
  5 seconds to run on some systems, so those were wrapped in `\donttest{}` as 
  suggested.

* Thank you for the note about `system.file()`. The function `use_dittodb()` is 
  intended to help a developer get started with dittodb by adding the necessary 
  files and declarations to use dittodb. I've added more details to the 
  `use_dittodb()` documentation that clarifies its use and what happens when it 
  is used. 

* I have changed the way that `db_mock_paths()` works to avoid setting or 
  changing users' options at all. The function `set_dittodb_debug_level()` is 
  intended to be a helper function for the sole purpose of setting their option 
  so they don't have to remember the option name. I have made explicit in the 
  documentation that it will set the `option` "dittodb.debug" so that no one is 
  surprised by the behavior. `set_dittodb_debug_level()` is not called by any 
  other functions in the package.

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

