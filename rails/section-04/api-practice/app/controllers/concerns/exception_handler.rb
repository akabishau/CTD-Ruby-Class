module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |err|
      render json: { message: err.message },
             status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |err|
      render json: { message: err.message },
             status: :unprocessable_entity
    end

    rescue_from ActionController::ParameterMissing do |err|
      render json: { message: err.message },
             status: :unprocessable_entity
    end
  end
end
