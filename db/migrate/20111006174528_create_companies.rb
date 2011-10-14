class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.integer :countryId

      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
