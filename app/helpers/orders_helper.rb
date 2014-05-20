module OrdersHelper

  def name_field
    if Rails.env.development?
      field = text_field_tag "participant[first_name]", nil, :value => "Mike"
    else
      field = text_field_tag "participant[first_name]", nil
    end
     field.html_safe
  end

  def email_address
    if Rails.env.development?
      field = text_field_tag "participant[email]", nil, :value => "#{rand}@gmail.com"
    else
      field = text_field_tag "participant[email]", nil
    end
      field.html_safe
  end

  def phone_field
    if Rails.env.development?
      field = text_field_tag "participant[phone]", nil, :value => "6262444636"
    else
      field = text_field_tag "participant[phone]", nil
    end
      field.html_safe
  end

  def password
    if Rails.env.development?
      field = password_field_tag "participant[password]", nil, :value => "test", :id => "password"
    else
      field = password_field_tag "participant[password]", nil
    end
      field.html_safe
  end

  def card_number_field
    if Rails.env.development?
      field = text_field_tag :card_number, nil, :class => "valid payment-form", :name => "card_number_stripe", :placeholder => "Card Number", :data => {:stripe => 'number' }, :tabindex => 1, :autofocus => true, :value => "4242424242424242"
    else
      field = text_field_tag :card_number, nil, :class => "valid payment-form", :name => "card_number_stripe", :placeholder => "Card Number", :data => {:stripe => 'number' }, :tabindex => 1, :autofocus => true
    end
      field.html_safe
  end

  def card_code_field
    if Rails.env.development?
      field = text_field_tag :card_code, nil,:class => "valid payment-form", :name => "card_code_stripe", :placeholder => "3 or 4 digits", :data => {:stripe => 'cvc' }, :tabindex => 2, :value => "4242"
    else
      field = text_field_tag :card_code, nil,:class => "valid payment-form", :name => "card_code_stripe", :placeholder => "3 or 4 digits", :data => {:stripe => 'cvc' }, :tabindex => 2
    end
      field.html_safe
  end
end
