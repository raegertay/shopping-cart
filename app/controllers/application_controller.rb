class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  # # Overwriting the sign_out redirect path method
  # def after_sign_out_path_for(resource_or_scope)
  #   if resource_or_scope == :customer
  #     new_customer_session_path
  #   elsif resource_or_scope == :admin
  #     new_admin_session_path
  #   else
  #     root_path
  #   end
  # end

end
