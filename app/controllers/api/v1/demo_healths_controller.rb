class Api::V1::DemoHealthsController < ApplicationController

    def index
        user = User.find_by(supabase_id: params[:id])

        render json: {
          demo_sleeps: user.demo_sleeps.as_json,
          demo_heat_rates: user.demo_heat_rates.as_json,
        }
    end
end