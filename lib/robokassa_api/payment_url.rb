module RobokassaApi
  module PaymentUrl
    include SignatureGenerator

    URL = 'https://auth.robokassa.ru/Merchant/Index.aspx?'

    def self.create_pay_url(signature, user, out_sum, description)
      url = pay_link(signature, user, out_sum, description)

      url += "&IsTest=1" if test_mode?
    end

    def test_mode?
      Robokassa.mode == :test
    end

    private

    def pay_link(signature, user, out_sum, description)
      URL + "MerchantLogin=#{MERCHANT_LOGIN}" +
        "&OutSum=#{out_sum}" + "&InvId=#{INVOICE_ID}" +
        "&Desc=#{description}" + "&SignatureValue=#{signature}" +
        "&Culture=#{CULTURE}" + "&Encoding=#{ENCODING}" + "&Shp_user=#{user.id}"
    end
  end
end