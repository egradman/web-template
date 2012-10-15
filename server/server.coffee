express = require("express")
connect = require("connect")
http = require("http")
request = require("request")

path = require("path")
util = require("util")
_ = require("underscore")

SECRET = "alslknn1990w02"

RedisStore = require('connect-redis')(connect)

app = express()
app.configure "development", ->
  conf = require("../conf-development")

app.configure "production", ->
  conf = require("../conf-production")

db_module = require("./db")
db_module.initialize_mongo conf["mongo_uri"]
db_module.initialize_redis conf["redis_uri"]
mongo_db = db_module.mongo_db
redis_db = db_module.redis_db

app.configure ->
  app.set "port", process.env.PORT or 3000
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.use express.favicon()
  app.use express.logger("dev")
  app.use express.cookieParser(SECRET)
  app.use connect.bodyParser()
  app.use express.session({
    store: new RedisStore({client: redis_db}), secret: SECRET }
  )
  app.use app.router
  app.use express.static(path.join(__dirname, "../client/public"))
  app.use express.errorHandler()

conf = undefined


app.get "/api", (req, res)->
  res.json
    success: true
  #res.render "index"
  #  title: "test"

http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")
