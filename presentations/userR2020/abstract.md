# dittodb: making testing databases easy and some lessons about testing

Testing is a pillar of good R development. There are a number of packages already that make testing easy (eg testthat, vdiffr, shinytest). However, it can be difficult and frustrating to test functionality that connects with external services. dittodb solves this by providing an easy way to test functions that connect to databases.

There are a number of packages that facilitate HTTP-based external services (eg httptest, webmockr), but there haven't been good solutions for testing against databases. dittodb is designed to solve that: It works by recording (and editing if needed) database interactions as mocks and then uses those mocks for automated testing. 

Using dittodb means that one doesn't need to maintain databases on testing infrastructure (eg Travis, Github Actions), can run tests quickly without the latency of connecting to a database, and can develop functions that interact with a database without constant, direct access to that same database. 

Additionally, in developing dittodb I learned a number of lessons about testing and package development that I will share during the talk: why is CI important, what makes a good test, and how can I make testing fun and not a chore
