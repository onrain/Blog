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
    
  $('.date_create').datetimepicker(
    dateFormat: "yy-mm-dd",
    timeFormat: 'hh:mm tt',
    altFormat: 'yy-mm-dd hh:mm:ss',
    altField: 'hidden_announcement_date',
    altFieldTimeOnly: 'false'
  )
