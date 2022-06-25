class ApplicationController < ActionController::Base
  def set_search
    # @q = Customer.ransack(params[:q])
    @q = current_user.topics.ransack(params[:q])
  end

  private

  def after_sign_in_path_for(resource)
    topics_path
  end
end
