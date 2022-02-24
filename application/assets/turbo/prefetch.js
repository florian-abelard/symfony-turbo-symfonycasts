// https://gist.github.com/vitobotta/8ac3c6f65633b5edb2949aeff0dec69b

// This code is to be used with https://turbo.hotwire.dev. By default Turbo keeps visited pages in its cache
// so that when you visit one of those pages again, Turbo will fetch the copy from cache first and present that to the user, then
// it will fetch the updated page from the server and replace the preview. This makes for a much more responsive navigation
// between pages. We can improve this further with the code in this file. It enables automatic prefetching of a page when you
// hover with the mouse on a link or touch it on a mobile device. There is a delay between the mouseover event and the click
// event, so with this trick the page is already being fetched before the click happens, speeding up also the first
// view of a page not yet in cache. When the page has been prefetched it is then added to Turbo's cache so it's available for
// the next visit during the same session. Turbo's default behavior plus this trick make for much more responsive UIs (non SPA).

import * as Turbo from '@hotwired/turbo';

let lastTouchTimestamp
let delayOnHover = 65
let mouseoverTimer

const pendingPrefetches = new Set()

const eventListenersOptions = {
  capture: true,
  passive: true,
}

class Snapshot extends Turbo.navigator.view.snapshot.constructor {
}
