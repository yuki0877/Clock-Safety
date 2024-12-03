module Api
  module V1
    class AnomaliesController < ApplicationController
      def index
        @user = User.find_by(supabase_id: params[:id])

        if @user
          anomalies = @user.anomalies
          render json: {
            anomalies: anomalies.as_json,
            current_user: @user.as_json
          }
        else
          render json: {}, status: :no_content # ユーザーが見つからなかった場合、空のレスポンスを返す
        end
      end

      def create
        # 異常データがすでに存在するか確認
        start_of_day = Time.current.beginning_of_day
        end_of_day = Time.current.end_of_day

        isAnomaly = Anomaly.where(abnormal_day: start_of_day..end_of_day).first
        return if isAnomaly

        # ユーザーを検索し、異常データを作成
        @user = User.find_by(email: params[:email])
        if @user
          anomaly = Anomaly.new(anomalies_params)
          if anomaly.save
            render json: {}, status: :ok
          else
            render json: { errors: anomaly.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { error: 'User not found' }, status: :not_found
        end
      end

      private

      def anomalies_params
        params.require(:anomalies).permit(:max, :min, :abnormal_day).merge(user_id: @user.id,
                                                                           anomaly_type: 'heart_rate')
      end
    end
  end
end
