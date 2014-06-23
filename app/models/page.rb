class Page < ActiveRecord::Base

  extend FriendlyId

  friendly_id :title, use: :slugged

  acts_as_nested_set

  enum state: [:draft, :published]

  validates :title, :body, :state, presence: true

  protected

  def should_generate_new_friendly_id?
    new_record? || changes.keys.include?("title")
  end
end
