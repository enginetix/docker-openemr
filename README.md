# docker-openemr

Docker container for [OpenEMR 5.0.0][3]

"OpenEMR is a Free and Open Source electronic health records and medical practice management application that can run on Windows, Linux, Mac OS X, and many other platforms. OpenEMR is ONC certified and is one of the most popular open source electronic medical records in use today. OpenEMR is [supported][6] by a strong community of volunteers and [professionals][7] all with the common goal of making OpenEMR a superior alternative to its proprietary counterparts. The OpenEMR community is dedicated to guarding OpenEMR's status as a free, open source software solution for medical practices and is dedicated to maintaining a spirit of openness, kindness and cooperation."

## Install dependencies

  - [Docker][2]

To install docker in Ubuntu 16.04 use the commands:

    $ sudo apt-get update
    $ sudo wget -qO- https://get.docker.com/ | sh

 To install docker in other operating systems check [docker online documentation][4]

## Usage

If you need a MySQL database you can link container :

    $ docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=mysecretpassword -d mysql:5.6
    
note: using version 5.6 of mysql because openemr have some problem with newer version of mysql.
    
Or you can used pre-existing mysql database but you need to have mysql root password for it.

Them create, run and link to the OpenEMR container:

    $ docker run -d -p 80 --link some-mysql:db quantumobject/docker-openemr

where when been ask for database need to replace localhost for db.

## Web install procedure :

Check with your browser to the assigned xxxx port by docker or you to continue web installation.

  - **https://host_ip/**

Where you need to fallow this steps :

  - Open EMR Setup : press _continue_.

  - Open EMR Setup step 1 : option suppose to be "Have setup create the database" and press _continue_.

  - Open EMR Setup step 2 : 

   MYSQL SERVER: 
    - Server Host ==> db  (this is relate to link container _some-mysql:db_)angelrr7702-patch-1
    - Server Port ==> 3306 (stay the same)
    - Database Name ==> openemr (stay the same)
    - Login Name ==> openemr (stay the same)
    - PASSWORD ==>  xxxxxxx  (you need to created a password for the database fallow site recomendation)
    - Name for Root Account ==> root (normally stay the same)
    - Root Pass:  ==> xxxxxx (root password for your mysql database ; the same when you created the mysql container)
    - User Hostname ==> %  (this normally no recomended but the mysql container will be internally linked with openemr container)
    - UTF-8 Collation ==> General (stay the same)
 
  OPENEMR USER:

   - Initial User Password: need to entry a new password for admin user(remember it needed to log in).
   - Press _continue_.

- Open EMR Setup step 3 to 6 : press continue.

- Open EMR Setup step congratualtion page : press _continue_.

After the web installation need to run this command to increase security :

    $ docker exec -it container_id after_install

note: deploy this container behind proxy with SSL :

https://github.com/jwilder/nginx-proxy

https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion

## More Info

About OpenEMR: [www.open-emr.org][1]

To help improve this container [quantumobject/docker-openemr][5]

Example of [OpenEMR][8]

For additional info about us and our projects check our site [www.quantumobject.org][9]

[1]:http://open-emr.org/
[2]:https://www.docker.com
[3]:http://open-emr.org/wiki/index.php/OpenEMR_Downloads
[4]:http://docs.docker.com
[5]:https://github.com/QuantumObject/docker-openemr
[6]:http://open-emr.org/wiki/index.php/OpenEMR_Support_Guide
[7]:http://open-emr.org/wiki/index.php/OpenEMR_Professional_Support
[8]:https://openemr.quantumobject.com/
[9]:https://www.quantumobject.org/
