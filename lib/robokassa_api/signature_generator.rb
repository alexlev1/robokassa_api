require 'digest/md5'

module RobokassaApi
  module SignatureGenerator
    include Data

    def self.create_signature(args)
      if args.include?(:invoice_id)
        create_signature_two(
          user       = args[:user],
          out_sum    = args[:out_sum]
          invoice_id = args[:invoice_id]
        )
      else
        create_signature_one(
          user    = args[:user],
          out_sum = args[:out_sum]
        )
      end
    end

    private

    def create_signature_one(user, out_sum)
      data = "#{MERCHANT_LOGIN}:#{out_sum}:#{INVOICE_ID}:#{PASS_1}:Shp_user=#{user.id}"
      md5(data)
    end

    def create_signature_two(out_sum, invoice_id, user_id)
      data = "#{out_sum}:#{invoice_id}:#{PASS_2}:Shp_user=#{user_id}"
      md5(data).upcase
    end

    def md5(data)
      Digest::MD5.hexdigest(data)
    end
  end
end