# RAILS FEVER

This repo contains the source for www.railsfever.com


**Deployment Steps**

*With Deploy script:*

+ bundle exec rake deploy:staging_migrations

+ bundle exec rake deploy:production_migrations

NOTE: If there are db changes, first do:

heroku run rake db:migrate

Staging: git push staging master

Production: git push heroku master

**Connecting to the rails console**

+ STAGING:  heroku run rails console --remote staging

+ PRODUCTION: heroku run rails console --remote heroku

