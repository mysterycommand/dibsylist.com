class Item < ActiveRecord::Base
  # field :label, :type => String
  attr_accessible :label
  
  belongs_to :list
  belongs_to :user
  
  validates_presence_of :label, :list_id
end
