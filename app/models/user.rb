class User < ActiveRecord::Base
  has_secure_password

  has_many :belts, foreign_key: :owner_id
end
