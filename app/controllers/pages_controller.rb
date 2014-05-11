class PagesController < ApplicationController

  def index
    @pages = Page.all
  end

  def edit
    @page = page
  end

  def update
    @page = page

    if @page.update page_params
      redirect_to pages_path, notice: t(".notice")
    else
      flash.now.alert = t(".alert")
      render :edit
    end
  end

  private

  def page
    Page.find params[:id]
  end

  def page_params
    params.require(:page).permit :name, :content
  end

end
