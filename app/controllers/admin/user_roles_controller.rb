class Admin::UserRolesController < ApplicationController
  before_action :set_admin_user_role, only: [:show, :edit, :update, :destroy]

  # GET /admin/user_roles
  # GET /admin/user_roles.json
  def index
    @admin_user_roles = Admin::UserRole.all
  end

  # GET /admin/user_roles/1
  # GET /admin/user_roles/1.json
  def show
  end

  # GET /admin/user_roles/new
  def new
    @admin_user_role = Admin::UserRole.new
  end

  # GET /admin/user_roles/1/edit
  def edit
  end

  # POST /admin/user_roles
  # POST /admin/user_roles.json
  def create
    @admin_user_role = Admin::UserRole.new(admin_user_role_params)

    respond_to do |format|
      if @admin_user_role.save
        format.html { redirect_to @admin_user_role, notice: 'User role was successfully created.' }
        format.json { render :show, status: :created, location: @admin_user_role }
      else
        format.html { render :new }
        format.json { render json: @admin_user_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/user_roles/1
  # PATCH/PUT /admin/user_roles/1.json
  def update
    respond_to do |format|
      if @admin_user_role.update(admin_user_role_params)
        format.html { redirect_to @admin_user_role, notice: 'User role was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_user_role }
      else
        format.html { render :edit }
        format.json { render json: @admin_user_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/user_roles/1
  # DELETE /admin/user_roles/1.json
  def destroy
    @admin_user_role.destroy
    respond_to do |format|
      format.html { redirect_to admin_user_roles_url, notice: 'User role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user_role
      @admin_user_role = Admin::UserRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_user_role_params
      params.require(:admin_user_role).permit(:user_id, :role_id)
    end
end
