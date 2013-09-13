
noflo = require "noflo"

class GamepadAxis extends noflo.Component
  description: "Send data when a axis is changed"
  
  constructor: ->
    @inPorts =
      axis: new noflo.Port 'integer'
      inverted: new noflo.Port 'bool'
      in: new noflo.Port 'object'
    @outPorts =
      out: new noflo.Port

    @axisIndex
    @inverted = false

    @inPorts.axis.on "data", (data) =>
      @axisIndex = data

    @inPorts.inverted.on "data", (data) =>
      if data = 1
        @inverted = true
      else
        @inverted = false

    @inPorts.in.on "data", (data) =>
      unless @axisIndex is null
        value = data[@axisIndex]
        if @inverted == false and value >= 0
          @outPorts.out.send value
        else if @inverted == true and value <= 0
          @outPorts.out.send value * -1

exports.getComponent = -> new GamepadAxis
