# authenticate user before there able to edit, create and add new
class PlacesController < ApplicationController
     before_action :authenticate_user!, only: [:new, :create, :edit]

	  def index
		@places = Place.paginate(:page => params[:page], :per_page => 5)
    end

    def new
      @place = Place.new
    end

    def create
    	current_user.places.create(place_params)
    	redirect_to root_path
    end

    def show
     @place = Place.find(params[:id])
    end
     
    #action to find edit places to edit
    def edit
     @place = Place.find(params[:id])
      if @place.user != current_user
         return render text: 'Not Allowed', status: :forbidden
      end
    end
     
     #action to update places
    def update
      @place = Place.find(params[:id])
      @place.update_attributes(place_params)
      redirect_to root_path
    end
     
     #delete places action
    def destroy
      @place = Place.find(params[:id])
      @place.destroy
      redirect_to root_path
    end




    private

    def place_params
    	params.require(:place) .permit(:name, :description, :address)
    end

end
