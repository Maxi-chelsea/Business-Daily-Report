class AddColumnsToFacilities < ActiveRecord::Migration[5.2]
  def change
    add_column :facilities, :postcode, :integer
    add_column :facilities, :prefecture_code, :integer
    add_column :facilities, :address_city, :string
    add_column :facilities, :address_street, :string
    add_column :facilities, :address_building, :string
  end
end
