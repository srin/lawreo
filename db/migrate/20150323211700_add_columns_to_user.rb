class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :company, :string
    add_column :users, :SRA_number, :string, default: ""
    add_column :users, :verified, :boolean, default: false
    add_column :users, :is_solicitor, :boolean, default: false
  end
end
