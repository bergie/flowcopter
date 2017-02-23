noflo = require "noflo"

# @runtime noflo-browser

class WireCommand extends noflo.Component
  description: "create a wire command for the flowcopter"
  
  constructor: ->
    @inPorts =
      name: new noflo.Port 'string'
      value: new noflo.Port 'string'
    @outPorts =
      out: new noflo.Port
    @name

    @inPorts.name.on "data", (data) =>
      @name = data

    @inPorts.value.on "data", (data) =>
      if @name != null
        object = {}
        object[@name] = data
        @outPorts.out.send object

exports.getComponent = -> new WireCommand
