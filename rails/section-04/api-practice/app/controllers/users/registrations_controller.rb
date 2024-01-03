# inherits from Devise Registration
module Users
  class RegistrationsController < Devise::RegistrationsController
    # explicitly respond with JSON
    respond_to :json

    private

    # override devise method - why?
    def respond_with(resource, _opts = {})
      register_success && return if resource.persisted?

      register_failed resource
    end

    # custom success/failure handlers
    def register_success
      render json: { message: "Signed up sucessfully." },
             status: :created
    end

    def register_failed(resource)
      render json: { message: resource.errors.full_messages },
             status: :bad_request
    end
  end
end
