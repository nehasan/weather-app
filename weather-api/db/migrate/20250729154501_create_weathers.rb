class CreateWeathers < ActiveRecord::Migration[7.2]
  def change
    create_table :weathers do |t|
      t.string :zip_code
      t.date :day
      t.text :data

      t.timestamps
    end
  end
end
