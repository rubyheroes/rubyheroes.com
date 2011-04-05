class ChangeNomineeIdToIntegerOnNominations < ActiveRecord::Migration
  def self.up
    nominations = {}
    Nomination.all.each do |n|
      nominations[n.id] = n.nominee_id.to_i
    end
    change_column :nominations, :nominee_id, :integer, :limit => 8
    Nomination.reset_column_information
    Nomination.all.each do |n|
      n.update_attribute(:nominee_id, nominations[n.id])
    end
  end

  def self.down
    nominations = {}
    Nomination.all.each do |n|
      nominations[n.id] = n.nominee_id.to_s
    end
    change_column :nominations, :nominee_id, :string
    Nomination.reset_column_information
    Nomination.all.each do |n|
      n.update_attribute(:nominee_id, nominations[n.id])
    end
  end
end
