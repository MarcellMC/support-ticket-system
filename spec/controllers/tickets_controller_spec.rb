require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/tickets').to route_to('tickets#index')
    end

    it 'routes to #show' do
      expect(get: '/tickets/1').to route_to('tickets#show', id: '1')
    end

    it 'routes to #new' do
      expect(get: '/tickets/new').to route_to('tickets#new')
    end

    it 'routes to #edit' do
      expect(get: '/tickets/1/edit').to route_to('tickets#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/tickets').to route_to('tickets#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/tickets/1').to route_to('tickets#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/tickets/1').to route_to('tickets#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/tickets/1').to route_to('tickets#destroy', id: '1')
    end

    it 'routes to #manage' do
      expect(get: '/tickets/manage').to route_to('tickets#manage')
    end
  end
end
