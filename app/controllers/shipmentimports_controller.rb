class ShipmentimportsController < ApplicationController
  before_action :set_shipmentimport, only: [:show, :edit, :update, :destroy]

  # GET /shipmentimports
  # GET /shipmentimports.json
  def index
    @shipmentimports = Shipmentimport.all
  end

  # GET /shipmentimports/1
  # GET /shipmentimports/1.json
  def show
  end

  # GET /shipmentimports/new
  def new
    @shipmentimport = Shipmentimport.new
  end

  # GET /shipmentimports/1/edit
  def edit
  end

  # POST /shipmentimports
  # POST /shipmentimports.json
  def create
    @shipmentimport = Shipmentimport.new(shipmentimport_params)

    @shipmentimport.user_id = current_user.id
    jsonfile = File.read(params[:shipmentimport][:jsonfile])
    jsontohash = JSON.parse(jsonfile)
    @shipmentimport.shipments = jsontohash.length


    respond_to do |format|
      if @shipmentimport.save

        jsontohash.each do |shipment|
          carrier = Carrier.where('lower(name) = ?', shipment['carrier'].downcase).first


          shipment.delete('carrier')
          shipment['carrier_id'] = carrier.id
          shipment['user_id'] = current_user.id
          shipment['parcel_attributes'] = shipment['parcel']
          shipment.delete('parcel')

          Shipment.create(shipment)
        end

        format.html { redirect_to @shipmentimport, notice: 'Shipmentimport was successfully created.' }
        format.json { render :show, status: :created, location: @shipmentimport }
      else
        format.html { render :new }
        format.json { render json: @shipmentimport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipmentimports/1
  # PATCH/PUT /shipmentimports/1.json
  def update
    respond_to do |format|
      if @shipmentimport.update(shipmentimport_params)
        format.html { redirect_to @shipmentimport, notice: 'Shipmentimport was successfully updated.' }
        format.json { render :show, status: :ok, location: @shipmentimport }
      else
        format.html { render :edit }
        format.json { render json: @shipmentimport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipmentimports/1
  # DELETE /shipmentimports/1.json
  def destroy
    @shipmentimport.destroy
    respond_to do |format|
      format.html { redirect_to shipmentimports_url, notice: 'Shipmentimport was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipmentimport
      @shipmentimport = Shipmentimport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipmentimport_params
      params.require(:shipmentimport).permit(:shipments, :user_id, :jsonfile)
    end
end
