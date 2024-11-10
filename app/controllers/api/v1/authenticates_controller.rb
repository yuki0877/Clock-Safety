class Api::V1::AuthenticatesController < ApplicationController

    def show    
       user = User.find_by(supabase_id: params[:id])

       render json: {
        user: user.as_json(
            only: [:access_token, :email, :name]
        )
       }
    end
end
