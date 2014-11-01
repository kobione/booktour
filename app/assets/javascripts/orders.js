var payment;

jQuery(function() {
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
  return payment.setupForm();
});

payment = {
  setupForm: function() {
    return $('#new_order').submit(function() {
      $('input[type=submit]').attr('disabled', true);
      Stripe.card.createToken($('#new_order'), payment.handleStripeResponse);
      return false;
    });
  },
  handleStripeResponse: function(status, response) {
    if (status === 200) {
      $('#new_order').append($('<input type="hidden" name="stripeToken" />').val(response.id));
      return $('#new_order')[0].submit();
    } else {
      $('#stripe_error').text(response.error.message).show();
      return $('input[type=submit]').attr('disabled', false);
    }
  }
};