class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.column(:name, :string)
      t.column(:cost, :integer)
      t.column(:country_of_origin, :string)
      t.timestamps
    end
  end
end
