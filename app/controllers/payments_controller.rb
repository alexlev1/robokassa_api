class PaymentsController < ApplicationController
  def pay
  end

  def result
    out_sum = params['OutSum']
    invoice_id = params['InvId']
    user = params['Shp_user']

    signature_1 = params['SignatureValue']
    signature_2 = Payment.create_signature_two(out_sum, invoice_id, user).upcase

    # Сравниваем подписи (свою и чужую)
    if (!signature_1.blank?) && (signature_1 == signature_2)
      @result = "OK#{params['InvId']}"
    else
      @result = "bad sign"
    end
  end

  def success
    redirect_to pay_path, notice: 'Вы успешно оплатили доступ к сервису!'
  end

  def failed
    redirect_to pay_path, alert: 'Оплата не прошла! Попробуйте ещё раз, пожалуйста.'
  end
end