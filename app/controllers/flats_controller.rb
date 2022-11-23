class FlatsController < ApplicationController
  before_action :set_flat, only: %i[ show edit update destroy chef ]

  # def top
  #   @flats = flat.where(rating: 5)
  # end

  # def chef
  #   @chef_name = @flat.chef_name
  # end

  # # GET /flats
  def index
    @flats = Flat.all
  end


  def show
  end


  def new
    @flat = Flat.new
  end

  def edit
  end


  def create
    @flat = Flat.new(flat_params)

    if @flat.save
      redirect_to @flat, notice: "flat was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


  def update
    if @flat.update(flat_params)
      redirect_to @flat, notice: "flat was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_url, notice: "flat was successfully destroyed."
  end

  private

    def set_flat
      @flat = Flat.find(params[:id])
    end

    def flat_params
      params.require(:flat).permit(:name, :address, :description, :number_of_guests, :price_per_night)
    end
end
