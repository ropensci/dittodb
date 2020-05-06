Reviewer comments:

@helenmiller16's comments

Vignette comments:
* Thank you for pointing out about the special getting started link in pkgdown. I've updated the vignette name and it now appears on the front page of the pkgdown website.
* I've also included a bit more information in the nycflights13 data, a link to the package, as well as references to the functions to set the data up in a database (or with SQLite)

Documentation and examples comments:
* I've added some more documentation as well as a few more exported functions (with documentation). I also added a bit more detail as well. 

* I've also added to the examples and made sure that they are runable. One thing I have kept is many of the `\dontrun{}` wrapping around the examples. The reason for keeping that is that many of the tests will interact with either the filesystem (for recording fixtures) or change some aspects of options (for setting mock paths). Neither of which I wanted to do automatically. I did, however, add to the examples so that they can be copied and pasted and run without anything else.

* As for links to httptest, Linking directly in the Rd causes a CMD check error (below) when httptest isn't available, and I didn't think that adding it as a suggest was worth it, I have made sure there are a few links to the CRAN page for httptest, however.

```
N  checking Rd cross-references (3.6s)
   Package unavailable to check Rd xrefs: ‘httptest’
```

Community guidelines comments:
* I've add a contributing guide.

Other comments:
* Starting and stopping mocks. Both reviewers mentioned wanting an additional way to start and stop mocking besides `with_mock_db()`. I've added `start_mock_db()` and `stop_mock_db()` to turn mocking on and off. This way people can step through their tests if they want (and this addresses some of the other comments as well). 

* Organization *TODO*

* Debugging: thank you for the suggestion, I've added `set_dittodb_debug_level()` and included some documentation about how to use it and what is printed with debugging turned on.

* I've removed `start_capturing()` entirely, but am using `.Deprecated()` for the deprecation of `.db_mock_paths()`

* Thank you for catching the bug in `redact_columns()`. I intended for `grep` to work there and possibly even match multiple columns, but it would not have done that without a fix. I've not fixed that and added to the documentation how to use regex to specify more than one column at a time.

* Developer setup, I've added a whole vignette devoted to how to develop `dittodb` and to set up testing databases. I've also reorganized some of the setup scripts to make it easier to see which ones to use, how to turn on the tests for those when you're ready. Finally, I've added a method for changing the ports that are used by the test databases. 



