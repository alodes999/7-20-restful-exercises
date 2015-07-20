get "/users" do
  @users = Users.new
  
  erb :"/users/home"
end

get "/users/new" do
  erb :"/users/new"
end

post "/users" do
  @new_user = Users.create({"email" => params["user"]["email"], "password" => params["user"]["password"]})
end