module ApplicationHelper
  def full_categories
    Post.categories.inject({}) do |hash, item|
      hash.merge!("#{item.first}" => item.first)
    end
  end
end
