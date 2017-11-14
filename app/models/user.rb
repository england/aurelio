class User < ApplicationRecord
  has_and_belongs_to_many :groups
  has_many :testings
  has_many :tests, through: :testings
  # TODO: courses (same as tests)
end
