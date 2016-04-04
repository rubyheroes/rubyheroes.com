class AddUniqueIndexOnNomineeGithubUsername < ActiveRecord::Migration
  disable_ddl_transaction!

  def change
    remove_index :nominees, :github_username
    add_index :nominees, :github_username, unique: true, algorithm: :concurrently
  end
end
