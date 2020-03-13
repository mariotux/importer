require 'rails_helper'

describe CountryService do
  let(:subject) { described_class.new }

  describe "#create!" do
    let(:row) { { "Country" => "ABS" } }

    before do
      allow(Country).to receive(:create!).with(any_args)
    end

    after do
      subject.create!(row)
    end

    context "when country name does not exist" do
      before do
        allow(Country).to receive(:find_by).with(any_args).and_return(nil)
      end

      it 'create a country' do
        expect(Country).to receive(:create!).once
      end
    end

    context "when country name exist" do
      before do
        allow(Country).to receive(:find_by).with(any_args).and_return(build(:country))
      end
      it 'not create a country' do
        expect(Country).to receive(:create!).exactly(0).time
      end
    end
  end
end