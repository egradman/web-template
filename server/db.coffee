mongoose = require('mongoose')
redis = require("redis")

exports.initialize_mongo = (mongo_uri)->
  exports.mongo_db = db = mongoose.createConnection(mongo_uri)

  db.on 'error', console.error.bind(console, 'connection error:')
  db.once 'open', ()->
    console.log("connected to mongodb")

exports.initialize_redis = (redis_uri)->
  if redis_uri?
    rtg = require("url").parse(redis_uri)
    exports.redis_db = db = redis.createClient(rtg.port, rtg.hostname)
    redis.auth(rtg.auth.split(":")[1]);
  else
    exports.redis_db = db = redis.createClient()

  db.on "ready", ()->
    console.log("connected to redis")
