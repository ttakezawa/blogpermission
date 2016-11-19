class User < ApplicationRecord
  rolify :role_cname => 'Part'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles

  def has_authority?(name, resource)
    parts = roles.preload(:roles)
    return false if parts.blank?
    parts.any? do |part|
      part.has_role?(name, resource)
    end
  end

  def to_s
    "#{self.class}:#{id}"
  end
end
