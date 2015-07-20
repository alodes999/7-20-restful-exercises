get "/users/:user_id/stories" do
  @user = User.find(params["user_id"])
  
  @stories = Story.where("user_id = #{params["user_id"]}")
  
  erb :"/stories/usersstories"
end

get "/users/:user_id/stories/new" do
  @user = User.find(params["user_id"])
  
  erb :"/stories/new"
end

post "/users/:user_id/stories" do
  @story = Story.create({"title" => params["story"]["title"]})
  
  redirect "/users/#{params["user_id"]}/stories"
end

get "/users/:user_id/stories/delete" do
  @user = User.find(params["user_id"])
  
  @stories = Story.where("user_id = #{params["user_id"]}")
  erb :"/stories/delete"
end

delete "/users/:user_id/stories/:id" do
  Story.delete(params["story"]["id"])
  
  redirect "/users/#{params["user_id"]}/stories"
end

get "/users/edit" do
  @users = User.all
  erb :"/users/edit"
end

put "/users/:id" do
  @users = User.find(params["users"]["id"])
  
  @users.email = params["users"]["email"]
  @users.password = params["users"]["password"]
  
  @users.save
  
  redirect "/users"
end

get "/users/:id" do
  @users = User.find(params["id"])
  erb :"/users/show"
end