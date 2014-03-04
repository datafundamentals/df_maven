# df_maven cookbook
this cookbook was written to install and configure the maven dependency grabber for Java libraries and install them on the system. 

* to verify install at the end of the run, simply log into the machine and run 
mvn -version 

# Requirements
this cookbook requires a working version of Java to be installed. an open JDK of the newest variety is strongly suggested for it to function. Minus the occasional commit issue, using the community java cookbook is the best course of action.

This will be used for both ubuntu and CentOS systems
# Usage
This is open to anybody who would choose it, and should be able to be used for both dev envrironments 
and servers

**AS A NOTE**
Version 0.1.3- dedicated to the jenkins box
Version 0.1.4- advanced version for the vagrant vm testing
# Attributes
 
 * node ['df_maven']['url']: the site link where you would download the mirror for development

* case node['platform_family']: This is an attribute that is platform dependent to help set the PATH for maven.

# Recipes
depends on the java recipe to be installed first 

* default: downloads the maven RPM, unzips it, and sets all maven homes and paths to work properly
* set_maven_home: helps prevent clutter in the main recipe by setting the maven home for you.

# Author

Author:: Jeff Carapetyan (<YOUR_EMAIL>)
