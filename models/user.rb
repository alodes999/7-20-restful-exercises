class User < ActiveRecord::Base
  has_many :stories
  
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  
  unless ActiveRecord::Base.connection.table_exists?(:users)
    ActiveRecord::Base.connection.create_table :users do |c|
      c.string :email
      c.text :password
    end
  end
  
end