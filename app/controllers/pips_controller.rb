class PipsController < ApplicationController
  before_action :set_pip, only: [:show]

  # GET /pips/1
  # GET /pips/1.json
  def show
  end

  # POST /users
  # POST /users.json
  def create
    @pip = Pip.new(pip_params)
    @pip.user = current_user
    respond_to do |format|
      if @pip.save
        format.html { redirect_to :back, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @pip }
      else
        format.html { redirect_to :back, notice: "Something went wrong" }
        format.json { render json: @pip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @pip = Pip.find(params[:id])
    @pip.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Pip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pip
      @pip = Pip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pip_params
      params.require(:pip).permit(:body)
    end
end
