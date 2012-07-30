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
  

  $('#sort_field th[class*="sort"]').addClass('up_sort')
   
  
  path = document.location.href
  pos = path.indexOf("=")
  method = path.substring(pos-1, pos)
  if method is "q"
    id = path.substring(pos+1)
    $('#'+id).addClass('down_sort')
  
  $('#sort_field th.sort').click ->   
    id = $(this).attr("id")
    location.href = "?q="+id
 
  
  
  
  
    
  $('.date_create').datetimepicker(
    dateFormat: "yy-mm-dd",
    timeFormat: 'hh:mm tt',
    altFormat: 'yy-mm-dd hh:mm:ss',
    altField: 'hidden_announcement_date',
    altFieldTimeOnly: 'false'
  )
  
  $('.data_p').datetimepicker(
    dateFormat: "yy-mm-dd",
    timeFormat: 'hh:mm tt',
    altFormat: 'yy-mm-dd hh:mm:ss',
    altField: 'hidden_announcement_date',
    altFieldTimeOnly: 'false'
  )
