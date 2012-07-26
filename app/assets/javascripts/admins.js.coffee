$(document).ready ->
  
  path = window.location.pathname
  
  if path is "/admins/post/new"
    $('#new_art').addClass('active')
  if path is "/admins/comments"
    $('#comments').addClass('active')
  if path is "/admins/post/published"
    $('#pub_art').addClass('active')
  if path is "/admins/post/npublished"
    $('#n_pub_art').addClass('active')
    
  $('.field_with_errors').click ->
    $(this).removeClass('field_with_errors')
    
  $('.datepicker').datepicker()