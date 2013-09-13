# flowcopter

NoFlo and NodeCopter examples

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
