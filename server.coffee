fs = require 'fs'
http = require 'http'
## Changement de configuration : pas pris en compte

application = module.exports = (callback) ->
    data =
        token: process.env.TOKEN or false
        name: process.env.NAME or false
        global: process.env.GLOBAL or false
        test: process.env.TEST or false
    fs.writeFile "#{process.env.HOME}/test-env.json", JSON.stringify(data), (err) ->
        console.log err
        http.createServer (req, res) ->
          res.writeHead 200, {'Content-Type': 'application/json'}
          res.end '{}'
        .listen 1337, '127.0.0.1'
        setTimeout () ->
          data.test()
        , 5 * 1000

if not module.parent
    application()
