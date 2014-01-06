# Food Mesh

## Features
+ Search Food Items from different sources. Currently:
	+ FDDB (http://fddb.info/)
    + Nutritionix (http://www.nutritionix.com/api)
    + Fatsecret (http://www.fatsecret.com/)
    + other apis may be available in the future
+ Cache Food Items:
	+ all Searches and Food Items are stored in a mongoDB Database
    	+ Info: the database is currently hosted on lnx-tm.may-it.net
+ Two different chart views all created with SVG and Animated with
	+ Single item (animated with http://d3js.org/)
    + Multiple Item Chart


## mongoDB Info
Because we forgott to request a mongoDB database and the port 27027 is not opend on the FH Webspace we've deployed our project to heroku and hosted the database on lnx-tm.may-it.net.
So if the port is opend on the server, the application should be running without any issues.


## Admin Dashboard
This project contains an administrative interface, which can be accessed via <root_url>/admin (currently this is http://food-mesh.herokuapp.com/admin)
There is currently a demo usere with the following credentials:

	Username: demo@fh-salzburg.ac.at
	Password: foodmesh#2014


### Features of the Dashboard
+ add/remove Admins
+ clear search cache
+ view most searched queries
+ administer nutrition information
+ change homepage text


## About
Food Mesh is a projekt by our awesome team:

### Developer
+ Franziska Oberhauser
+ Thomas Mayrhofer

### Graphics
+ Gudrun Öhlinger
+ Nora Sieß
+ Marie-Therese Schweitl

##Impressum
This project is a Multimedia Project for our studies at the University of Applied Sciences in Salzburg/Austria.
