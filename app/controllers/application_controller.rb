class ApplicationController < ActionController::Base


  private
  def login_check
    if !user_signed_in?
      flash[:notice] = "You need to Sing In first"
      redirect_to(root_path)
    end
  end
end
