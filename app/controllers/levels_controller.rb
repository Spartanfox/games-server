class LevelsController < ApplicationController
  before_action :set_game_level, only: %i[    ]
  before_action :set_level, only: %i[ update show edit destroy ]
  
  # GET /levels or /levels.json
  def index
    @levels = Level.all
    
  end

  # GET /levels/1 or /levels/1.json
  def show
    @game = @level.game

  end

  # GET /levels/new
  def new
    if((params[:game_id]).to_i.to_s == params[:game_id])
      @game = Game.find_by_id(params[:game_id])
    else
      @game = Game.find_by_name(params[:game_id])
    end
    @level = @game.levels.build
  end

  # GET /levels/1/edit
  def edit
  end

  # POST /levels or /levels.json
  def create
    @game = Game.find_by_id(params[:game_id])
    @level = @game.levels.new(level_params)
    print("fhek")
    respond_to do |format|
      if @level.save
        format.html { redirect_to @level.game, notice: "Level was successfully created." }
        format.json { render :show, status: :created, location: @level }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /levels/1 or /levels/1.json
  def update
    respond_to do |format|
      if @level.update(level_params)
        format.html { redirect_to level_url(@level), notice: "Level was successfully updated." }
        format.json { render :show, status: :ok, location: @level }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /levels/1 or /levels/1.json
  def destroy
    
    @level.destroy

    respond_to do |format|
      format.html { redirect_to @game, notice: "Level was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level
      # first try finding level by id
      if(params[:id])
        if((params[:id]).to_i.to_s == params[:id])
          @level = Level.find(params[:id])         #if id is an integer
        else
          @level = Level.find_by_name(params[:id]) #if id is a name
        end
      else #else try finding level by level id
        if((params[:level_id]).to_i.to_s == params[:level_id])
          @level = Level.find(params[:level_id])         #if level id is integer
        else
          @level = Level.find_by_name(params[:level_id]) # if level id is name
        end
      end
      @game = @level.game
    end

    def set_game_level
      if((params[:level_id]).to_i.to_s == params[:level_id])
        @level = Level.find(params[:level_id])
      else
        @game = Game.find_by_name(params[:game_id])
        @level = @game.levels.find_by_name(params[:level_id])
      end
    end

    # Only allow a list of trusted parameters through.
    def level_params
      params.require(:level).permit(:name, :gamemode, :image_url, :game_id)
    end
end
