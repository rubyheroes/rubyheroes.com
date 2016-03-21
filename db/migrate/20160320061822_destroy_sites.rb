class DestroySites < ActiveRecord::Migration
  def up
    drop_table :sites
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
