class CreateRideMechanics < ActiveRecord::Migration[5.2]
  def change
    create_table :ride_mechanics do |t|
      t.references :ride
      t.references :mechanic
    end
  end
end
