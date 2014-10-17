class CreateHelps < ActiveRecord::Migration
  def change
    create_table :helps do |t|
      t.string :title
      t.text :content
      t.belongs_to :user
      t.belongs_to :sticky
      t.timestamps
    end
  end
end
