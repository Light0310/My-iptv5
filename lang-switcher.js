// Simple language switcher: redirects to the selected language page.
// Place this file at /assets/js/lang-switcher.js and add a select element with id="langSelect" in your HTML.
document.addEventListener('DOMContentLoaded', function() {
  var select = document.getElementById('langSelect');
  if (!select) return;
  select.addEventListener('change', function() {
    var v = select.value;
    if (!v) return;
    // map of values to urls
    var map = {
      'default': '/',
      'fr': '/fr.html',
      'en': '/en.html',
      'es': '/es.html',
      'ar': '/ar.html'
    };
    var target = map[v] || '/';
    window.location.href = target;
  });
});
