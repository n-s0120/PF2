class FlowchartsController < ApplicationController
  def new
    @flowchart = Flowchart.new
  end

  def create
    @flowchart = Flowchart.new(flowchart_params)
    @flowchart.save
    redirect_to flowcharts_path
  end

  def index
    @flowcharts = Flowchart.all
  end

  def show
    @flowchart = Flowchart.find(params[:id])
  end

  def destroy
  end

  private
  def flowchart_params
    params.require(:flowchart).permit(:title, :genre, :introduction)
  end
end
