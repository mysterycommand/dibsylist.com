class List < ActiveRecord::Base
  # field :title, :type => String
  attr_accessible :title
  
  belongs_to :user
  has_many :items, :dependent => :destroy
  
  validates_presence_of :title, :user_id
end
