class Api::V1::UsersController < ApplicationController
  def index
  end

  def create
    user = User.find_or_initialize_by(email: params[:email])
    if user.new_record? 
      user.name = params[:user_metadata][:full_name]
      user.supabase_id = params[:id]
      user.save!
    end
    render json: {}, status: :created
  end

  def show
  end

  def update
    user = User.find_by(supabase_id: params[:user][:id])
    
    @expires_in = user&.calculate_expires_in(params[:token_body][:expires_in])
    user.update(update_params)
    render json: {}, status: :ok
  end

  def update_mails
    user = User.find_by(supabase_id: params[:id])
    if user.nil?
      render json: { error: 'User not found' }, status: :not_found and return
    end
    # メールアドレスの保存に成功した場合
    if user.update(mail_params)
      render json: { message: 'Email updated successfully' }, status: :ok
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def guest_params
    params.require(:user).permit(:email) 
  end

  def mail_params
    params.require(:user).permit(:email) 
  end
  
  def update_params
    params.require(:token_body).permit(:access_token, :refresh_token).merge(expires_in: @expires_in)
  end
end
