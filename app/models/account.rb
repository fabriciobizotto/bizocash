class Account < ApplicationRecord
  belongs_to :user

  validates :name, presence:true, uniqueness:true
  # validates :name, uniqueness: {scope: [:name, :active, :investment]}


  def self.search(search)
    if search
      query = "%#{search}%"
      arel = Account.arel_table[:name]
      
      @accounts = Account.where(arel.matches(query))
    else
      @accounts = Account.all
    end
  end
  

end
