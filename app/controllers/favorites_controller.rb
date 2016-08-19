class FavoritesController < ApplicationController
  # you can create or destroy a favorite.
  def create
    @favorite = Favorite.new(user: current_user, pip_id: params[:pip_id])
    if @favorite.save
      redirect_to root_url
    end
    # TODO: Add some kind of flashing.
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Pip successfully unfavorited.' }
      format.json { head :no_content }
    end
  end
end
