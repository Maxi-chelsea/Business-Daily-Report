class ChangeDatatypePostcodeOfFacilities < ActiveRecord::Migration[5.2]
  def change
    change_column :facilities, :postcode, :string
  end
end
