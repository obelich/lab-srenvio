class ShipmentsController < ApplicationController
  before_action :set_shipment, only: [:show, :edit, :update, :destroy]
  before_action :set_catalog, only: [:new, :edit, :update, :create]
  before_action :authenticate_user!
  # GET /shipments
  # GET /shipments.json
  def index
    @shipments = Shipment.order("created_at DESC").page(params[:page]).per(5)
  end

  # GET /shipments/1
  # GET /shipments/1.json
  def show
  end

  # GET /shipments/new
  def new
    @shipment = Shipment.new
    @shipment.build_parcel

  end

  # GET /shipments/1/edit
  def edit
    if !@shipment.parcel
      @shipment.build_parcel

    end
  end

  # POST /shipments
  # POST /shipments.json
  def create
    @shipment = current_user.shipments.build(shipment_params)
    respond_to do |format|
      if @shipment.save
        format.html { redirect_to @shipment, notice: 'Shipment was successfully created.' }
        format.json { render :show, status: :created, location: @shipment }
      else
        format.html { render :new }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  def gen_label
    fedex = Fedex::Shipment.new(:key => 'jfjwKS65xft8r8mh',
                                :password => 'QYrbniTyMafyj4LXm4tV7nsq5',
                                :account_number => '802388543',
                                :meter => '119147906',
                                :mode => 'development')


    shipper = { :name => "Sender",
                :company => "Company",
                :phone_number => "555-555-5555",
                :address => "Main Street",
                :city => "Harrison",
                :state => "AR",
                :postal_code => "72601",
                :country_code => "US" }

    recipient = { :name => "Recipient",
                  :company => "Company",
                  :phone_number => "555-555-5555",
                  :address => "Main Street",
                  :city => "Franklin Park",
                  :state => "IL",
                  :postal_code => "60131",
                  :country_code => "US",
                  :residential => "true" }

    packages = [{
                    :weight => {:units => "KG", :value =>1},
                    :dimensions => {:length =>20, :width =>20, :height =>10, :units =>"CM" }}]

    shipping_options = {
        :packaging_type => "YOUR_PACKAGING",
        :drop_off_type => "REGULAR_PICKUP"
    }

    rate = fedex.rate(:shipper=>shipper,
                      :recipient => recipient,
                      :packages => packages,
                      :service_type => "FEDEX_GROUND",
                      :shipping_options => shipping_options)


    raise rate.inspect

  end

  # PATCH/PUT /shipments/1
  # PATCH/PUT /shipments/1.json
  def update
    @carriers = Carrier.all

    respond_to do |format|
      if @shipment.update(shipment_params)
        format.html { redirect_to @shipment, notice: 'Shipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @shipment }
      else
        format.html { render :edit }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipments/1
  # DELETE /shipments/1.json
  def destroy
    @shipment.destroy
    respond_to do |format|
      format.html { redirect_to shipments_url, notice: 'Shipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment
      @shipment = Shipment.find(params[:id])
    end

    def set_catalog
      @carriers = Carrier.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipment_params
      params.require(:shipment).permit(:carrier_id, :tracking_number, :user_id,
       parcel_attributes: [:_destroy, :id, :shipment_id, :length, :width, :height, :weight, :distance_unit, :mass_unit]

      )
    end
end
