class AddGithubUsernameIndexToNominees < ActiveRecord::Migration
  disable_ddl_transaction!

  def change
    add_index :nominees, :github_username, algorithm: :concurrently
  end
end
