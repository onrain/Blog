module AdminsHelper
  
  def get_admin_path(post)
    if post.id.nil?
      admins_path
    else
      admin_path(post)
    end
  end

end
