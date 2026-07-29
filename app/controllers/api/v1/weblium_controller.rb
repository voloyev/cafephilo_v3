# frozen_string_literal: true

class Api::V1::WebliumController < ApiController
  def webhook
    render json: { message: 'OK' }, status: :ok
  end
end
