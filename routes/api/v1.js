const router = require('express').Router()

const video= require('./v1/video')
router.use('/video',video);

module.exports = router