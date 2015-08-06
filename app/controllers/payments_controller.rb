class PaymentsController < ApplicationController

  def create
    value = params[:value].to_i * 100
    token = params[:token]

    charge = Stripe::Charge.create(
      amount: value,
      currency: "gbp",
      source: token,
      description: "payment from PMWYW"
    )

    payment = Payment.create(
      stripe_charge_id: charge.id,
      value: value,
      stripe_token: token

    )

    render text: "ok"
  end
end
