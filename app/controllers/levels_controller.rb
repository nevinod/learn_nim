class LevelsController < ApplicationController
  before_action :set_level, only: %i[ show edit update destroy ]

  def index
    @levels = Level.all
  end

  def show
  end

  def new
    @level = Level.new
  end

  def create
    @level = Level.new(level_params)
    if @level.save
      @levels = Level.all
      redirect_to levels_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @level.update(level_params)
      redirect_to levels_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @level.destroy
    redirect_to levels_path
  end

  private
    def level_params
      params.expect(level: [:name, :score])
    end

    def set_level
      @level = Level.find(params[:id])
    end
end
