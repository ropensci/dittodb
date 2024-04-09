# Making testing databases easy with dittodb

Testing is critical for good package development. R has a robust testing ecosystem, and pacakges like httptest+webmockr that ease HTTP testing. However, it can be difficult to test functionality that connects with external databases. dittodb solves this by providing an easy way to test functions that connect to databases.

Using dittodb means that one doesn't need to maintain dbs on testing infrastructure, can run tests quickly without the latency of connecting to a db, and can develop functions that interact with a db without direct access to that same db.

While developing dittodb I learned a few lessons about testing and package development that I will share during the talk: why is CI important and what makes a good test.


# Video

Hello I'm Jonathan Keane — while I was trained as a linguist — I have been working as a data scientist in a number of capacities for at least the past 5 years.

Early on in my career I fell down the rabbit hole of test driven development and have been using it ever since. Testing has not only saved me from costly mistakes or bugs I never would have caught without it, it has also made it easier to write better code.

This passion for testing led me to developing the package `dittodb`. `dittodb` makes testing database interactions fast, simple, and fun. It uses the DBI interface to make it easy to set up a mocked database driven by static fixtures so tests are quick and can run anywhere. Though there are packages that make testing HTTP-based APIs easy, like {httptest} and {webmockr}, until `dittodb` there wasn't an equivalent package that made testing database interactions simple. 

Through my talk, people will have an understanding of how to test databse interactions using `dittodb` as well as some more general testing-related ideas about what makes a good test and how testing can improve your R code as well your life as a developer.


I love building and contributing to tools that help people interact with data and empower them to be able to analyze and model their data better, faster, and easier.

https://docs.google.com/forms/d/e/1FAIpQLSduWOeixz5qtw5i4IEhOTAGqFOwmDy-2NjYYlFyu2Dk9WJewA/viewform
