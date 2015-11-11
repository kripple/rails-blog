class ErrorsController < ApplicationController::Base
  def not_found
  	# render layout: false
  end

  def internal_error
  	# render layout: false
  end

  def unprocessable_entity
  	# render layout: false
  end
end