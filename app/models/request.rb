class Request < ActiveRecord::Base
  belongs_to :splash_screen

  attr_accessible :name, :email
end
