forever = require('forever')
print   = require('util').print

console.log "starting server..."

# specify our port range for the realtime_node server.
portStart = 8000
portRange = 4
counter   = 0

until portRange == counter # until we've booted everything up.
  port = portStart+counter
  console.log "starting app.js on #{port}..."

  # monitor our scripts, forever.
  new(forever.Forever)('app.js', {
    silent:  true
    forever: true
  })

    .on 'stderr', (d) ->
      print(d.toString())

    .on 'stdout', (d) ->
      print(d.toString())

    .on 'exit', ->
      console.log "child resque_worker_node closed."

    # start our resque_worker_node instance.
    .start()

  counter++