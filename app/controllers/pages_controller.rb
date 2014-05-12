class PagesController < ApplicationController

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new page_params

    if @page.save
      redirect_to pages_path, notice: t(".notice")
    else
      flash.now.alert = t(".alert")
      render :new
    end
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

  def destroy
    if page.destroy
      flash.notice = t(".notice")
    else
      flash.alert = t(".alert")
    end

    redirect_to pages_path
  end

  private

  def page
    Page.find params[:id]
  end

  def page_params
    params.require(:page).permit :title, :body
  end

end
