Ruby Hero Awards
================

Nomination Site & Application

+ v1 Created by [Envy Labs](http://envylabs.com)
+ v2 Rebuilt and redesigned by [cleverCode](http://clevercode.net)
+ v3 Redesigned by Nick Walsh [Envy Labs](http://envylabs.com) in February 2013


###Dependencies###
+ Rails v2.3.5
+ Haml v2.2.22
+ Formtastic v0.9.4
+ RDiscount v1.6.3
+ Will_Paginate v2.3.11


###To install###

1 First install gem dependencies
_(unless on heroku, done automatically with .gems file)_
    
    [sudo] rake gems:install
    


2 Load the database configuration

    rake db:schema:load
    
3 Load the default data (Past heroes)

    rake db:populate
    
4 Start the server.

## Stats

### 2013
| Nominations | Nominees | Nominators | 
| --- | --- | --- | 
| 898 | 272 | 773 |
