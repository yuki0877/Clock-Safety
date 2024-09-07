class Api::V1::UsersController < ApplicationController
    def index
    end

    def create
    user = User.find_or_initialize_by(email: params[:email])
      if user.new_record? 
        user.name = params[:user_metadata][:full_name]
        user.save!
      end
      render json: {},status: :created
    end

    def show
    end

    def update
        user = User.find_by(email: params[:email])
        
        @expires_in = user.calculate_expires_in(params[:token_body][:expires_in])
        if user.update(update_params)
        
          render json: {},status: :ok
        end
    end

    private

    def update_params
        params.require(:token_body).permit(:access_token,:refresh_token).merge(expires_in: @expires_in)
    end
  end
  