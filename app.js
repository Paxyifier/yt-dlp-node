// imports
require('dotenv').config()
const express = require('express')
const path = require('path')
const morgan = require('morgan')
const helmet = require('helmet')
const app = express()

// routes
const apiRouter = require('./routes/api')
const { debug } = require("./debugger/debug")
app.use(helmet())
if (app.get('env')!='production' || process.env.LOG_LEVEL !== 'debug'){
    app.use(morgan('tiny'))
    debug('morgan enabled')
}
app.use(express.json());
//::TODO /{video,playlist}/{format}
app.get('/',(req, res) => {
    res.send(`use ${req.url}<videourl>`)
})
app.use('/api',apiRouter)

app.listen(process.env.PORT||3000,()=>{
    debug(`listening on port ${process.env.PORT||3000}`)
});
