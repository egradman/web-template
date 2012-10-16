module.exports = class View extends Backbone.View
  initialize: ->

  template: =>

  getRenderData: =>

  render: =>
    @$el.html @template(@getRenderData())
    @afterRender()
    this

  afterRender: =>
