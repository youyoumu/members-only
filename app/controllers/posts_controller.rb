class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  private

  def require_login
  end

end
