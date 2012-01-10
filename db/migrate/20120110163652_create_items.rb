class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :label
      t.integer :list_id
      t.integer :user_id

      t.timestamps
    end
  end
end
