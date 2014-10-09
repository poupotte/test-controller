fs = require 'fs'
## Changement de configuration : pas pris en compte

application = module.exports = (callback) ->
    data =
        token: process.env.TOKEN or false
        name: process.env.NAME or false
        global: process.env.GLOBAL or false
        test: process.env.TEST or false
    fs.writeFile "#{process.env.HOME}/test-env.json", JSON.stringify(data), (err) ->
        console.log err

if not module.parent
    application()