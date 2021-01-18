class UsersController < ApplicationController
  def create
    @user = User.new(user.params)
    if @user.save
      redirect_to controller: :users, action: :inde
    else
      render "new"
    end
  end
end
