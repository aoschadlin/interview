# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Company.create(:name => "Kyeema Inc", :address1 => "2218 Blossom Crest Way", :city => "San Jose", :state => "CA", :zip => "95124", :countryId => 244)

User.create(:firstName => "Super", :lastName => "User", :email => "super@example.com", :password => "foobar", :companyId => "1", :roles => "[1,2,3,4,5]")

