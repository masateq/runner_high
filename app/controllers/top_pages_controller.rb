class TopPagesController < ApplicationController
  def top
    @user = @current_user.id
  end
end
