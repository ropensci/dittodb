userR! 2020 talk:

* What is testing?
  - Mocks/fixtures/stubs/spies/fake language 😱
* What is dittodb?
  - Let's you record mock database reponses
* What I've learned developing it
  - CI is super important
    - But also a royal pain for dbs
  - You don't have to test a full path, sometimes up to a query is enough.
    - Two paths:
      - record and then reply
      - verify calls are called (and how they are called)




https://www.martinfowler.com/articles/mocksArentStubs.html

Test doubles
Dummy objects are passed around but never actually used. Usually they are just used to fill parameter lists.
Fake objects actually have working implementations, but usually take some shortcut which makes them not suitable for production (an in memory database is a good example).
Stubs provide canned answers to calls made during the test, usually not responding at all to anything outside what's programmed in for the test.
Spies are stubs that also record some information based on how they were called. One form of this might be an email service that records how many messages it was sent.
Mocks are what we are talking about here: objects pre-programmed with expectations which form a specification of the calls they are expected to receive.


Ideas for talk:
* The lifecycle of a database interaction, what actually happens
