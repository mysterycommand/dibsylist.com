class Auth < ActiveRecord::Base
  # field :provider, :type => String
  # field :uid, :type => String
  attr_accessible :provider, :uid
  
  belongs_to :user
  
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider
end
