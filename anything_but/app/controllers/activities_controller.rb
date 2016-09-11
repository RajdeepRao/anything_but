class ActivitiesController < ApplicationController

  def index
    @activities = Activity.search(params[:term])
    render json: @activities.map(&:name).uniq
  end
end
