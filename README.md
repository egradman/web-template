# My web template: express + mongo + redis + coffeescript + jade including public directory built with brunch: Bootstrap, Stylus, and CoffeeScript

# Heroku

heroku create
heroku config:add NODE_ENV=production
heroku addons:add mongolab:starter
heroku heroku addons:add mongolab:starter
git push heroku master

