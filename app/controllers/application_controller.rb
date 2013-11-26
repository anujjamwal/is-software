class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter RubyCAS::Filter
  append_before_filter :authenticate

  def not_found
    render status: 404
  end 

  private
  def authenticate
    @current_user = User.where(emp_id: session[:cas_user]).first_or_create
  end
end
