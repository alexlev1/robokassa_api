module RobokassaApi
  class PaymentUrl
    include SignatureGenerator

    URL = 'https://auth.robokassa.ru/Merchant/Index.aspx?'

    def self.create_pay_url(signature, user, out_sum, description)
      url = URL + "MerchantLogin=#{MERCHANT_LOGIN}" +
        "&OutSum=#{out_sum}" + "&InvId=#{INVOICE_ID}" +
        "&Desc=#{description}" + "&SignatureValue=#{signature}" +
        "&Culture=#{CULTURE}" + "&Encoding=#{ENCODING}" + "&Shp_user=#{user.id}"
        # "&IsTest=1" # после тестирования убрать!
    end
  end
end