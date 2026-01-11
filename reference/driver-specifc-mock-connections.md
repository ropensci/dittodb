# Driver-specific mock classes

Each of the drivers that are supported have their own mock connection
class. They all inherit from `DBIMockConnection` as well as their own
driver's connection class. Each is only really available if the
corresponding package is installed.
