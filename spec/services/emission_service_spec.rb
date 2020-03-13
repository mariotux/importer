require 'rails_helper'

describe EmissionService do
  let(:subject) { described_class.new }

  describe "#create!" do
    let(:emissions) { { "1900" => "0.0003", "1901" => "0.3003" } }
    let(:country) { build(:country) }
    let(:sector) { build(:sector) }

    before do
      allow(Emission).to receive(:create!).with(any_args)
    end

    after do
      subject.create!(emissions, country, sector)
    end

    context "when we have emissions to create" do
      it { expect(Emission).to receive(:create!).exactly(2).time }
    end
  end
end