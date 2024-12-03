RSpec.describe 'Authenticates API', type: :request do
  let(:user) { create(:user) }

  describe 'GET /api/v1/authenticates' do
    context 'when user exists' do
      it 'returns the user information' do
        get api_v1_authenticates_path(id: user.supabase_id)

        expect(response).to have_http_status(:ok)
        expect(json_response['user']['email']).to eq(user.email)
        expect(json_response['user']['name']).to eq(user.name)
        expect(json_response['user']['access_token']).to eq(user.access_token)
      end
    end

    context 'when user does not exist' do
      it 'returns an empty user object with 200 status' do
        get api_v1_authenticates_path(id: 'invalid_id')

        expect(response).to have_http_status(:ok)
        expect(json_response['user']).to be_nil
      end
    end
  end
end
