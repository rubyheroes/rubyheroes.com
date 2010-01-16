class CreateNominations < ActiveRecord::Migration
  def self.up
    create_table :nominations do |t|
      t.column :category_id,      :integer, :null => false
      t.column :nominee,          :string,  :null => false
      t.column :nominator_email,  :string,  :null => false
      t.column :nominator_name,   :string,  :null => false
      t.column :nominator_email,  :string,  :null => false
      t.column :site_name,        :string,  :null => false
      t.column :site_url,         :string,  :null => false
      t.column :testimonial,      :text,    :null => false
    end
  end

  def self.down
    drop_table :nominations
  end
end
