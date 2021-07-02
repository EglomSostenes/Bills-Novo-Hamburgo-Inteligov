class ScrapingService
  def self.scrap_bills_novo_hamburgo
    new.extract_and_persist_bills
  end

  def extract_and_persist_bills
    list_bills.entries.each { |bill| find_or_create(bill) }
  end

  private

  def list_bills
    @list_bills ||= BillsNovoHamburgoScrapper.extract_bills
  end

  def find_or_create(bill)
    Bill.where(name: bill[:name]).first_or_create(bill)
  end
end
