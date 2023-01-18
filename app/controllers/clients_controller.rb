class ClientsController < ApplicationController

    def index 
        render json: Client.all, status: :ok
    end 

    def show 
        client = Client.find_by(id: params[:id])
        if client.present?
            memberships = client.memberships
            total_amt = memberships.sum(:charge)
            render json: { client: client, total_amt: total_amt }
        else 
            render_not_found_response
        end
    end


    def render_not_found_response
        render json: { error: "client not found" }, status: :not_found
    end

      
end
