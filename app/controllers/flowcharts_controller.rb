# frozen_string_literal: true

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
    # フローチャート用の配列作成
    @flowchart_restaurant_chart = Flowchart.where(genre: '飲食業', part: 'フローチャート')
    @flowchart_amusement_chart = Flowchart.where(genre: '風営法', part: 'フローチャート')
    @flowchart_construction_chart = Flowchart.where(genre: '建設業法', part: 'フローチャート')
    @flowchart_immigration_chart = Flowchart.where(genre: '入管法', part: 'フローチャート')
    @flowchart_other_chart = Flowchart.where(genre: 'その他', part: 'フローチャート')
    #ホームページ用の配列作成
    @flowchart_restaurant_hp = Flowchart.where(genre: '飲食業', part: 'ホームページ')
    @flowchart_amusement_hp = Flowchart.where(genre: '風営法', part: 'ホームページ')
    @flowchart_construction_hp = Flowchart.where(genre: '建設業法', part: 'ホームページ')
    @flowchart_immigration_hp = Flowchart.where(genre: '入管法', part: 'ホームページ')
    @flowchart_other_hp = Flowchart.where(genre: 'その他', part: 'ホームページ')
  end

  def show
    @flowchart = Flowchart.find(params[:id])
    # @flowchartでflowchartのデータを探し出し、そのうちのintroductionカラムを"→"の部分で分割し、配列化して取得する
    @flowchart_introductions = @flowchart[:introduction].split(',')
  end

  def edit
    @flowchart = Flowchart.find(params[:id])
  end

  def update
    @flowchart = Flowchart.find(params[:id])
    @flowchart.update(flowchart_params)
    redirect_to flowchart_path(@flowchart.id)
  end

  def destroy
    @flowchart = Flowchart.find(params[:id])
    @flowchart.destroy
    redirect_to flowcharts_path
  end

  private

  def flowchart_params
    params.require(:flowchart).permit(:title, :genre, :introduction, :part, :url)
  end
end
