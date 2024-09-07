class Api::V1::AnomaliesController < ApplicationController
  def index
    @user = User.find_by(email: params[:email])

    return unless @user
    anomalies = @user.anomalies

    render json: {
      anomalies: anomalies.as_json()
    }

    
  end

  def create
    Anomaly.find_by(abnormal_day: Date.current)

    start_of_day = Time.current.beginning_of_day
    end_of_day = Time.current.end_of_day

    isAnomaly = Anomaly.where(abnormal_day: start_of_day..end_of_day).first
    return  if isAnomaly

    @user = User.find_by(email: params[:email])
    anomary = Anomaly.new(anomalies_params)
    if anomary.save
      render json: {},status: :ok
    end
  end

  private

  def anomalies_params
    params.require(:anomalies).permit(:max, :min,:abnormal_day).merge(user_id: @user.id,anomaly_type: "heart_rate")

  end
end
