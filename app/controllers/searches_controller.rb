class SearchesController < ApplicationController
  def search
    @model = params["search"]["model"]
    @value = params["search"]["value"]
    @how = params["search"]["how"]
    @datas = search_for(@model, @value, @how)
  end

  private

  def match(model, value)
    if model == 'article'
      Article.where(title: value)
    elsif model == 'flow'
      Flow.where(title: value)
    end
  end

  def partical(model, value)
    if model == 'article'
      Article.where("name LIKE ?", "%#{value}%")
    elsif model == 'flow'
      Flow.where("title LIKE ?", "%#{value}%")
    end
  end

  def search_for(model, value, how)
    case how
      when 'match'
        match(model, value)
      when 'partical'
        partical(model, value)
    end
  end
end