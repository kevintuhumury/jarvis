class Page < ActiveRecord::Base
  acts_as_nested_set

  enum state: [:draft, :published]

  validates :title, :body, :state, presence: true
end
