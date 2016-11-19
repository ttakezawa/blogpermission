class Authority < ApplicationRecord
  has_and_belongs_to_many :parts, :join_table => :parts_authorities

  belongs_to :resource,
             :polymorphic => true,
             :optional => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify
end
