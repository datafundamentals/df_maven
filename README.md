# df_maven cookbook
this cookbook was written to install and configure the maven dependency grabber for Java libraries and install them on the system. 

* to verify install at the end of the run, simply log into the machine and run 
mvn -version 

# Requirements

* NOTE1: This cookbook (along with almost all dataFundamentals cookbooks) requires that you have local binaries to install other programs. If you are looking to use these as is, download the df_base cookbook to pull all the repositories. If you are looking to only pull certain binaries, please select the install flavor you would like in the attributes. The only one currently available is for Maven
*NOTE2: Please look at the .kitchen.yml file and adjust the synced folder from what we have run or it won't work
this cookbook requires a working version of Java to be installed. an open JDK of the newest variety is strongly suggested for it to function. Minus the occasional commit issue, using the community java cookbook is the best course of action. this can be paired with the df_java cookbook

This is designed to work using a local binary. the one for this cookbook is located at docs.datafundamentals.com/lib

**NOTE** Please pay attention and adjust the .kitchen.yml file in the synced folder as we have it set up for our systems. This will not spin up unless you adjust it

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
