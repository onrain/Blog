$(document).ready ->
  $('#back_url').click ->
    history.go(-1)
  $("a.fancybox").fancybox()
  

  $('#myModal').modal(
    "backdrop" : "static",
    "keyboard" : true,
    'show'     : false
    )
  
  $('#subsribe').click ->
    $('#myModal').modal(show:true)