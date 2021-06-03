class Account < ApplicationRecord
  belongs_to :user

  validates :name, presence:true, uniqueness:true
  # validates :name, uniqueness: {scope: [:name, :active, :investment]}

end
