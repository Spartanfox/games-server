class HighscoresController < ApplicationController
  before_action :set_highscore, only: %i[ show edit update destroy ]

  # GET /highscores or /highscores.json
  def index
    @highscores = Highscore.all
  end

  # GET /highscores/1 or /highscores/1.json
  def show
  end

  # GET /highscores/new
  def new
    @highscore = Highscore.new
  end

  # GET /highscores/1/edit
  def edit
  end

  # POST /highscores or /highscores.json
  def create
    @highscore = Highscore.new(highscore_params)

    respond_to do |format|
      if @highscore.save
        format.html { redirect_to highscore_url(@highscore), notice: "Highscore was successfully created." }
        format.json { render :show, status: :created, location: @highscore }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @highscore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /highscores/1 or /highscores/1.json
  def update
    respond_to do |format|
      if @highscore.update(highscore_params)
        format.html { redirect_to highscore_url(@highscore), notice: "Highscore was successfully updated." }
        format.json { render :show, status: :ok, location: @highscore }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @highscore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /highscores/1 or /highscores/1.json
  def destroy
    @highscore.destroy

    respond_to do |format|
      format.html { redirect_to highscores_url, notice: "Highscore was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_highscore
      @highscore = Highscore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def highscore_params
      params.require(:highscore).permit(:name, :time, :score, :level_id)
    end
end
