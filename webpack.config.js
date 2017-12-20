const path = require('path');
const webpack = require('webpack');

module.exports = {
    entry: [
        path.join(__dirname, './src/index.js'),
    ],
    devtool: 'soource-map',

    module: {
		rules: [
            {
                test: /\.wasm$/,
                loaders: ['wasm-loader']
            }
        ]
	},
    output: {
        path: path.join(__dirname, 'dist'),
        publicPath: '/dist/',
        filename: 'bundle.js'
    }
}
