class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    return @current_user if @current_user.present?

    @current_user = User.find_by_id(session[:user_id])
    if @current_user.nil?
      @current_user = User.new
      @current_user.env = request.env.select {|k,v| k.match("^HTTP.*|^REMOTE.*")}
      @current_user.save

      session[:user_id] = @current_user.id
    end

    @current_user
  end
end
