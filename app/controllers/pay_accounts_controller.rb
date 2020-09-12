class PayAccountsController < ApplicationController
  LOAN_ACCOUNT_XML_FILE = "loan.xml"
  LOAN_ACCOUNT_ATTRIBUTES = ["LoanNumber", "BorrowerFullNameUnformated"]

  def index
    @loan_accounts = setup_loan_accounts
    @pay_accounts = PayAccount.all
  end

  def new
    @pay_account = PayAccount.new
  end

  def create
    PayAccount.create(pay_account_params)
    redirect_to pay_accounts_url
  end

  private def pay_account_params
    params.require(:pay_account).permit(:nickname, :account_number, :account_type)
  end

  private def setup_loan_accounts
    account = Account.new(LOAN_ACCOUNT_XML_FILE)
    account.find_attributes(*LOAN_ACCOUNT_ATTRIBUTES)
  end
end
