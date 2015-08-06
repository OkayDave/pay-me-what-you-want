
$(document).ready ->
  $("#card-form").submit (e) ->
    e.preventDefault()
    $("p.payment-errors").addClass("hidden")
    pubKey = $("#card-form").data("stripekey")
    $form = $("#card-form")

    $form.find("button").prop("disabled", true)
    
    Stripe.setPublishableKey(pubKey)
    Stripe.card.createToken($form, window.stripeResponse)

    return false

  
  
  window.stripeResponse = (status, response) ->
    $form = $("#card-form")

    if response.error
      console.log("error")
      console.log(response)
      $('p.payment-errors').removeClass("hidden")
      $('p.payment-errors').text(response.error.message)
      $form.find('button').prop('disabled', false)
    else
      console.log("no error")
      console.log(response)
      token = response.id
      $form.append($('<input type="hidden" name="stripeToken" />').val(token))

      # $form.get(0).submit();
      console.log("lol")

      value = $("#card-value").val()

      $.post("/payments", {token: token, value: value})

      $form.find("button").prop("disabled", false)
