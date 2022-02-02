# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Companies::Api do

  describe '#search' do
    let(:api_instance) { described_class.new }
    let(:connection) { double(:connection) }
    let(:search_params) { { q: 'search-term' } }
    let(:search_response) { double(:search_response, body: response_body) }

    subject { api_instance.search(search_params) }

    before do
      allow(connection).to receive(:get).and_return(search_response)
      allow(api_instance).to receive(:connection).and_return(connection)
    end

    context 'with existing items' do
      let(:response_body) { { 'items' => [1, 2, 3] } }

      it 'returns items' do
        expect(connection).to receive(:get).with('/search/companies', search_params)
        expect(subject).to eq([1, 2, 3])
      end
    end

    context 'with empty items' do
      let(:response_body) { { 'items' => [] } }

      it 'returns empty list' do
        expect(connection).to receive(:get).with('/search/companies', search_params)
        expect(subject).to eq([])
      end
    end

    context 'without items' do
      let(:response_body) { { 'error' => 'Unauthorized' } }

      it 'returns nil' do
        expect(connection).to receive(:get).with('/search/companies', search_params)
        expect(subject).to eq(nil)
      end
    end
  end
end
