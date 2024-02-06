require 'rails_helper'

RSpec.describe Address do
  subject(:model) { described_class.new }

  let(:errors) { model.errors.messages }

  describe 'presence validation' do
    before { model.valid? }

    it { expect(errors[:cep].first).to eq("can't be blank") }
    it { expect(errors[:street].first).to eq("can't be blank") }
    it { expect(errors[:complement].first).to eq(nil) }
    it { expect(errors[:neighborhood].first).to eq("can't be blank") }
    it { expect(errors[:city].first).to eq("can't be blank") }
    it { expect(errors[:state].first).to eq("can't be blank") }
    it { expect(errors[:ibge_code].first).to eq(nil) }
  end
end
