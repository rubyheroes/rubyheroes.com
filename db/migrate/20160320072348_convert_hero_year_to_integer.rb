class ConvertHeroYearToInteger < ActiveRecord::Migration
  def up
    change_column :heroes, :year, 'integer USING CAST(year AS integer)'
  end

  def down
    change_column :heroes, :year, 'varchar USING CAST(year AS varchar)'
  end
end
