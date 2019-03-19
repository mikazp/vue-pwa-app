module.exports = {
  devServer: {
    port: 80,
    disableHostCheck: true
  },
  pwa: {
    // configure the workbox plugin
    navigateFallback: '/',
    workboxPluginMode: 'InjectManifest',
    workboxOptions: {
      swSrc: 'src/sw.js',
      swDest: 'service-worker.js'
    }
  }
}