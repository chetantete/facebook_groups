class Api::V1::KeywordsController < ApplicationController
  before_action :set_keyword, only: [:show, :update, :destroy] #, :edit

  # GET /keywords
  # GET /keywords.json
  def index
    @keywords = Keyword.all
    render json: { status: 200, data: @keywords}
    # render json: { status: 403, error: true, message: har.errors}
  end

  # GET /keywords/1
  # GET /keywords/1.json
  def show
    render json: { status: 200, data: @keyword}
  end

  # GET /keywords/new
  # def new
  #   @keyword = Keyword.new
  # end

  # GET /keywords/1/edit
  # def edit
  # end

  # POST /keywords
  # POST /keywords.json
  def create
    debugger
    @keyword = Keyword.new(keyword_params)
    if @keyword.save
      render json: { status: 200, data: @keyword}
    else
      render json: { status: 403, error: true, message: @keyword.errors}
    end
  end

  # PATCH/PUT /keywords/1
  # PATCH/PUT /keywords/1.json
  def update
    # debugger
    if @keyword.update(keyword_params)
      render json: { status: 200, data: @keyword}
    else
      render json: { status: 403, error: true, message: @keyword.errors}
    end
  end

  # DELETE /keywords/1
  # DELETE /keywords/1.json
  def destroy
    if @keyword.destroy
      render json: { status: 200, data: @keyword}
    else
      render json: { status: 403, error: true, message: @keyword.errors}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keyword
      @keyword = Keyword.find(params[:id]) rescue ""
      if @keyword.blank? 
      end
    end

    # Only allow a list of trusted parameters through.
    def keyword_params
      params.require(:keyword).permit(:keyword, :group_id)
    end
end
