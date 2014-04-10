module OrdersHelper
  def ticket(ticket_array)
    ticket = @event.tickets.find_by ticket_type: ticket_array.first
  end

  def ticket_price(ticket_array)
    ticket(ticket_array).price
  end

  def ticket_type(ticket_array)
    ticket(ticket_array).ticket_type
  end

  def ticket_free?(ticket_array)
     ticket(ticket_array).free?
  end

  def name_field(ticket)
    if Rails.env.development?
      field = text_field_tag "#{ticket}[]" + 'name[]', nil, :class => "form-control", :value => "Mike Perley"
    else
      field = text_field_tag "#{ticket}[]" + 'name[]', nil, :class => "form-control"
    end
     field.html_safe
  end

  def email_field(ticket)
    if Rails.env.development?
      field = email_field_tag "#{ticket}[]" + 'email[]', nil, :class => "form-control ", :value => "#{rand}@gmail.com"
    else
      field = email_field_tag "#{ticket}[]" + 'email[]', nil, :class => "form-control "
    end
      field.html_safe
  end

  def phone_field(ticket)
    if Rails.env.development?
      field = phone_field_tag "#{ticket}[]" + 'phone[]', nil, :class => "form-control", :value => "6262444636"
    else
      field = phone_field_tag "#{ticket}[]" + 'phone[]', nil, :class => "form-control"
    end
      field.html_safe
  end

  def password_field(ticket)
    if Rails.env.development?
      field = text_field_tag "#{ticket}[]" + 'password[]', nil, :class => "form-control", :value => "password_test"
    else
      field = text_field_tag "#{ticket}[]" + 'password[]', nil, :class => "form-control"
    end
      field.html_safe
  end

  def card_number_field
    if Rails.env.development?
      field = text_field_tag :card_number, nil, :class => "valid payment-form", name: nil, :placeholder => "Card Number", :data => {:stripe => 'number' }, :tabindex => 1, :autofocus => true, :class => "form-control", :value => "4242424242424242"
    else
      field = text_field_tag :card_number, nil, :class => "valid payment-form", name: nil, :placeholder => "Card Number", :data => {:stripe => 'number' }, :tabindex => 1, :autofocus => true, :class => "form-control"
    end
      field.html_safe
  end

  def card_code_field
    if Rails.env.development?
      field = text_field_tag :card_code, nil,:class => "valid payment-form" , name: nil, :placeholder => "3 or 4 digits", :data => {:stripe => 'cvc' }, :tabindex => 2, :class => "form-control", :value => "4242"
    else
      field = text_field_tag :card_code, nil,:class => "valid payment-form" , name: nil, :placeholder => "3 or 4 digits", :data => {:stripe => 'cvc' }, :tabindex => 2, :class => "form-control"
    end
      field.html_safe
  end
end
