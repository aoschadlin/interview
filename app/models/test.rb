class Test < ActiveRecord::Base
  
  attr_accessible :name, :creatorId
  validates :name, :creatorId, :presence => true
  
  belongs_to :users
end
