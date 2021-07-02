require 'rails_helper'

RSpec.describe BillsController, type: :controller do
    let(:bills) { create_list(:bill, 10) }

    it '#GET - should return success' do
        get :index
        assert_response :success
        expect(assigns(:bills)).to match_array(bills)
    end

    it '#SHOW - should return success' do
        bill = create :bill
        get :show, params: { id: bill.id }
  
        assert_response :success
        expect(assigns(:bill)).to eq(bill)
    end
end