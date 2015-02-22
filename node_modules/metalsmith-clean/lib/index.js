
var remove = require('fs-extra').remove


function plugin (opts) {
  return function (files, metalsmith, done) {
    remove(metalsmith.destination(), done)
  }
}

module.exports = plugin