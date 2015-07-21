def current_user
  if session[:user_id]
    @current_user = User.find(session[:user_id])
  else
    redirect "/"
  end
end

get "/users" do
  @users = User.all
  
  erb :"/users/home"
end

get "/users/:id/delete" do
  current_user
  User.delete(params["id"])
  
  redirect "/users"
end

get "/users/:id/edit" do
  current_user
  @users = User.find(params["id"])
  # @users = User.all
  erb :"/users/edit"
end

put "/users/:id" do
  @users = User.find(params["id"])
  
  @users.email = params["users"]["email"]
  
  @users.save
  
  redirect "/users"
end

get "/users/:id" do
  @users = User.find(params["id"])
  erb :"/users/show"
end