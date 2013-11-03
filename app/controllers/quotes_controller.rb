class QuotesController < ApplicationController
  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(params[:quote])
    #If the quote goes through, render the thank you page, else render the new quotes page
    if @quote.deliver
      render :thank_you
    else
      render :new
    end
  end
end
