class AreasController < ApplicationController

	before_action :set_variables

	def index
    @countries = Country.reply_countries(params)
	end

	def about
	end

	private

  def set_variables
	  @area_form = Area.all
	  @visa_form = Visa.all
	  @area_num = Area.all.count
  end
end