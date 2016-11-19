class ArticlePolicy < ApplicationPolicy
  def update?
    return false unless user
    user.has_authority?(:update, record) || user.id == record.user_id
  end
end
