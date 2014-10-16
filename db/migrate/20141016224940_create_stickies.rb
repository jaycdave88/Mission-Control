class CreateStickies < ActiveRecord::Migration
  def change
    create_table :stickies do |t|
      t.string :title
      t.text :content
      t.belongs_to :user
      t.timestamps
    end
  end
end
