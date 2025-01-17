# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActiveRecord::NotNullViolation, with: :handle_not_null_violation

  # rescue_from StandardError, with: :internal_server_error

  private

  def record_not_found(exception)
    render json: { error: 'Record not found', message: exception.message }, status: :not_found
  end

  def record_invalid(exception)
    render json: { error: 'Validation failed', message: exception.record.errors.full_messages },
           status: :unprocessable_entity
  end

  def internal_server_error(exception)
    render json: { error: 'Internal Server Error 45', message: exception.message }, status: :internal_server_error
  end

  def handle_not_null_violation(exception)
    render json: {
      error: 'Invalid data',
      message: exception.message
    }, status: :unprocessable_entity
  end
end
