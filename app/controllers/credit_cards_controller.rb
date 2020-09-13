class CreditCardsController < ApplicationController
  before_action :set_student, only: [:new, :create]
  before_action :set_credit_card, only: [:show, :edit, :update, :destroy]

  # GET student/1/credit_cards/1
  # GET student/1/credit_cards/1.json
  def show
  end

  # GET student/1/credit_cards/new
  def new
    @credit_card = CreditCard.new()
  end

  # GET student/1/credit_cards/1/edit
  def edit
  end

  # POST student/1/credit_cards
  # POST student/1/credit_cards.json
  def create
    @credit_card = CreditCard.new(credit_card_params)
    @credit_card.student = @student

    respond_to do |format|
      if @credit_card.save
        format.html { redirect_to [@student, @credit_card], notice: 'Credit card was successfully created.' }
        format.json { render :show, status: :created, location: [@student, @credit_card] }
      else
        format.html { render :new }
        format.json { render json: @credit_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT student/1/credit_cards/1
  # PATCH/PUT student/1/credit_cards/1.json
  def update
    respond_to do |format|
      if @credit_card.update(credit_card_params)
        format.html { redirect_to [@student, @credit_card], notice: 'Credit card was successfully updated.' }
        format.json { render :show, status: :ok, location: [@student, @credit_card] }
      else
        format.html { render :edit }
        format.json { render json: @credit_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE student/1/credit_cards/1
  # DELETE student/1/credit_cards/1.json
  def destroy
    @credit_card.destroy
    respond_to do |format|
      format.html { 
        redirect_to edit_student_path(@student), notice: 'Credit card was successfully deleted.' 
      }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:student_id])
    end

    def set_credit_card
      set_student
      @credit_card = CreditCard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def credit_card_params
      params.require(:credit_card).permit(:name_on_card, :card_number, :expiration_date, :cvv)
    end
end
