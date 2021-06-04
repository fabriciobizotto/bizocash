class Tag < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}

  def self.search(search)
    if search
      query = "%#{search}%"
      arel = Tag.arel_table[:name]
      
      @tags = Tag.where(arel.matches(query))
    else
      @tags = Tag.all
    end
  end
end
