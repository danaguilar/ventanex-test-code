class PayAccount < ActiveRecord::Base
  validates :nickname, presence: true
  validates :account_number,
    length: { is: 12, wrong_length: "must contain exactly 12 characters" }

  scope :recent_accounts, -> { order(created_at: :desc).limit(5) }
  enum account_type: {bank_account:  1, debit_card: 2}
end
