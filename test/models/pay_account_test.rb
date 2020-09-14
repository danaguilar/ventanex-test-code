require "test_helper"

class PayAccontTest < ActiveSupport::TestCase
  test "Pay accounts much have a nickname" do
    new_account = PayAccount.new(account_number: "111111111111")
    assert_not(new_account.save)
    error_messages = new_account.errors.messages
    assert_equal(error_messages.length, 1)
    assert_equal(error_messages[:nickname].first, "can't be blank")
  end

  test "Pay accounts account numbers must contain exactly 12 characters" do
    new_account = PayAccount.new(nickname: "Test Account")
    assert_not(new_account.save)
    error_messages = new_account.errors.messages
    assert_equal(error_messages.length, 1)
    assert_equal(error_messages[:account_number].first, "must contain exactly 12 characters")
  end
end
