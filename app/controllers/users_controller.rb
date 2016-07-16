class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @items = Item.all
    render :index
  end

  # GET /users/1
  # GET /users/1.json
  def show
  	@user = User.find(params[:id])
    @items = @user.items
  	render :show
  end

  # GET /users/new
  def new
    @user = User.new
    render :new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    render 'edit'
  end

  # POST /users
  # POST /users.json
  def create
  	user_params = params.require(:user).permit(:email, :password, :password_confirmation)
  	@user = User.new(user_params)
  	if @user.save
  		#login user
  		session[:user_id] = @user.id
  		#redirect to user show w success message
  		redirect_to @user, flash: {success: "Successfully signed up!"}
  	else
  		#error, go back to signup page
  		 redirect_to sign_up_path, flash: { error: @user.errors.full_messages.to_sentence }
  	end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        redirect_to @user
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
end
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
