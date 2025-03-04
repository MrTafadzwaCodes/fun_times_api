# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(resource, _opts = {})
      token = request.env['warden-jwt_auth.token']
      render json: { token: token, user: resource }
    end

    def respond_to_on_destroy
      head :no_content
    end
  end
end
