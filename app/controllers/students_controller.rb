class StudentsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :require_admin, only: [:index, :destroy]
  before_action :require_mentor, only: [:section_students]
  before_action :require_admin_or_owner, only: [:show, :edit, :update]
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.active_students
  end

  # GET /section/section:id/students
  def section_students
    @students = @section.students.where(is_deleted: false)
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
    @student.user_auth = UserAuth.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.mark_deleted
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :phone_number, :address, :major_id, user_auth_attributes: [:email, :password, :password_confirmation])
    end

    def is_owner?
      is_student? and current_user.id.to_s == params[:id]
    end

    def require_admin_or_owner
      unless is_admin? or is_owner?
        redirect_to home_url, notice: NOT_AUTHORIZED
      end
    end

    def require_admin_teacher_or_owner
      unless is_admin? or is_teacher? or is_owner?
        redirect_to home_url, notice: NOT_AUTHORIZED
      end
    end

    def require_mentor
      @section = Section.find(params[:section_id])
      unless current_user.id == @section.teacher_id
        redirect_to home_url, notice: NOT_AUTHORIZED
      end
    end
end
