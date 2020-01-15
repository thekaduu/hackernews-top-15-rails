const scripts = require.context('.', true, /\.js$/)
scripts.keys().forEach(scripts)
