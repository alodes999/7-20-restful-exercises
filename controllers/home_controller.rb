get "/" do
  @user = User.new
  erb :"/home/login"
end 

post "/save_sign_up" do
  the_password = BCrypt::Password.create(params["user"]["password"])
  new_user = User.create({"email" => params["user"]["email"], "password" => the_password})
  
  redirect "/users"
end

post "/verify_login" do
  attempted_password = params["user"]["password"]
  @user = User.where("email = #{params["user"]["email"]}")
  # Assuming there is a user with the given email address...
  # Make a new BCrypt object with the **password from the database**.
  actual_password = BCrypt::Password.new(@user.password)
  
  session[:user_id] = @user.id
  # So, an example:
  # actual_password = BCrypt::Password.new("$2a$10$87jFZs7pY2Fh33HR.lA9ouVLzevh45esv0UjdYF/b1jOGKC.YtfG2")

  if actual_password == attempted_password
    redirect "/users/#{@user.id}/stories"
  else
    @user.errors << "Invalid login."
    
    erb :"/home/login"
  end
end

get "/logout" do
  session.clear
  redirect "/home/login"
end
