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

    // referral code validation!
  $( "#referral_code" ).focusout(function() {
    var pathArray = window.location.pathname.split( '/' );
    var event_id = pathArray[1];
    var url = "/validate_referral_code/" + $(this).val() + "/" + event_id
    $.ajax({
      url: url
    }).done(function( response ) {
      if (response == true) {
        $("#referral_code").css({ "border-left": "2px solid green"})
        $("#referral_code").css({ "border-top": "2px solid green"})
        $("#referral_code").css({ "border-right": "2px solid green"})
        $("#referral_code").css({ "border-bottom": "2px solid green"})
      }
      else {
        $("#referral_code").css({ "border-left": "2px solid red"})
        $("#referral_code").css({ "border-top": "2px solid red"})
        $("#referral_code").css({ "border-right": "2px solid red"})
        $("#referral_code").css({ "border-bottom": "2px solid red"})
      }
    });
  })  

  var validator = $("#order_form").validate({
    errorPlacement: function(error, element) {
    element.parent("div").append(error);
  },
    highlight: function(element, errorClass) {
      $(element).removeClass("success").addClass("validation_error");
    },
    unhighlight: function(element, errorClass) {
      $(element).removeClass("validation_error").addClass("success");
    },
    onfocusout: function(element) {
      $(element).valid(); 
    },
    onkeyup: false,
    rules: {
            "participant[email]": {
              // remote: "/check_email_uniqueness",
              required: true
            },
            "participant[first_name]": "required"
           },
    messages: {
      "participant[email]": {
        // remote: "Email already taken! Please try a different email or login above!",
        required: "Please enter your email!"
      },
      "participant[first_name]": "We gotta know who you are! Please enter your name."
    }
  });

  $('#order_form').submit(function(e) {

      var $form = $(this);

      // Disable the submit button to prevent repeated clicks
      $form.find('button').prop('disabled', true);

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

       var isvalidate=$("#order_form").valid();
        if(!isvalidate)
        {
          e.preventDefault();
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