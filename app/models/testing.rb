class Testing < ApplicationRecord
  belongs_to :test, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
