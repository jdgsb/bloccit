 class CommentPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
     user.present?
  end
 
  def new?
    user.present?
  end

  def update?
     create?
  end

  def show?
    user.present?
  end
  
 end