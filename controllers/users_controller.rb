get "/users" do
  @users = Users.new
  
  erb :"/users/home"
end

get "/users/new" do
  erb :"/users/new"
end

post "/users" do
  @new_user = Users.create({"email" => params["user"]["email"], "password" => params["user"]["password"]})
  
  redirect "/users"
end

get "/users/delete" do
  @users = Users.all
  erb :"/users/delete"
end

delete "/users/:x" do
  users.delete(params["user"]["id"])
  
  redirect "/users"
end