class Api::V1::BarangaysController < ApplicationController

  def index
    city = Address::City.find_by_id(params[:city_id])
    barangays = if city
                  city.barangays
                else
                  Address::Barangay.all
                end
    render json: barangays, each_serializer: Api::V1::BarangaysController
  end

  def show
    barangay = Address::Barangay.find(params[:id])
    render json: barangay, serializer: Api::V1::BarangaysController
  end
end
