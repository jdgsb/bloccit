class Topic < ActiveRecord::Base
  has_many :posts

  def self.per_page
    50
  end
end
