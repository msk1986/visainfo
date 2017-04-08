class CountriesController < ApplicationController

	before_action :set_variables

	def show
    @country_id = params[:id]
    @countries = Country.where(id: @country_id)
  end

	def search
		@area = Area.select(:area_name).where(id:@id)
    @countries = ""
    # URLの末尾が数字(area_id)
    if params[:id] =~ /^[0-9]+$/
      # :visa_information　→ :visa_informations　に変更
		  @countries = Country.where(area_id: params[:id]).order(country_name: :asc).includes(:visa_informations)
    # URLの末尾が数字以外(アルファベットを想定)
    else
      @countries = Country.where('country_name like ?', params[:id]+'%').order(:country_name)
    end
	end

	private

  def set_variables
    @id = params[:id]
	  @area_form = Area.all
	  @visa_form = Visa.all
	  @area_num = Area.all.count
  end
end
