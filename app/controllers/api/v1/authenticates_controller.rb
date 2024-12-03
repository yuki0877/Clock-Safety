module Api
  module V1
    class AuthenticatesController < ApplicationController
      def show
        user = User.find_by(supabase_id: params[:id])

        render json: {
          user: user.as_json(
            only: %i[access_token email name]
          )
        }
      end
    end
  end
end
