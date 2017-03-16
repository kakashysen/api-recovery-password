class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    ExampleMailer.sample_email(@user).deliver
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  # POST /users/password_reset
  def password_reset
    user_email = params['email']
    @user = User.find_by(email: user_email)
    if @user
      password_recovery_token = SecureRandom.hex(32)
      @user.password_recovery_token = password_recovery_token
      @user.password_recovery_expiration = Time.now
      begin
        @user.save!
        base_url = request.protocol + request.host_with_port
        ExampleMailer.sample_email(@user, base_url).deliver
        render json: {success: 'request reset password successful'}, status: :ok 
      rescue Exception => e
        render json: {error: 'Fail save user with temporal password recovery token'}, status: :internal_server_error
      end
    else
      render json: {error: 'User not found'}, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
