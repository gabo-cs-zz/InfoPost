class Post < ApplicationRecord
  enum category: [:Web, :Mobile, :Desktop]
  validates :title, presence: true
  
  def soft_delete
    update(status: 0)
  end
end
