def current_user
  if session[:user_id]
    @current_user = User.find(session[:user_id])
  else
    redirect "/"
  end
end

get "/users/:user_id/stories" do
  @user = User.find(params["user_id"])
  
  @stories = Story.where("user_id = #{params["user_id"]}")
  
  erb :"/stories/usersstories"
end

get "/users/:user_id/stories/new" do
  # current_user
  
  @user = User.find(params["user_id"])
  
  erb :"/stories/new"
end

post "/users/:user_id/stories" do
  @story = Story.create({"title" => params["story"]["title"], "user_id" => params["user_id"]})
  
  redirect "/users/#{params["user_id"]}/stories"
end

get "/users/:user_id/stories/delete" do
  # current_user
  
  @user = User.find(params["user_id"])
  
  @stories = Story.where("user_id = #{params["user_id"]}")
  erb :"/stories/delete"
end

delete "/users/:user_id/stories/:id" do
  Story.delete(params["story"]["id"])
  
  redirect "/users/#{params["user_id"]}/stories"
end

get "/users/:user_id/stories/edit" do
  # current_user
  
  @user = User.find(params["user_id"])
  
  @stories = Story.where("user_id = #{params["user_id"]}")
  erb :"/stories/edit"
end

put "/users/:user_id/stories/:id" do
  @story = Story.find(params["story"]["id"])
  
  @story.title = params["story"]["title"]
  
  @story.save
  
  redirect "/users/#{params["user_id"]}/stories"
end