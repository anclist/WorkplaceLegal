class EspanolController < ApplicationController
  def index
    @lead = Lead.new
  end
end
