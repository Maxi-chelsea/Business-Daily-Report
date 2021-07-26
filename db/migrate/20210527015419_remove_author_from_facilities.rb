class RemoveAuthorFromFacilities < ActiveRecord::Migration[5.2]
  def change
    remove_column :facilities, :postal_code, :integer
  end
end
