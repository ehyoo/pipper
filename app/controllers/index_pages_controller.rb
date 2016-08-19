class IndexPagesController < ApplicationController
  def index
    if current_user
      @pip = Pip.new
      render :home_pip_feed
    else
      tounge_in_cheek_description_array = ['A totally original social network.',
                                          'Not a ripoff of twitter.',
                                          'Waddup.',
                                          "It's just a learning experience bro.",
                                          "\"Absolutely brilliant\" -main_user",
                                          "Best thing since sliced bread."]
      @description = tounge_in_cheek_description_array.sample
      render :face
    end
  end
end
