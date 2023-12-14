class Wallet < ApplicationRecord
  belongs_to :account
  has_many :extracts, dependent: :destroy

  validates :balance, presence: true

  accepts_nested_attributes_for :extracts

  before_update :update_extract

  def update_extract
    if balance_changed?
      transaction_type = balance > balance_was ? 'credited' : 'debited'
      amount_changed = balance - balance_was
      extracts.create(transaction_type: transaction_type, amount: amount_changed, date: Time.current)
    end
  end
end