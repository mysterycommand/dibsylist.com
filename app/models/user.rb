class User < ActiveRecord::Base
  # field :name, :type => String
  # field :email, :type => String
  attr_accessible :name, :email
  
  has_many :auths, :dependent => :destroy
  has_many :lists, :dependent => :destroy
  has_many :items # , :dependent => :nullify
  
  validates_presence_of :name, :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
end
