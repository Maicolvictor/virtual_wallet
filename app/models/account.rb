class Account < ApplicationRecord
  has_one :wallet, dependent: :destroy
  has_many :extracts, dependent: :destroy

  accepts_nested_attributes_for :wallet

  validates :owner, :age, :email, presence: true

  after_create :create_initial_wallet

  private

  def create_initial_wallet
    create_wallet(balance: 0)
  end
end
