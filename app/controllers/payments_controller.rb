class PaymentsController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def index
    payments =  []
    Payment.order("created_at DESC").where("created_at >= ?", 14.days.ago).each do |payment|
      payments << [payment.id,
      payment.created_at.beginning_of_day.to_i*1000,
      number_to_currency(payment.value/100, unit: "£")]
    end

    render json: payments
  end

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
