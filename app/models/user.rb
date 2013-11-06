# This file allows access to the database through the User object.
# attr_accessible defines the attributes that are allowed to be used by creating accessor and mutator methods.
# Validation is handled by Devise.
# Configures the modules Devise loads.
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :access
  # attr_accessible :title, :body
end
