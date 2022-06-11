# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthzsController, type: :controller do
  context 'when healthy' do
    describe 'when a request comes' do
      it 'should return a 200 status' do
        get :show
        expect(response).to have_http_status(:ok)
      end
    end
  end
end