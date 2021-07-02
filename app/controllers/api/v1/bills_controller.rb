module Api::V1
    class BillsController < ApiController
        def index
            if params[:query]
                @bills = Bill.search_by_term(params[:query])
            else
                @bills = Bill.all
            end
        end
    end
end