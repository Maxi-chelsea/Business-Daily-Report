class ChangeDatatypePrefectureCodeOfFacilities < ActiveRecord::Migration[5.2]
  def change
    change_column :facilities, :prefecture_code, :string
  end
end
