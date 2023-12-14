class Extract < ApplicationRecord
  belongs_to :account
  belongs_to :wallet
  
  validates :transaction_type, :amount, presence: true
end
