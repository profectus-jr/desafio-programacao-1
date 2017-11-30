class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
    @gross_revenue = @sales.sum(:item_price)
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create

    File.foreach( params[:sale][:import_file].path ).with_index do |line, index|
      if index > 0
        info = []
        info = line.split("\t")
        Sale.create(purchaser_name: info[0], item_description: info[1], item_price: info[2],
                     purchaser_count: info[3], merchant_address: info[4], merchant_name: info[5])
      end
    end

    redirect_to sales_path
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale}
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:purchaser_name, :item_description, :item_price, :purchaser_count, :merchant_address, :merchant_name)
    end
end
