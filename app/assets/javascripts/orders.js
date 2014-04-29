$(document).ready(function() { 
  // $("#join_team").select2();
    $("input[name='team']").change(function(){
      if ($("#team_Join_Team").is(':checked')) 
      {
        $('#s2id_join_team').show();
        $('#create_team').hide();
      }
      else if ($("#team_No_Team").is(':checked')) {
        $('#s2id_join_team').hide();
        $('#create_team').hide();
      }
      else {
        $('#s2id_join_team').hide();
        $('#create_team').show();
      }  
    });

  $('#order_form').submit(function(e) {
      var $form = $(this);

      // Disable the submit button to prevent repeated clicks
      $form.find('button').prop('disabled', true);

      // $('input').removeClass('invalid');
      // $('.validation').removeClass('passed failed');

      // var cardType = $.payment.cardType($('.cc-number').val());

      // $('.cc-number').toggleClass('invalid', !$.payment.validateCardNumber($('.cc-number').val()));
      // $('.cc-exp').toggleClass('invalid', !$.payment.validateCardExpiry($('.cc-exp').payment('cardExpiryVal')));
      // $('.cc-cvc').toggleClass('invalid', !$.payment.validateCardCVC($('.cc-cvc').val(), cardType));

      // if ( $('input.invalid').length ) {
      //   $('.validation').addClass('failed');
      // } else {
      //   $('.validation').addClass('passed');
      // }

      var ccvalid = $.payment.validateCardNumber($('#card_number').val());
      var CVCvalid = $.payment.validateCardCVC($('#card_code').val());

      if ( !ccvalid ) {
        alert('Your card number isn\'t right, try again!');
        return false;
      }

      if ( !CVCvalid ) {
        alert('Your CVC code isn\'t right, try again!');
        return false;
      }

      Stripe.createToken($form, stripeResponseHandler);

      // Prevent the form from submitting with the default action
      return false;
    });

  $(".payment-form").keyup(function() {
    $('#card_number').payment('restrictNumeric');
    $('#card_number').payment('formatCardNumber');
    $('#card_code').payment('restrictNumeric');
    $('#card_code').payment('formatCardCVC');
  });

});

   var stripeResponseHandler = function(status, response) {
      var $form = $('#order_form');
        if (response.error) {
        // Show the errors on the form
        $form.find('.payment-errors').text(response.error.message);
        $form.find('button').prop('disabled', false);
          } else {
        // token contains id, last4, and card type
        var token = response.id;
        // Insert the token into the form so it gets submitted to the server
        $form.append($('<input type="hidden" name="stripeToken" />').val(token));
        // and submit
        $form.get(0).submit();
      }
    };