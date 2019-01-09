module PaymentsHelper
  def payment_link(out_sum, description)
    user = set_user
    signature = set_signature_one(user, out_sum)
    payment_link = RobokassaApi.create_pay_url(signature, user, out_sum, description)
  end

  private

  def set_user
    current_user
  end

  def set_signature_one(user, out_sum)
    RobokassaApi.create_signature_one(args = {
      user: user,
      out_sum: out_sum
    })
  end
end