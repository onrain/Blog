module AdminsHelper
  
  def get_admin_path(post)
    if post.id.nil?
      admins_path
    else
      admin_path(post)
    end
  end
  
  def search_title(s, par)
    if s.blank?
      "Enter a search text."      
    else
      "Not found <span style='color:red;'>#{s}</span>" if par.empty?
    end
  end
end


#"Enter a search term" unless s.
#"Search did not return results" if par.empty?