class DeleteLikeFromIdea < ActiveRecord::Migration
  def change
  	remove_column('ideas', 'like')
  end
end
