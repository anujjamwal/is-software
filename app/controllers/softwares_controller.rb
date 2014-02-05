class SoftwaresController < ApplicationController
  before_action :set_software, only: [:show, :edit, :update, :destroy, :allocate]

  def index
    @softwares = Software.search(params[:software_name],params[:software][:operating_system_id])
  end

  def show
  end

  def new
    @software = Software.new
  end

  def edit
  end

  def create
    @software = Software.new(software_params)
    @software.user = @current_user

    respond_to do |format|
      if @software.save
        format.html { redirect_to @software, notice: 'Software was successfully created.' }
        format.json { render action: 'show', status: :created, location: @software }
      else
        format.html { render action: 'new' }
        format.json { render json: @software.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @software.update(software_params)
        format.html { redirect_to @software, notice: 'Software was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @software.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @software.state = State.inactive
    respond_to do |format|
      format.html { redirect_to softwares_url }
      format.json { head :no_content }
    end
  end

  private
  def set_software
    @software = Software.find(params[:id])
  end

  def software_params
    params.require(:software).permit(:name, :path, :operating_system_id, :description, :freeware)
  end
end
