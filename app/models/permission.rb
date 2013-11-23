class Permission < ActiveRecord::Base
  attr_accessible :role, :controller, :permission

  message = ValidationValues.message

  validates :role, :controller, :permission, :presence => true
  validates :role, :inclusion => { :in => %w(user driver) }
  validates :controller, :inclusion => { :in => ValidationValues.controllers }
  validates :permission, :inclusion => { :in => ValidationValues.permissions }
end
