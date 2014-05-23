# RAILS FEVER

This repo contains the source for www.railsfever.com


**Deployment Steps**

*With Deploy script:*
Pick one depending on if migrations are needed.

+ bundle exec rake deploy:staging_migrations  OR deploy_staging

+ bundle exec rake deploy:production_migrations OR deploy_production

NOTE: If there are db changes, first do:

heroku run rake db:migrate

Staging: git push staging master

Production: git push heroku master

**Connecting to the rails console**

+ STAGING:  heroku run rails console --remote staging

+ PRODUCTION: heroku run rails console --remote heroku

