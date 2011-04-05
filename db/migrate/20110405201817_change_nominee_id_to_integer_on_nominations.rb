class ChangeNomineeIdToIntegerOnNominations < ActiveRecord::Migration
  def self.up
    # Manually change id strings into integers
    rename_column :nominations, :nominee_id, :old_nominee_id
    add_column :nominations, :nominee_id, :integer
    Nomination.reset_column_information
    Nomination.all.each do |n|
      n.update_attribute(:nominee_id, n.old_nominee_id.to_i)
    end
    remove_column :nominations, :old_nominee_id
  end

  def self.down
    change_column :nominations, :nominee_id, :string
  end
end
