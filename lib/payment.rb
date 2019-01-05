require 'digest/md5'

module Payment
  URL = 'https://auth.robokassa.ru/Merchant/Index.aspx?'
  MERCHANT_LOGIN = 'MERCHANT_LOGIN'
  INV_DESC = 'Payment description'

  # Платёжные пароли
  PASS_1 = 'PASS_1'
  PASS_2 = 'PASS_2'

  INVOICE_ID = '0'
  ENCODING = 'utf-8'
  CULTURE = 'ru'

  def self.create_pay_url(signature, user, out_sum)
    url = URL + "MerchantLogin=#{MERCHANT_LOGIN}" +
      "&OutSum=#{out_sum}" + "&InvId=#{INVOICE_ID}" +
      "&Desc=#{INV_DESC}" + "&SignatureValue=#{signature}" +
      "&Culture=#{CULTURE}" + "&Encoding=#{ENCODING}" + "&Shp_user=#{user.id}"
      # "&IsTest=1" # после тестирования убрать!
  end

  def self.create_signature_one(user, out_sum)
    Digest::MD5.hexdigest("#{MERCHANT_LOGIN}:#{out_sum}:#{INVOICE_ID}:#{PASS_1}:Shp_user=#{user.id}")
  end

  def self.create_signature_two(out_sum, invoice_id, user_id)
    Digest::MD5.hexdigest("#{out_sum}:#{invoice_id}:#{PASS_2}:Shp_user=#{user_id}")
  end

end