class PayAccountPresenter
  delegate :nickname, :account_number, :account_type, to: :@pay_account

  def initialize(pay_account)
    @pay_account = pay_account
    @error_messages = @pay_account.errors.messages
  end

  def nickname_classes
    return valid_classes if valid_nickname?
    invalid_classes
  end

  def account_number_classes
    return valid_classes if valid_account_number?
    invalid_classes
  end

  def valid_nickname?
    @error_messages[:nickname].empty?
  end
  
  def valid_account_number?
    @error_messages[:account_number].empty?
  end

  def nickname_error_messages
    @error_messages[:nickname].map do |message|
      "Nickname " + message
    end
  end

  def account_number_error_messages
    @error_messages[:account_number].map do |message|
      "Account number " + message
    end
  end

  private def valid_classes
    "form-control"
  end

  private def invalid_classes
    "form-control is-invalid"
  end
end