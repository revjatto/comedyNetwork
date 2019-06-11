class ComediesController < ApplicationController
  before_action :set_comedy, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [ :index, :show ]

  # GET /comedies
  # GET /comedies.json
  def index
    @comedies = Comedy.all.order("created_at DESC")
  end

  # GET /comedies/1
  # GET /comedies/1.json
  def show
  end

  # GET /comedies/new
  def new
    @comedy = Comedy.new
  end

  # GET /comedies/1/edit
  def edit
  end

  # POST /comedies
  # POST /comedies.json
  def create
    @comedy = Comedy.new(comedy_params)

    respond_to do |format|
      if @comedy.save
        format.html { redirect_to @comedy, notice: 'Comedy was successfully created.' }
        format.json { render :show, status: :created, location: @comedy }
      else
        format.html { render :new }
        format.json { render json: @comedy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comedies/1
  # PATCH/PUT /comedies/1.json
  def update
    respond_to do |format|
      if @comedy.update(comedy_params)
        format.html { redirect_to @comedy, notice: 'Comedy was successfully updated.' }
        format.json { render :show, status: :ok, location: @comedy }
      else
        format.html { render :edit }
        format.json { render json: @comedy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comedies/1
  # DELETE /comedies/1.json
  def destroy
    @comedy.destroy
    respond_to do |format|
      format.html { redirect_to comedies_url, notice: 'Comedy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comedy
      @comedy = Comedy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comedy_params
      params.require(:comedy).permit(:title, :body, :user_id)
    end
end
