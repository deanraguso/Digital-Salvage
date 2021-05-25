class PagesController < ApplicationController
  def index
  end
  def sample_sign_in
    sign_in(User.find(13))
    redirect_to root_path, notice: "You are now signed in!"
  end
end
