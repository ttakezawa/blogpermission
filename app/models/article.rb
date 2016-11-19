class Article < ApplicationRecord
  resourcify :authorities, role_cname: 'Authority'
  belongs_to :user
end
