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



  path = document.location.href
  pos = path.indexOf("=")
  method = path.substring(pos-1, pos)
  
  type = path.indexOf('q')
  postype = path.substring(type+2)
  
  
  
  if method is "s"
    id = path.substring(pos+1, type-1)
  $('#'+id).addClass(postype+'_sort')
  
  $('#sort_field th.sort').click ->
    id = $(this).attr("id")
    switch postype
      when 'up' then location.href = "?s="+id+"&q=down"
      when 'down' then location.href = "?s="+id+"&q=up"
      else location.href = "?s="+id+"&q=up"
    
  lpos = path.lastIndexOf('l')
  ll = path.substring(lpos+2)

  $('#l'+ll).addClass('selectl')
    
  
  
  
    
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
