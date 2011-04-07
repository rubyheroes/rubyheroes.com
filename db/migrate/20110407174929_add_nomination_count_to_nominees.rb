class AddNominationCountToNominees < ActiveRecord::Migration
  def self.up
    add_column :nominees, :nomination_count, :integer, :default => 0
  end

  def self.down
    remove_column :nominees, :nomination_count
  end
end
