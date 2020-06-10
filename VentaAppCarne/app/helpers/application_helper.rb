module ApplicationHelper
  def admin_logged_in?
       !current_admin.nil?
  end
end
