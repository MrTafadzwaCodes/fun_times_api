# typed: false
# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(resource, _opts = {})
      render json: {
        message: 'Logged in successfully',
        user: resource,
        token: request.env['warden-jwt_auth.token']
      }, status: :ok
    end

    def respond_to_on_destroy
      if current_user
        current_user.update!(jti: SecureRandom.uuid)
        head :no_content
      else
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end

    def track_session(user, jti)
      UserSession.create!(
        user: user,
        jti: jti,
        expires_at: 1.hour.from_now
      )
    end
  end
end
