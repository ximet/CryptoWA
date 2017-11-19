const path = require('path');
const webpack = require('webpack');
const ExtractTextPlugin = require("extract-text-webpack-plugin");
const HappyPack = require('happypack');
const WebpackMonitor = require('webpack-monitor');

module.exports = {
    entry: [
        './src/index.js',
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
