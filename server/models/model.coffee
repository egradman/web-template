# this is a sample

db = require("../db").db
mongoose = require("mongoose")
thingSchema = new mongoose.Schema(
  foo: String
)
Thing = db.model("Thing", thingSchema)

module.exports.Thing = Thing
