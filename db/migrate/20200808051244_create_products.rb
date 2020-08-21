class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :model
	    t.string :manufacturer
	    t.integer :cost_in_credits
	    t.integer :length
	    t.integer :max_atmosphering_speed
	    t.integer :crew
      t.integer :passengers

      t.timestamps
    end
  end
end
