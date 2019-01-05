module PaymentsHelper
  def payment_link(out_sum)
    user = set_user
    signature = set_signature_one(user, out_sum)
    payment_link = Payment.create_pay_url(signature, user, out_sum)
  end

  private

  def set_user
    current_user
  end

  def set_signature_one(user, out_sum)
    Payment.create_signature_one(user, out_sum)
  end
end