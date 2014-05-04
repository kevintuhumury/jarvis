class Page < ActiveRecord::Base
  acts_as_nested_set

  validates :name, :content, presence: true
end
