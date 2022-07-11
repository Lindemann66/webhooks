# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  let(:password) { '12345689' }
  let(:invalid_password) { 'invalid_password' }
  let!(:user) { create :user, password: password }

  describe 'GET #authenticate' do
    context 'when credentials correct' do
      let(:expected_response) do
        {
          auth_token: JsonWebToken.encode({ user_id: user.id }),
          user: { id: user.id, email: user.email }
        }
      end

      it 'authenticates successfully' do
        post :authenticate_user, params: { email: user.email, password: password }

        expect(response).to be_ok
        expect(json_response).to eq(expected_response)
      end
    end

    context 'when credentials incorrect' do
      it 'authenticates unsuccessfully' do
        post :authenticate_user, params: { email: user.email, password: invalid_password }

        expect(response.code).to eq('401')
        expect(json_response).to eq(error: 'Unsuccessful auth')
      end
    end
  end
end
