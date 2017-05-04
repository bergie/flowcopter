# flowcopter

[![Greenkeeper badge](https://badges.greenkeeper.io/bergie/flowcopter.svg)](https://greenkeeper.io/)

NoFlo and NodeCopter examples

## Installing

Clone this repository and install the dependencies with:

    $ npm install

Then you can build the client-side file with:

    $ grunt build

## Running

Connect your computer to the network provided by your AR.Drone. Then start the server-side process that communicates with your drone with:

    $ ./node_modules/.bin/noflo graphs/FlowCopter.fbp

Then open one of the client-side files in your browser. If you want to use the gamepad example, you need a compatible gamepad. We've tested this so far only with a USB-connected XBox controller. Click the _Start_ button to get the drone flying.

## WebSocket communications

There is a system for communicating between client-side NoFlo flows and Node.js via WebSockets. This is used in the gamepad example.

The protocol is quite simple. Each command is sent as a JSON object, like the following:

```json
{
  "forward": 0.4
}
```

or

```json
{
  "land": true
}
```

There can be multiple commands in the same payload.
