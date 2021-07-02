require 'rails_helper'

RSpec.describe BillsNovoHamburgoScrapper, type: :service do
  let(:instance) { described_class.new }

  before do
    allow(described_class).to receive(:new).and_return(instance)
  end

  describe '.extract_bills' do
    subject { described_class.extract_bills }

    before do
      allow(instance).to receive(:extract_with_pagination)
    end

    it 'creates an instance' do
      expect(described_class).to receive(:new)

      subject
    end

    it 'calls extract_with_pagination on instance' do
      expect(instance).to receive(:extract_with_pagination)

      subject
    end
  end

  describe '#extract_with_pagination' do
    subject { instance.extract_with_pagination }

    it 'get all records' do
      list_bills = subject
      count_entries = instance.count_entries
      expect(list_bills.entries.size).to eq(count_entries)
    end
  end

end