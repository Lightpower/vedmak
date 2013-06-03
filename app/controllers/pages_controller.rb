class PagesController < ApplicationController

  http_basic_authenticate_with :name => "neo", :password => "smile13", :except => [:show, :crypt]
  before_filter :assign_page, only: for_crud(without: [:show])
  respond_to :html, :json

  # GET /pages
  def index
    @pages = Page.all
    respond_with(@pages)
  end

  # GET /pages/1
  def show
    @pages = pages
    @page  = params[:id] ? Page.find(params[:id]) : @pages.first
  end

  # GET /pages/new
  def new
    respond_with(@page)
  end

  # GET /pages/1/edit
  def edit
    respond_with(@page)
  end

  # POST /pages
  def create
    @page.save and
      flash[:notice] = "Page was successfully created"

    respond_with(@page)
  end

  # PUT /pages/1
  def update
    @page.update_attributes(params[:page]) and
      flash[:notice] = "Page was successfully updated"

    respond_with(@page)
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy and
      flash[:notice] = "Page was successfully destroyed"

    respond_with(@page)
  end

  def crypt
    render inline: '..- .-. .-..', layout: 'plain'
  end

  private

    def assign_page
      @page = params[:id] ?
        Page.find(params[:id]) :
        Page.new(params[:page])
    end

    def pages
      pages = Page.order('id DESC')
      pages[0].id = 3
      pages[1].id = 2
      pages[2].id = 1
      if current_user.blank?
        [pages.last]
      elsif current_user.email == 'geralt@ukr.net'
        pages[1..2]
      else
        pages
      end
    end
end
