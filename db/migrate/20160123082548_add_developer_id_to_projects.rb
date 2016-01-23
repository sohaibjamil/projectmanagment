class AddDeveloperIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :developer_id, :integer
  end
end
