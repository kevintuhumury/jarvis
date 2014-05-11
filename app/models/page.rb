class Page < ActiveRecord::Base
  acts_as_nested_set

  validates :title, :body, presence: true
end
