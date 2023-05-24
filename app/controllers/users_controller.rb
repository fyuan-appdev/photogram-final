class UsersController < ApplicationController

  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username =>:asc})
    
    render ({ :template => "user_template/index.html.erb"})
  end

  def detail 
    input_username = params.fetch("username")
    matching_username = User.where({:username=> input_username})
    @user = matching_username.at(0)

    if @user == nil
      redirect_to("/404")
    else
      render ({ :template => "user_template/detail.html.erb"})
    end
  end

end
