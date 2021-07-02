class BillsExtractWorker
    include Sidekiq::Worker
  
    def perform()
      ScrapingService.scrap_bills_novo_hamburgo
    end
end
  