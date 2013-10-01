class GpsPointsController < ApplicationController
  before_action :set_gps_point, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:manual]
  # GET /gps_points
  # GET /gps_points.json
  def index
    @gps_points = GpsPoint.order('created_at desc').limit(100)
    #@gps_points = GpsPoint.find(:all, :order => "attending DESC")
  end

  # GET /gps_points/1
  # GET /gps_points/1.json
  def show
  end

  # GET /gps_points/new
  def new
    @gps_point = GpsPoint.new
  end

  # GET /gps_points/1/edit
  def edit
  end

  # POST /gps_points
  # POST /gps_points.json
  def create
    @gps_point = GpsPoint.new(gps_point_params)

    respond_to do |format|
      if @gps_point.save
        format.html { redirect_to @gps_point, notice: 'Gps point was successfully created.' }
        format.json { render action: 'show', status: :created, location: @gps_point }
      else
        format.html { render action: 'new' }
        format.json { render json: @gps_point.errors, status: :unprocessable_entity }
      end
    end
  end


  def manual
    latitude=params[:latitude]
    longitude=params[:longitude]
    accuracy = params[:accuracy]
    provider = params[:provider]
    timestamp= params[:timestamp]

    imei=params[:imei]

    pointnew = GpsPoint.new
    pointnew.latitude=latitude
    pointnew.longitude=longitude
    pointnew.accuracy=accuracy
    pointnew.provider=provider


    id_device=0
    b = Device.find_by_name(params[:imei])
    if b.present?
      id_device = b.id
    else
      a=Device.new
      a.name=params[:imei]
      if a.valid?
        a.save
      else
        render :json => 'KO'
        return false
      end
      a.save
      id_device = a.id

    end

    pointnew.device_id = id_device


    if pointnew.valid?
      pointnew.save
     render :json =>  pointnew
    else
      render :json => 'KO'
    end

  end
  # PATCH/PUT /gps_points/1
  # PATCH/PUT /gps_points/1.json
  def update
    respond_to do |format|
      if @gps_point.update(gps_point_params)
        format.html { redirect_to @gps_point, notice: 'Gps point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gps_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gps_points/1
  # DELETE /gps_points/1.json
  def destroy
    @gps_point.destroy
    respond_to do |format|
      format.html { redirect_to gps_points_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gps_point
      @gps_point = GpsPoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gps_point_params
      params.require(:gps_point).permit(:latitude, :longitude)
    end
end
