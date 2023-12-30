module AuthenticationCheck
  extend ActiveSupport::Concern

  def is_user_logged_in
    return unless current_user.nil?

    render json: { message: "User is not authenticated" },
           status: :unauthorized
  end
end
