require 'rails_helper'

RSpec.describe Api::V1::BillsController do
    describe "GET #index" do
        let!(:bills) { create_list(:bill, 3) }
        before do
            request.env["HTTP_ACCEPT"] = 'application/json'
            get :index
        end
    
        it "JSON response status OK" do
            expect(response).to have_http_status :ok
        end
     
        it "returns all the bills" do
            expect(bills.count).to eq(3)
        end
    end
end