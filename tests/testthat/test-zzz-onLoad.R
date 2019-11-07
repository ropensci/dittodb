context("Testing setup of .onLoad()")

# this should always be called last so as not to interfere with other tests
# because the file below unloads the dbtest package.
# We need to source a separate fiel because testthat doesn't directly support
# detaching the current namespace.

source("onLoad-tests.R", local = FALSE)

# TODO: can we mock what packages are available and show that nothing bad happens?
