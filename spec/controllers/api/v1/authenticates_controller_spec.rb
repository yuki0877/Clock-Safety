require 'rails_helper'

RSpec.describe Api::V1::AuthenticatesController, type: :request do
  let!(:user) do
    create(:user, supabase_id: 'supabase_id_123', access_token: 'access_token_123', email: 'test@example.com',
                  name: 'Test User')
  end
  let(:headers) { { "Content-Type": 'application/json' } }

  describe 'GET /api/v1/authenticates' do
    context 'ユーザーが存在する場合' do
      it 'ユーザー情報を返す' do
        get '/api/v1/authenticates', params: { id: user.supabase_id }, headers: headers

        expect(response).to have_http_status(:success)
        expect(response.body).to include(user.email)
      end
    end
  end
end
