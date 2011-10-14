class Company < ActiveRecord::Base
  attr_accessible :name, :address1, :address2, :city, :state, :zip, :countryId
  
  validates_presence_of :name, :address1, :city, :state, :zip, :countryId, :on => :create
  validates_uniqueness_of :name
end
