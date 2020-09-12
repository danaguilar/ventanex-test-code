class PayAccountsController < ApplicationController

  # TODO: Add lookup to Account class

  def index
    @pay_accounts = PayAccount.all
  end

  def new
    @pay_account = PayAccount.new
  end

  def create
    PayAccount.create(pay_account_params)
    redirect_to pay_accounts_url
  end

  def pay_account_params
    params.require(:pay_account).permit(:nickname, :account_number, :account_type)
  end
end
