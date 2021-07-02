desc "Notifica por email sobre contratos proximos a expirar"
  
task :extract_bills_periodic => :environment do
    BillsExtractWorker.new.perform
end
