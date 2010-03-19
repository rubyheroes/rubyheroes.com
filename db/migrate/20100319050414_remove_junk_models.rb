class RemoveJunkModels < ActiveRecord::Migration
  def self.up
    drop_table "users"
    drop_table "votes"
    drop_table "categories"
    drop_table "open_id_authentication_associations"
    drop_table "open_id_authentication_nonces"
    drop_table "sessions"
    drop_table "emails"
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration, "Should not be undone. Restructure"
  end
end
