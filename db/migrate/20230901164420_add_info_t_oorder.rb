class AddInfoTOorder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :number, :string
    add_column :orders, :description, :string
  end
end
