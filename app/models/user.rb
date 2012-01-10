class User < ActiveRecord::Base
  # field :name, :type => String
  # field :email, :type => String
  attr_accessible :name, :email
  
  has_many :auths
  has_many :lists
  has_many :items
  
  validates_presence_of :name, :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
end
