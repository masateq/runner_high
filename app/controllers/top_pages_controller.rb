class TopPagesController < ApplicationController
  skip_before_action :require_login, only: %i[tutorial start]
  skip_before_action :set_user_info, only: %i[tutorial start]

  def tutorial
  end

  def start
  end
  
end
