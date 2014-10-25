class Admin::CoursesController < AdminController
  before_action :set_admin_course, only: [:show, :edit, :update, :destroy,:choosecourse]
  # load_and_authorize_resource
  # GET /admin/courses
  # GET /admin/courses.json
  def index
    @admin_courses = Admin::Course.all
  end

  # GET /admin/courses/1
  # GET /admin/courses/1.json
  def show
  end

  # GET /admin/courses/new
  def new
    @admin_course = Admin::Course.new
  end

  # GET /admin/courses/1/edit
  def edit
  end

  # POST /admin/courses
  # POST /admin/courses.json
  def create
    @admin_course = Admin::Course.new(admin_course_params)

    respond_to do |format|
      if @admin_course.save
        format.html { redirect_to @admin_course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @admin_course }
      else
        format.html { render :new }
        format.json { render json: @admin_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/courses/1
  # PATCH/PUT /admin/courses/1.json
  def update
    respond_to do |format|
      if @admin_course.update(admin_course_params)
        format.html { redirect_to @admin_course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_course }
      else
        format.html { render :edit }
        format.json { render json: @admin_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/courses/1
  # DELETE /admin/courses/1.json
  def destroy
    @admin_course.destroy
    respond_to do |format|
      format.html { redirect_to admin_courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #学生选课
  def choosecourse
    #当前用户信息
    # binding.pry
    # student = @admin_course.build_student
    # student.save
     @choose = current_user.student.update_attribute(:course_id,params[:id])
     respond_to do |format|
        format.js 
     end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_course
      @admin_course = Admin::Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_course_params
      params.require(:admin_course).permit(:name, :category_id, :courseid, :total, :address, :coursedate, :score)
    end
end
