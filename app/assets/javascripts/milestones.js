(function() {

  'use strict';

  // define variables
  var items = document.querySelectorAll(".timeline li");

  // check if an element is in viewport
  // http://stackoverflow.com/questions/123999/how-to-tell-if-a-dom-element-is-visible-in-the-current-viewport
  function isElementInViewport(el) {
    var rect = el.getBoundingClientRect();
    return (
      rect.top >= 0 &&
      rect.left >= 0 &&
      rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
      rect.right <= (window.innerWidth || document.documentElement.clientWidth)
    );
  }

  function callbackFunc() {
    for (var i = 0; i < items.length; i++) {
      if (isElementInViewport(items[i])) {
        items[i].classList.add("in-view");
      }
    }
  }

  // listen for events
  window.addEventListener("load", callbackFunc);
  window.addEventListener("resize", callbackFunc);
  window.addEventListener("scroll", callbackFunc);

// var data = {
//   labels: ['Bananas', 'Apples', 'Grapes'],
//   series: [20, 15, 40]
// };

// var options = {
//   labelInterpolationFnc: function(value) {
//   return value[0]
// }
// };

// var responsiveOptions = [
//   ['screen and (min-width: 640px)', {
//   chartPadding: 30,
//   labelOffset: 100,
//   labelDirection: 'explode',
//   labelInterpolationFnc: function(value) {
//   return value;
// }
// }],
// ['screen and (min-width: 1024px)', {
// labelOffset: 80,
// chartPadding: 20
// }]
// ];

// new Chartist.Pie('.ct-chart', data, options, responsiveOptions);
})();
