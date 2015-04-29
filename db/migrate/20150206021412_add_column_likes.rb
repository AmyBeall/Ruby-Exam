class AddColumnLikes < ActiveRecord::Migration
  def change
  	add_column('ideas', 'count', 'integer')
  end
end
