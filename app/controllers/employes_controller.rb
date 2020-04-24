class EmployesController < ApplicationController
  before_action :set_employe, only: [:show, :edit, :update, :destroy]

  # GET /employes
  # GET /employes.json
  def index
    @employes = Employe.paginate(page: params[:page], per_page: 8)
    @allcity = City.all
  end


  def employe_city

@city_employe = Employe.where(city_id:params[:city_id]).count
respond_to do |format|
format.js {render 'employes/js/city_employe'}
  #format.js { redirect_to @employe, notice: 'Employe was successfully created.' }
end
  end  

  # GET /employes/1
  # GET /employes/1.json
  def show
    @employe = Employe.find(params[:id])
    @allcity = City.all
  end

  # GET /employes/new
  def new
    @employe = Employe.new
    @allcity = City.all
  end

  # GET /employes/1/edit
  def edit
@employe = Employe.find(params[:id])
@allcity = City.all

  end

  # POST /employes
  # POST /employes.json
  def create
    @employe = Employe.new(employe_params)
    @allcity = City.all
    respond_to do |format|
      if @employe.save
        format.html { redirect_to @employe, notice: 'Employe was successfully created.' }
        format.json { render :show, status: :created, location: @employe }
      else
        format.html { render :new }
        format.json { render json: @employe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employes/1
  # PATCH/PUT /employes/1.json
  def update

#@employe = Employe.find(params[:id])

  #  @employe.update(employe_params)

  #flash[:success] = "Employe '#{@employe.name}' Updated!"

  #redirect_to employe_path


    respond_to do |format|
      if @employe.update(employe_params)
        format.html { redirect_to @employe, notice: 'Employe was successfully updated.' }
        format.json { render :show, status: :ok, location: @employe }
      else
        format.html { render :edit }
        format.json { render json: @employe.errors, status: :unprocessable_entity }
      end
    end
  end

def managers

@allmanagers = Employe.distinct.pluck(:manager_id)
@manager22 = Employe.where(id: @allmanagers)
@manager = @manager22.paginate(page: params[:page], per_page: 2)

end

def relocation_requests

@relocate = Employe.where(willing_to_relocate: true)


end
  # DELETE /employes/1
  # DELETE /employes/1.json
  def destroy
    @employe.destroy
    respond_to do |format|
      format.html { redirect_to employes_url, notice: 'Employe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employe
      @employe = Employe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employe_params
     params.require(:employe).permit(:name,:city_id,:willing_to_relocate,:image)
    end
end
