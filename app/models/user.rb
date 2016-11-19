class User < ApplicationRecord
  rolify :role_cname => 'Part'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles

  def to_s
    "#{self.class}:#{id}"
  end
end
