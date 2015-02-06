class AddIndexForHeroesOnYear < ActiveRecord::Migration
  disable_ddl_transaction!

  def change
    add_index :heroes, :year, algorithm: :concurrently
  end
end
