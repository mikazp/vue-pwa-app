workbox.setConfig({
  debug: true
});

workbox.core.setCacheNameDetails({prefix: "vue-skeleton"});

/**
 * The workboxSW.precacheAndRoute() method efficiently caches and responds to
 * requests for URLs in the manifest.
 * See https://goo.gl/S9QRab
 */
self.__precacheManifest = [].concat(self.__precacheManifest || []);
workbox.precaching.suppressWarnings();
workbox.precaching.precacheAndRoute(self.__precacheManifest, {});


workbox.routing.registerRoute(/\.(?:png|gif|jpg|svg)$/,
    workbox.strategies.cacheFirst({
      cacheName: 'images-cache'
    })
);

workbox.routing.registerRoute(/\.(?:js|css|json)$/,
    workbox.strategies.staleWhileRevalidate({
      cacheName: 'static-resources'
    })
);

workbox.routing.registerNavigationRoute('/index.html');

