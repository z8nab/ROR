class SessionsController < ApplicationController
	skip_before_action :authorize
  def new
  end

  def create
  	user = User.find_by(name: params[:name])
  	  if (user.nil? == false) 
        if user.authenticate(params[:password]) 
          puts user.authenticate(params[:password])
          puts "NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN Batman!"
          session[:user_id] = user.id
          flash[:success] = "Thanks for logging in!"
          redirect_to admin_url
        else 
          puts user.authenticate(params[:password])
          puts "waka waka waka waka waka waka waka waka waka waka waka waka waka waka waka waka"
          flash[:error] = "There was an error logging in. Please check your email and password"
          render action: "new"
        end
      else
        flash[:error] = "There was an error logging in. Please check your email and password"
        render action: "new"
      end	
  end


  def destroy
  	session[:user_id] = nil
  	redirect_to login_url, alert:"sucess"
  end
end
