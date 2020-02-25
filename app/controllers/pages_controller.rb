class PagesController < ApplicationController
  def home
    @test = user_signed_in?
  end
end
