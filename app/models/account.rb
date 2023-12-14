class Account < ApplicationRecord
  has_one :wallet, dependent: :destroy
  has_many :extracts, dependent: :destroy
  
  accepts_nested_attributes_for :wallet

  validates :owner, :age, :email, presence: true
  validate :valid_age

  after_create :create_initial_wallet

  private

  def create_initial_wallet
    create_wallet(balance: 0)
  end

  def valid_age
    if age.present?
      if age < 0
        errors.add(:age, 'A idade não pode ser um número negativo.')
      elsif age <= 15
        errors.add(:age, 'A idade deve ser maior que 15 anos.')
      end
    end
  end
end
