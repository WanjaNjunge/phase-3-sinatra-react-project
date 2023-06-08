class CreateSong < ActiveRecord::Migration[6.1]
  def change
    create_table :song do |t|
      t.string :name
      t.string :artist

      t.timestamps
  end
 end
end
