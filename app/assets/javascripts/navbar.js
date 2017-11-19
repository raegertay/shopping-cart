$(document).on("turbolinks:load", function() {

  var current_path = window.location.pathname;
  var fixed_navbar = document.getElementById("fixed-navbar");
  if (fixed_navbar) {
    if (current_path == '/' || current_path == '/home' || current_path == '/products' ) {
      // alert(current_path);
      window.onscroll = function() {scrollFunction()};
    } else {
      window.onscroll = null;
      // alert('Turbolink before: ' + document.getElementById("fixed-navbar").style.top);
      document.getElementById("fixed-navbar").style.top = "0";
      // alert('Turbolink before: ' + document.getElementById("fixed-navbar").style.top);
    }
  }

  function scrollFunction() {
    // alert('Running scrollfunction');
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
      document.getElementById("fixed-navbar").style.top = "0";
    } else {
      document.getElementById("fixed-navbar").style.top = "-67px";
      // alert('Navbar hid');
    }
  }

});
