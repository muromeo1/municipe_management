require 'rails_helper'

RSpec.describe Addresses::Creator, type: :interactor do
  describe '.call' do
    subject(:interactor) { described_class.call(params) }

    let(:municipe) { create(:municipe) }
    let(:params) { {} }

    context 'when has correct params' do
      let(:params) do
        {
          cep: '39265',
          street: '917 Powlowski Underpass',
          complement: nil,
          neighborhood: 'Patriarca',
          city: 'West Tyfurt',
          state: 'Maryland',
          municipe:
        }
      end

      it { expect(interactor).to be_a_success }
      it { expect(interactor.address).to be_present }
    end

    context 'when has missing params' do
      let(:params) do
        {
          street: 'Rua Cairos',
          cep: nil
        }
      end

      it { expect(interactor).to be_a_failure }
      it { expect(interactor.error).to eq("cep can't be nil") }
    end
  end
end
