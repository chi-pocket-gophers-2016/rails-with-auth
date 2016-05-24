class BeltsController < ApplicationController
  include BeltsHelper
  before_action :check_logged_in, except: [:index, :show]
  before_action :set_belt, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def index
    @belts = Belt.all
  end

  def show
  end

  def new
    @belt = Belt.new
  end

  def edit
  end

  def create
    @belt = Belt.new(belt_params)

    if @belt.save
      current_user.belts << @belt

      redirect_to @belt, notice: 'Belt was successfully created.'
    else
      render :new
    end
  end

  def update
    if @belt.update(belt_params)
      redirect_to @belt, notice: 'Belt was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @belt.destroy
    redirect_to belts_url, notice: 'Belt was successfully destroyed.'
  end

  private
    def set_belt
      @belt = Belt.find(params[:id])
    end

    def check_owner
      redirect_to root_path unless owner?(@belt)
    end

    def belt_params
      params.require(:belt).permit(:name, :description)
    end
end
