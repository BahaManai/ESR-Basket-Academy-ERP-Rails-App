class UsersController < ApplicationController
  before_action :check_admin, only: [ :new, :create, :edit, :update, :destroy ]

  # Index action to list all users
  def index
    @users = User.all
  end

  # Show action to view a user
  def show
  end

  # New action to render the form for creating a new user
  def new
    @user = User.new
  end

  # Create action to create a new user
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: "L'utilisateur a été créé avec succès." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Edit action to render the form for editing an existing user
  def edit
    @user = User.find(params[:id])
  end

  # Update action to update an existing user
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: "L'utilisateur a été mis à jour avec succès." }
        format.json { render :edit, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Destroy action to delete a user
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "L'utilisateur a été supprimé avec succès."
  end

  private

  # Set user for actions like show, edit, update, and destroy
  def set_user
    @user = User.find(params[:id])
  end

  # Define strong parameters for user
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :user_name)
  end

  def check_admin
    unless current_user.role == "Administrateur"
      redirect_to root_path, alert: "Vous n'êtes pas autorisé à effectuer cette action."
    end
  end
end
