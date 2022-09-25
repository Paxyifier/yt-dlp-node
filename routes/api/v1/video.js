const router = require('express').Router()
const path = require('path')
const yt_dl = require('../../../clients/youtube-dl')
router.get('/*', (req, res) => {
    const url = req.url.split('/video/')[0];
    yt_dl(url).then((file_path) => {
        res.download(file_path)
    })
    .catch(err => {
        res.send(err.message)
    });
})

module.exports = router