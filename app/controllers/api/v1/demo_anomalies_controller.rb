class Api::V1::DemoAnomaliesController < ApplicationController

    def index
      user = User.find_by(email: params[:email])

      render json: {
        demo_anomalies: user.demo_anomalies.as_json,
      }
        
    end
end