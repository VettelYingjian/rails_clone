class PetsController < ApplicationController
  before_action :set_pet, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @pets = Pet.paginate(page: params[:page], per_page: 5)
  end

  def new
    @pet = Pet.new
  end

  def edit
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      flash[:success] = "Pet was successfully created"
      redirect_to pet_path(@pet)
    else
      render 'new'
    end
  end

  def update
    if @pet.update(pet_params)
      flash[:success] = "Pet was successfully updated"
      redirect_to pet_path(@pet)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @pet.destroy
    flash[:danger] = "Pet was successfully deleted"
    redirect_to pets_path
  end

  private
    def set_pet
      @pet = Pet.find(params[:id])
    end

    def pet_params
      params.require(:pet).permit(:title, :description, category_ids: [])
    end

    def require_same_user
      if current_user != @pet.user and !current_user.admin?
        flash[:danger] = "You can only edit or delete your own pets"
        redirect_to root_path
      end
    end

end
