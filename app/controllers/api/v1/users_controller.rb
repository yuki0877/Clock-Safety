class Api::V1::UsersController < ApplicationController
  def index
  end

  def create
    user = User.find_or_initialize_by(email: params[:email])
    if user.new_record? 
      user.name = params[:user_metadata][:full_name]
      user_spabase_id = params[:spabase_id]
      user.save!
    end
    render json: {}, status: :created
  end

  def show
  end

  def update
    user = User.find_by(email: params[:email])
    
    @expires_in = user.calculate_expires_in(params[:token_body][:expires_in])
    if user.update(update_params)
      render json: {}, status: :ok
    end
  end

  def update_mails
    user = User.find_by(email: params[:current_user_email])
    
    
    
    # ユーザーが見つからない場合はエラーメッセージを返す
    if user.nil?
      render json: { error: 'User not found' }, status: :not_found and return
    end

    # フロントエンドから送信されたメール情報を取得
    user_mail_data = params[:user_mail]

    # メールアドレスをユーザーに保存する
    user.update(email: user_mail_data[:email]) # 新しいメールアドレスを保存する場合

    # メールアドレスの保存に成功した場合
    if user.update(mail_params)
      render json: { message: 'Email updated successfully' }, status: :ok
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def mail_params
    params.require(:user).permit(:email)  # メールアドレスを受け取るためのストロングパラメータ
  end
  
  def update_params
    params.require(:token_body).permit(:access_token, :refresh_token).merge(expires_in: @expires_in)
  end
end
