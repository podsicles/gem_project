class Api::V1::RegionsController < ApplicationController

  def index
    regions = Address::Region.all
    render json: regions, each_serializer: Api::V1::RegionsController
  end

  def show
    region = Address::Region.find(params[:id])
    render json: region, serializer: Api::V1::RegionsController
  end
end