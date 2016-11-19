class RolifyCreateAuthorities < ActiveRecord::Migration
  def change
    create_table(:authorities) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:parts_authorities, :id => false) do |t|
      t.references :part
      t.references :authority
    end

    add_index(:authorities, :name)
    add_index(:authorities, [ :name, :resource_type, :resource_id ])
    add_index(:parts_authorities, [ :part_id, :authority_id ])
  end
end
