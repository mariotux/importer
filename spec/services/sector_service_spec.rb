require 'rails_helper'

describe SectorService do
  let(:subject) { described_class.new }

  describe "#create!" do
    let(:row) { { "Parent sector" => "ABS", "Sector" => "ASDF" } }

    after do
      subject.create!(row)
    end

    context 'when parent does not exist' do
      before do
        allow(Sector).to receive(:create!).with(any_args)
        allow(Sector).to receive(:find_by).with(any_args).and_return(nil, build(:sector))
      end

      it 'create a parent sector' do
        expect(Sector).to receive(:create!).once
      end
    end

    context 'when parent exist' do
      before do
        allow(Sector).to receive(:create!).with(any_args)
        allow(Sector).to receive(:find_by).with(any_args).and_return(build(:sector), build(:sector))
      end

      it 'not create a parent sector' do
        expect(Sector).to receive(:create!).exactly(0).time
      end
    end

    context 'when sector does not exist' do
      before do
        allow(Sector).to receive(:create!).with(any_args)
        allow(Sector).to receive(:find_by).with(any_args).and_return(build(:sector), nil)
      end

      it 'create a sector' do
        expect(Sector).to receive(:create!).once
      end
    end

    context 'when sector exist' do
      before do
        allow(Sector).to receive(:create!).with(any_args)
        allow(Sector).to receive(:find_by).with(any_args).and_return(build(:sector), build(:sector))
      end

      it 'not create a sector' do
        expect(Sector).to receive(:create!).exactly(0).time
      end
    end
  end
end
