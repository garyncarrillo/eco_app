class Admin::UsersController < ApplicationController
  before_action :set_post, only: %i[ edit ]
  def index
    @users = User.user
  end

  def new
    @users = User.new
  end

  def create
    @user = User.user.new(name: params[:name], email: params[:email])

    respond_to do |format|
      if @user.save
       format.html {
         redirect_to controller: 'users', action: 'show', id: @user.id
       }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.user.find(params[:id])

    if @user.update(user_params)
      redirect_to controller: 'users', action: 'show', id: @user.id
    else
      format.html { render :new, status: :unprocessable_entity }
    end
  end

  def destroy
    @user = User.user.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end
  end

  def show
    @user = User.user.find(params[:id])
  end

  private

  def set_post
    @user = User.user.find(params[:id])
  end

  def user_params
     params.require(:user).permit(:name, :email)
  end
end
