const debug = require('debug')('app:debug');
exports.debug = debug;
const ytDlpStdOut = require('debug')('app:ytdl_stdout');
const ytDlpStdErr = require('debug')('app:ytdl_stderr');
exports.ytDlpDebugger = {ytDlpStdOut, ytDlpStdErr};