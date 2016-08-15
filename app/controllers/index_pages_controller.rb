class IndexPagesController < ApplicationController
  def index
    if current_user
      render :home_pip_feed
    else
      tounge_in_cheek_description_array = ['A totally original social network.',
                                          'Not a ripoff of twitter.',
                                          'Waddup.',
                                          "It's just a learning experience bro.",
                                          "\"Absolutely brilliant\" -main_user"]
      @description = tounge_in_cheek_description_array.sample
      render :face
    end
  end
end
