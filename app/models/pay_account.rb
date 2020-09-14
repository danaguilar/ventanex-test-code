class PayAccount < ActiveRecord::Base
  validates :nickname, presence: true
  validates :account_number,
    length: { is: 12, wrong_length: "must contain exactly 12 characters" }

  enum account_type: {bank_account:  1, debit_card: 2}
end
