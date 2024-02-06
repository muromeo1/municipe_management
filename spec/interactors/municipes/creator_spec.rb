require 'rails_helper'

RSpec.describe Municipes::Creator, type: :interactor do
  describe '.call' do
    subject(:interactor) { described_class.call(params) }

    let(:municipe) { create(:municipe) }
    let(:params) { {} }

    context 'when has correct params' do
      let(:params) do
        {
          full_name: 'Hobert Bergnaum',
          cpf: '74788787091',
          cns: '192861210770009',
          email: 'bergnaum_hobert@kunze.example',
          birthdate: '1971-11-26',
          phone: '+682 1-373-077-8510',
          active: true
        }
      end

      it { expect(interactor).to be_a_success }
      it { expect(interactor.municipe).to be_present }
    end

    context 'when has missing params' do
      let(:params) do
        {
          full_name: 'Jorge Aragão',
          cpf: nil
        }
      end

      it { expect(interactor).to be_a_failure }
      it { expect(interactor.error).to eq("cpf can't be nil") }
    end

    context 'when field is wrong' do
      let(:params) { build(:municipe).as_json.except('id', 'created_at', 'updated_at') }

      before { params[:cpf] = '44444' }

      it { expect(interactor).to be_a_failure }
      it { expect(interactor.error).to match('Cpf invalid') }
    end
  end
end
