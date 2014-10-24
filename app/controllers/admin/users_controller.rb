class Admin::UsersController < AdminController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]
  # layout 'admin'
  # GET /admin/users
  # GET /admin/users.json
  before_action :set_roles
  load_and_authorize_resource
  skip_authorize_resource :only => [:grant]
  def index
    @admin_users = Admin::User.all
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
  end

  # GET /admin/users/new
  def new
    @admin_user = Admin::User.new
  end

  # GET /admin/users/1/edit
  def edit
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
    @admin_user = Admin::User.new(admin_user_params)

    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to @admin_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @admin_user }
      else
        format.html { render :new }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    respond_to do |format|

      if @admin_user.update(admin_user_params)
        format.html { redirect_to @admin_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_user }
      else
        format.html { render :edit }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    @admin_user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def grant 
     @admin_user = Admin::User.find(params[:id])
     
     if   request.post?
        # binding.pry
        # FIXME 清除之前的role数据
        # binding.pry 
      @admin_user.user_roles.destroy_all
      if params[:admin_user]
        # @admin_user.user_roles.destroy_all
        @admin_user.user_roles_attributes= admin_user_params[:user_roles_attributes]
        @admin_user.save(validate:false)

        
      end
      gflash :now,:success => "#{@admin_user.name}授权成功",
                  :notice => { :value => "恭喜您", :sticky => true }
      redirect_to admin_users_path

     end
     
  end

  private
      def set_roles
        @roles = Admin::Role.all
      end

    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_user_params
      # params[:admin_user]
      # binding.pry
      params.require(:admin_user).permit(:email,:password,:name,user_roles_attributes: [:role_id])
    end
end
