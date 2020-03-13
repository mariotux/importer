require 'rails_helper'

describe RowService do
  let(:emissions_service) { double('emission', create!: nil) }
  let(:sector_service) { double('sector', create!: build(:sector)) }
  let(:country_service) { double('country', create!: build(:country)) }
  let(:subject) { described_class.new(emissions_service, sector_service, country_service) }

  describe "#create!" do
    let(:row) { { "Sector" => "sector", "Parent sector" => "parent sector", "Country" => "country", "1900" => "0.003", "1901" => "0.034" } }

    after do
      subject.emissions_per_row(row)
    end

    context "when create emissions per each row" do
      it { expect(sector_service).to receive(:create!).once }
      it { expect(country_service).to receive(:create!).once }
      it { expect(emissions_service).to receive(:create!).once }
    end
  end
end
