class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]


    def index
      @quotes = current_company.quotes.ordered
    end

  def show
  end

  def new
    @quote = Quote.new
  end

  
def create
  # Only this first line changes to make sure the association is created
  @quote = current_company.quotes.build(quote_params)

  if @quote.save
    respond_to do |format|
      flash[:notice] = "Quote was successfully created."
      redirect_to quotes_path
      format.turbo_stream
    end
  else
    render :new
  end
end

  def edit
  end

  def update
    if @quote.update(quote_params)
      flash[:notice] = "Quote was successfully updated."
      redirect_to quotes_path
    else
      render :edit
    end
  end

  def destroy
  @quote.destroy

  respond_to do |format|
    flash[:notice] = "Quote was successfully Destroyed."
    redirect_to quotes_path
    format.turbo_stream
  end
end

  private

  def set_quote
    # We must use current_company.quotes here instead of Quote
    # for security reasons
    @quote = current_company.quotes.find(params[:id])
  end


  def quote_params
    params.require(:quote).permit(:name)
  end
end
