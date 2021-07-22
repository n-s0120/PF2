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
    @flowchart_1 = Flowchart.where(genre: "飲食業")
    @flowchart_2 = Flowchart.where(genre: "風営法")
    @flowchart_3 = Flowchart.where(genre: "建設業法")
    @flowchart_4 = Flowchart.where(genre: "入管法")
    @flowchart_5 = Flowchart.where(genre: "その他")
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
