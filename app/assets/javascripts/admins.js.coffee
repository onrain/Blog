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
  

  $('#sort_field th').addClass('up_sort')
  
  
  $('#sort_field th').click ->

    $('#sort_field th').removeClass('down_sort')
   
    $(this).toggleClass('down_sort')
    
    
    #$(this).toggleClass("down_sort")
    
    #down_class = $('#sort_field th[class*="down_sort"]')
    #dclass = down_class.attr("class")
    
    #alert dclass
    #alert $(this).attr("class")
    
    
    
    #if $(this).attr("class") is dclass  
      #$(this).toggleClass("down_sort")
    #else
      #down_class.removeAttr("class")
      #down_class.addClass("up_sort")

  
  
  
  
  
    
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
