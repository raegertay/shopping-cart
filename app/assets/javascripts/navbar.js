$(document).on("turbolinks:load", function() {

  var current_path = window.location.pathname;

  if (current_path == '/' || current_path == '/home' || current_path == '/products' ) {
      window.onscroll = function() {scrollFunction()};
  } else {
    document.getElementById("fixed-navbar").style.top = "0";
  }

  function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
      document.getElementById("fixed-navbar").style.top = "0";
    } else {
      document.getElementById("fixed-navbar").style.top = "-67px";
    }
  }

});
