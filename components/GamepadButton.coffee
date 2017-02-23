
noflo = require "noflo"

# @runtime noflo-browser

class GamepadButton extends noflo.Component
  description: "Send data when a button is pressed"
  
  constructor: ->
    @inPorts =
      button: new noflo.Port 'integer'
      in: new noflo.Port 'object'
    @outPorts =
      out: new noflo.Port

    @buttonIndex

    @inPorts.button.on "data", (data) =>
      @buttonIndex = data

    @inPorts.in.on "data", (data) =>
      unless @buttonIndex is null
        if data[@buttonIndex] == 1
          @outPorts.out.send 1

exports.getComponent = -> new GamepadButton
