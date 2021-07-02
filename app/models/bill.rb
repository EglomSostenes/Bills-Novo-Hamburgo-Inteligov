class Bill < ApplicationRecord
    require 'csv'
    include PgSearch::Model

    validates :abstract, :link, :name, presence: true

    def self.to_csv
        attributes = %w{name link status}
    
        CSV.generate(headers: true) do |csv|
            csv << attributes
    
            all.each do |bill|
                csv << attributes.map{ |attr| bill.send(attr) }
            end
        end
    end

    
    pg_search_scope :search_by_term, against: [:abstract],
    using: {
        tsearch: {
            any_word: true,
            prefix: true
        }
    }
end
