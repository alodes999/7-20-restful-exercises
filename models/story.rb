unless ActiveRecord::Base.connection.table_exists?(:stories)
  ActiveRecord::Base.connection.create_table :stories do |s|
    s.string :title
    s.integer :user_id
  end
end

class Story < ActiveRecord::Base
  belongs_to :users
  
  
end

