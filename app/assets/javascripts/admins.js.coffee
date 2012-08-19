$(document).ready ->
  
  path = window.location.pathname
  
  
  switch path
    when "/admins/post/new" then $('#new_art').addClass('active')
    when "/admins/comments" then $('#comments').addClass('active')
    when "/admins/post/published" then $('#pub_art').addClass('active')
    when "/admins/post/npublished" then $('#n_pub_art').addClass('active')
    when "/admins/search" then $('#search').addClass('active')
    when "/admins/subscribes" then $('#subscribes').addClass('active')
    
  $('.field_with_errors').click ->
    $(this).removeClass('field_with_errors')
  

  $('#sort_field th[class*="sort"]').addClass('up_sort')
   
  
  path = document.location.href
  pos = path.indexOf("=")
  method = path.substring(pos-1, pos)
  if method is "s"
    id = path.substring(pos+1)
    $('#'+id).addClass('down_sort')
  
  $('#sort_field th.sort').click ->   
    id = $(this).attr("id")
    location.href = "?s="+id
 
  
  
  
  
    
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
