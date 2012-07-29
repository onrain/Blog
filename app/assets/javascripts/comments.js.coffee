$(document).ready ->
  $('#back_url').click ->
    history.go(-1)
  $("a.fancybox").fancybox()