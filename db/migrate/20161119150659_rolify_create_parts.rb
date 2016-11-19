class RolifyCreateParts < ActiveRecord::Migration
  def change
    create_table(:parts) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_parts, :id => false) do |t|
      t.references :user
      t.references :part
    end

    add_index(:parts, :name)
    add_index(:parts, [ :name, :resource_type, :resource_id ])
    add_index(:users_parts, [ :user_id, :part_id ])
  end
end
