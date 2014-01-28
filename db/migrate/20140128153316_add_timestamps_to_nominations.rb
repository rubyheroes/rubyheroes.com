class AddTimestampsToNominations < ActiveRecord::Migration
  def change
    add_timestamps(:nominations)
  end
end
