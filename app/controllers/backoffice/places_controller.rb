class Backoffice::PlacesController < BackofficeController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  #before_action :set_form_url, only: [:new, :edit]

  # GET /places
  def index
    @places = Place.all
  end

  # GET /places/1
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
    @resource_path = backoffice_places_path
  end

  # GET /places/1/edit
  def edit
    @resource_path = backoffice_place_path(@place)
  end

  # POST /places
  def create
    @place = Place.new(place_params)

    if @place.save
      redirect_to @place, notice: 'Place was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /places/1
  def update
    if @place.update(place_params)
      redirect_to @place, notice: 'Place was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /places/1
  def destroy
    @place.destroy
    redirect_to places_url, notice: 'Place was successfully destroyed.'
  end

  private
    def set_form_url
      if @place.try(:id).try(:nil?)
        @resource_path = backoffice_places_path
      else
        @resource_path = backoffice_place_path(@place)
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def place_params
      params.require(:place).permit(:description)
    end
end
