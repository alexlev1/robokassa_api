class PaymentsController < ApplicationController
  def result
    out_sum     = params['OutSum']
    invoice_id  = params['InvId']
    user        = params['Shp_user']
    signature_1 = params['SignatureValue']

    signature_2 = RobokassaApi.create_signature(args = {
      out_sum: out_sum,
      invoice_id: invoice_id,
      user: user
    })

    # Сравниваем подписи (свою и чужую)
    @result = RobokassaApi.check_signatures(signature1, signature2, invoice_id)
  end

  def success
    redirect_to pay_path, notice: 'Success'
  end

  def failed
    redirect_to pay_path, alert: 'Failed'
  end
end