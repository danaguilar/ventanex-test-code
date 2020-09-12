require "test_helper"

class AccountTest < ActiveSupport::TestCase
  test "reads xml file on initialize" do
    test_account = Account.new("loan.xml")
    assert test_account.xml_data.present?
  end

  test "returns loan number and borrow name from given xml" do
    test_account = Account.new("loan.xml")
    found_attributes = test_account.find_attributes("LoanNumber", "BorrowerFullNameUnformated")
    assert_equal(found_attributes.length, 1)
    assert_equal(found_attributes[0][:LoanNumber], "111111111")
    assert_equal(found_attributes[0][:BorrowerFullNameUnformated], "John Doe")
  end
end