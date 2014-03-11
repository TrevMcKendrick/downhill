module ReferralCodesHelper

  def symbolify(discount_type,discount_amount)
    if discount_type == "flat_rate"
      "$#{discount_amount}"
    else
      "#{discount_amount}%"
    end
  end 

  def englishify(status)
    if status
      "Yes"
    else
      "No"
    end
  end

end