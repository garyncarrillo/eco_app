class Users::RegistrationsController  < Devise::RegistrationsController
  def create
    user = User.user.new(
      email: user_params[:email],
      name: user_params[:name],
      password: user_params[:password],
      password_confirmation: user_params[:password_confirmation],
    )

    if user.save
      sign_in_and_redirect user, event: :authentication
    else
      redirect_to new_user_registration_url, alert: user.errors.messages
    end
  end

  private

  def user_params
    params.require(:user).permit(
     :email,
     :name,
     :password,
     :password_confirmation,
    )
  end
end
