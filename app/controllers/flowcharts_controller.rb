class FlowchartsController < ApplicationController
  def new
    @flowchart = Flowchart.new
  end

  def create
    @flowchart = current_admin.flowcharts.new(flowchart_params)
    @flowchart.save!
    redirect_to flowcharts_path
  end

  def index
    @flowchart_restaurant = Flowchart.where(genre: "飲食業")
    @flowchart_amusement = Flowchart.where(genre: "風営法")
    @flowchart_construction = Flowchart.where(genre: "建設業法")
    @flowchart_immigration = Flowchart.where(genre: "入管法")
    @flowchart_other = Flowchart.where(genre: "その他")
  end

  def show
    @flowchart = Flowchart.find(params[:id])
    # @flowchartでflowchartのデータを探し出し、そのうちのintroductionカラムを"→"の部分で分割し、配列化して取得する
    @flowchart_introductions = @flowchart[:introduction].split("→")
  end

  def destroy
  end

  private
  def flowchart_params
    params.require(:flowchart).permit(:title, :genre, :introduction)
  end
end
