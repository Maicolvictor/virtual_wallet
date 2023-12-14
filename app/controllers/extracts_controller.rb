class ExtractsController < ApplicationController
  before_action :set_extract, only: %i[ show edit update destroy ]

  # GET /extracts or /extracts.json
  def index
    if params[:account_id].present?
      @account = Account.find(params[:account_id])
      @extracts = @account.wallet.extracts
    else
      @extracts = Extract.all
    end
  end

  # GET /extracts/1 or /extracts/1.json
  def show
  end

  # GET /extracts/new
  def new
    @extract = Extract.new
  end

  # GET /extracts/1/edit
  def edit
  end

  # POST /extracts or /extracts.json
  def create
    @extract = Extract.new(extract_params)

    respond_to do |format|
      if @extract.save
        format.html { redirect_to extract_url(@extract), notice: "Extract was successfully created." }
        format.json { render :show, status: :created, location: @extract }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @extract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extracts/1 or /extracts/1.json
  def update
    respond_to do |format|
      if @extract.update(extract_params)
        format.html { redirect_to extract_url(@extract), notice: "Extract was successfully updated." }
        format.json { render :show, status: :ok, location: @extract }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @extract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extracts/1 or /extracts/1.json
  def destroy
    @extract.destroy

    respond_to do |format|
      format.html { redirect_to extracts_url, notice: "Extract was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extract
      @extract = Extract.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def extract_params
      params.require(:extract).permit(:transaction_type, :amount, :account_id, :wallet_id)
    end
end
