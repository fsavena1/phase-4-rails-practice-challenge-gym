class GymsController < ApplicationController

    def index 
        render json: Gym.all 
    end 

    def show 
        gym = Gym.find_by(id: params[:id])
        if gym.present?
            render json: gym , status: :ok
        else 
            render_not_found_response
        end
    end
    

    def destroy 
        gym = Gym.find_by(id: params[:id])
        if gym.present?
            gym.destroy
            head :no_content
        else 
            render_not_found_response
        end
    end 





    def render_not_found_response
        render json: { error: "gym not found" }, status: :not_found
    end

end
