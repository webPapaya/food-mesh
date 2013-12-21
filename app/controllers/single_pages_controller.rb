class SinglePagesController < ApplicationController
  before_action :set_single_page, only: [:show, :edit, :update, :destroy]

  # GET /single_pages
  # GET /single_pages.json
  def index
    @single_pages = SinglePage.all
  end

  # GET /single_pages/1
  # GET /single_pages/1.json
  def show
  end

  # GET /single_pages/new
  def new
    @single_page = SinglePage.new
  end

  # GET /single_pages/1/edit
  def edit
  end

  # POST /single_pages
  # POST /single_pages.json
  def create
    @single_page = SinglePage.new(single_page_params)

    respond_to do |format|
      if @single_page.save
        format.html { redirect_to @single_page, notice: 'Single page was successfully created.' }
        format.json { render action: 'show', status: :created, location: @single_page }
      else
        format.html { render action: 'new' }
        format.json { render json: @single_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /single_pages/1
  # PATCH/PUT /single_pages/1.json
  def update
    respond_to do |format|
      if @single_page.update(single_page_params)
        format.html { redirect_to @single_page, notice: 'Single page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @single_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /single_pages/1
  # DELETE /single_pages/1.json
  def destroy
    @single_page.destroy
    respond_to do |format|
      format.html { redirect_to single_pages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_single_page
      @single_page = SinglePage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def single_page_params
      params[:single_page]
    end
end
