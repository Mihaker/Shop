class AddEmailToOrder < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :email, :string
  end
end
