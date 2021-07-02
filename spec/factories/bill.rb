FactoryBot.define do
    factory :bill do
        name {FFaker::Lorem.word}
        abstract {FFaker::Lorem.word}
        link {FFaker::Internet.http_url}
    end
end