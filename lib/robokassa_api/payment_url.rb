module RobokassaApi
  module PaymentUrl
    include SignatureGenerator

    URL = 'https://auth.robokassa.ru/Merchant/Index.aspx?'

    def self.create_pay_url(signature, user, out_sum, description)
      url = pay_link(signature, user, out_sum, description)

      if test_mode?
        url + "&IsTest=1"
      else
        url
      end
    end

    def pay_link(signature, user, out_sum, description)
      URL + "MerchantLogin=#{MERCHANT_LOGIN}" +
        "&OutSum=#{out_sum}" + "&InvId=#{INVOICE_ID}" +
        "&Desc=#{description}" + "&SignatureValue=#{signature}" +
        "&Culture=#{CULTURE}" + "&Encoding=#{ENCODING}" + "&Shp_user=#{user.id}"
    end

    def test_mode?
      Robokassa.mode == :test
    end
  end
end