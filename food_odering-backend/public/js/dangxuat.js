/******/ (() => { // webpackBootstrap
/*!**********************************!*\
  !*** ./resources/js/dangxuat.js ***!
  \**********************************/
document.getElementById('logoutButton').addEventListener('click', function () {
  localStorage.removeItem('token');
  var form = document.createElement('form');
  form.method = 'POST';
  form.action = '/logout';
  document.body.appendChild(form);
  form.submit();
});
/******/ })()
;