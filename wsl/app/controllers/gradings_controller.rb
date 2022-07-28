class GradingsController < ApplicationController
  before_action :set_grading, only: %i[ show edit update destroy toggle_approval]

  # GET /gradings or /gradings.json
  def index
    @gradings = Grading.all
  end

  # GET /gradings/1 or /gradings/1.json
  def show
  end

  # GET /gradings/new
  def new
    @grading = Grading.new
  end

  # GET /gradings/1/edit
  def edit
  end

  # POST /gradings or /gradings.json
  def create
    @grading = Grading.new(grading_params)

    respond_to do |format|
      if @grading.save
        format.html { redirect_to courses_path, notice: "Application successfully submitted." }
        format.json { render :show, status: :created, location: @grading }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grading.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /gradings/1
  def toggle_approval
    if (@grading.isGrading)
      @grading.update_column(:isGrading, false);
    else

      @grading.update_column(:isGrading, true);
    end
    respond_to do |format|
      format.html { redirect_to gradings_path('course_id'=>@grading.course_id), notice: "Successfully approved application." }
      format.json { head :no_content }
    end
  end

  # PATCH/PUT /gradings/1 or /gradings/1.json
  def update
    respond_to do |format|
      if @grading.update(grading_params)
        format.html { redirect_to courses_path, notice: "Changes saved successfully." }
        format.json { render :show, status: :ok, location: @grading }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gradings/1 or /gradings/1.json
  def destroy
    @grading.destroy
    respond_to do |format|
      if current_user.user_type == 1
        format.html { redirect_to root_path, notice: "Application withdrawn." }
      else 
        format.html { redirect_to gradings_path('course_id'=>@grading.course_id), notice: "Application withdrawn." }
      end
      format.json { head :no_content }
    end
  end

  def recommendation
    respond_to do |format|
      if @grading.update(grading_params)
        format.html { redirect_to courses_path, notice: "Recommendation saved successfully." }
        format.json { render :show, status: :ok, location: @grading }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grading.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grading
      @grading = Grading.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grading_params
      params.require(:grading).permit(:course_id, :user_id, :isGrading, :mon, :tue, :wed, :thu, :fri, :other, :recommendation)
    end
end
