class RemoveKindFromSnippet < ActiveRecord::Migration
  def change
    remove_column :snippets, :kind
  end
end
