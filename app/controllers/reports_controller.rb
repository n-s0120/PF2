# frozen_string_literal: true

class ReportsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    report = current_user.reports.new(article_id: @article.id)
    report.save
  end

  def destroy
    @article = Article.find(params[:article_id])
    report = current_user.reports.find_by(article_id: @article.id)
    report.destroy
  end

  def index
    article_ids = Report.pluck(:article_id)
    @articles = Article.where(:id => article_ids)
  end
end
