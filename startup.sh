#!/bin/bash

set -e

if [ -f /etc/configured ]; then
  echo 'already configured'
else
  #code that need to run only one time ....
  a2enmod rewrite
   
   chown -R www-data:www-data /var/www/openemr/gacl/admin/templates_c
   chown -R www-data:www-data /var/www/openemr/sites/default/edi
   chown -R www-data:www-data /var/www/openemr/sites/default/era
   chown -R www-data:www-data /var/www/openemr/sites/default/documents
   chown -R www-data:www-data /var/www/openemr/sites/default/letter_templates
   #this 3 maybe fail....
   chown -R www-data:www-data /var/www/openemr/library/freeb
   chown -R www-data:www-data /var/www/openemr/interface/main/calendar/modules/PostCalendar/pntemplates/compiled
   chown -R www-data:www-data /var/www/openemr/interface/main/calendar/modules/PostCalendar/pntemplates/cache
   
  #needed for fix problem with ubuntu and cron
  update-locale
  date > /etc/configured
fi
