class WelcomeController < ApplicationController
  def index
    @sales = Sale.new
  end
end
