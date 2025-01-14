const path = require('path');

module.exports = {
  entry: './app/javascript/packs/application.js',
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'public/packs'),
  },
  devServer: {
    static: path.join(__dirname, 'public/packs'),
    contentBase: path.join(__dirname, 'public/packs'),
    compress: true,
    port: 3000,
    hot: true,
    historyApiFallback: true,
    // Outras opções...
  },

  node: {
    __dirname: false,
    __filename: false,
    global: false,
  },


  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: 'babel-loader',
      },
      // Outras regras...
    ],
  },
  
};
