require 'rails_helper'

RSpec.describe ScrapingService, type: :service do
  let(:instance) { described_class.new }

  before do
    allow(described_class).to receive(:new).and_return(instance)
  end

  describe '.scrap_bills_novo_hamburgo' do

    subject { described_class.scrap_bills_novo_hamburgo }

    before do
      allow(BillsNovoHamburgoScrapper).to receive(:extract_bills).and_return(Array.new)
    end

    it 'creates an instance' do
      expect(described_class).to receive(:new)

      subject
    end

    it 'calls extract_and_persist_bills on instance' do
      expect(instance).to receive(:extract_and_persist_bills)

      subject
    end
  end

  describe '#extract_and_persist_bills' do
    let(:scrap_bills) { Array.new.tap { |b| b.push({name: "Eglom", abstract: "xxxx", link: "url"}) } }

    before do
      allow(instance).to receive(:list_bills).and_return(scrap_bills)
    end

    subject { instance.extract_and_persist_bills }

    context 'with entries' do
      it 'Save' do
        expect { subject }.to change { Bill.count }.by(1)
      end

      it 'iterate over extract_data and persist entries' do
        expect(instance).to receive(:find_or_create)

        subject
      end
    end

    context 'without entries' do
      let(:scrap_bills) { Array.new }

      it 'does not iterate' do
        expect(instance).to_not receive(:find_or_create)

        subject
      end
    end
  end
  
end