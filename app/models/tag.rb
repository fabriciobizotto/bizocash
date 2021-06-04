class Tag < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}
end
