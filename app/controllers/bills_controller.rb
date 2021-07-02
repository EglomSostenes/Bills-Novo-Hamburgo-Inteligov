class BillsController < ApplicationController
    def index
        @q = Bill.ransack(params[:q])
        @bills = @q.result
        @bills = @bills.paginate(page: params[:page], per_page: 10) unless request.format == 'csv'
        respond_to do |format|
            format.html 
            format.csv { send_data @bills.to_csv, filename: "bills-#{Date.today}.csv", encoding: "ISO8859-1" }
        end
    end

    def show
        @bill = Bill.find(params[:id])
    end
end
