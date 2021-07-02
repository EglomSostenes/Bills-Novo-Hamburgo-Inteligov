json.array! @bills do |bill|
    json.id bill.id
    json.name bill.name
    json.abstract bill.abstract
    json.status bill.status
    json.link bill.link
end