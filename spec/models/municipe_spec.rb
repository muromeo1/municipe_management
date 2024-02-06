require 'rails_helper'

RSpec.describe Municipe do
  subject(:model) { described_class.new }

  let(:errors) { model.errors.messages }

  describe 'presence validation' do
    before { model.valid? }

    it { expect(errors[:full_name].first).to eq("can't be blank") }
    it { expect(errors[:cpf].first).to eq("can't be blank") }
    it { expect(errors[:cns].first).to eq("can't be blank") }
    it { expect(errors[:email].first).to eq("can't be blank") }
    it { expect(errors[:birthdate].first).to eq("can't be blank") }
    it { expect(errors[:phone].first).to eq("can't be blank") }
    it { expect(errors[:photo].first).to eq("can't be blank") }
    it { expect(model.active).to be(true) }
  end

  describe 'cpf' do
    before do
      model.cpf = cpf
      model.valid?
    end

    context 'when cpf is valid' do
      let(:cpf) { '42373558025' }

      it { expect(errors[:cpf].first).to be_blank }
    end

    context 'when cpf is invalid' do
      let(:cpf) { '12373558025' }

      it { expect(errors[:cpf].first).to eq('invalid') }
    end
  end

  describe 'email' do
    before do
      model.email = email
      model.valid?
    end

    context 'when email is valid' do
      let(:email) { 'something@valid.com' }

      it { expect(errors[:email].first).to be_blank }
    end

    context 'when email is invalid' do
      let(:email) { '_2@.com' }

      it { expect(errors[:email].first).to eq('invalid') }
    end
  end

  describe 'cns' do
    before do
      model.cns = cns
      model.valid?
    end

    context 'when cns is valid' do
      let(:cns) { '183317497330000' }

      it { expect(errors[:cns].first).to be_blank }
    end

    context 'when cns is invalid' do
      let(:cns) { '183317497330001' }

      it { expect(errors[:cns].first).to eq('invalid') }
    end
  end

  describe 'birthdate' do
    before do
      model.birthdate = birthdate
      model.valid?
    end

    context 'when birthdate is valid' do
      let(:birthdate) { '23/09/1998' }

      it { expect(errors[:birthdate].first).to be_blank }
    end

    context 'when birthdate is invalid' do
      let(:birthdate) { '23/13/2999' }

      it { expect(errors[:birthdate].first).to eq('invalid') }
    end
  end
end
