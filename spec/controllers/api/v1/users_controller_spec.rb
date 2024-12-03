RSpec.describe Api::V1::UsersController, type: :controller do
  let!(:user) { create(:user, supabase_id: '12345') }
  let(:valid_mail_params) { { user: { email: 'new_email@example.com' } } }
  let(:invalid_mail_params) { { user: { email: 'invalid_email' } } }

  describe 'PATCH /update_mails' do
    context 'ユーザーが存在する場合' do
      it 'メールアドレスが正常に更新される' do
        patch :update_mails, params: { id: user.supabase_id, user: { email: 'new_email@example.com' } }
        expect(response).to have_http_status(:ok)
        expect(response.body).to include('Email updated successfully')
      end

      it '無効なメールアドレスで更新しようとするとエラーが返る' do
        patch :update_mails, params: { id: user.supabase_id, user: { email: 'invalid_email' } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include('Emailis invalid') # ここで期待するエラーメッセージに合わせて修正
      end
    end

    context 'ユーザーが存在しない場合' do
      it 'ユーザーが見つからないエラーメッセージが返る' do
        patch :update_mails, params: { id: 'invalid_id', user: { email: 'new_email@example.com' } }
        expect(response).to have_http_status(:not_found)
        expect(response.body).to include('User not found')
      end
    end
  end
end
