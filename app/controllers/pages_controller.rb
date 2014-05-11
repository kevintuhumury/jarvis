class PagesController < ApplicationController

  def index
    @pages = Page.all
  end

  def edit
    @page = Page.find params[:id]
  end

end
