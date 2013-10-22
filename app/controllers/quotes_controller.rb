class QuotesController < ApplicationController
  def new
    @quote = Quote.new
  end
  def create
    @quote = Quote.new(params[:quote])
    if @quote.deliver
      render :thank_you
    else
      render :new
    end
  end
end
