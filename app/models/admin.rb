class Admin < ApplicationRecord
  devise :database_authenticatable, :trackable, :validatable
end
