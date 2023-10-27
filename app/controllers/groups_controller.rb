class GroupsController < ApplicationController
  def index
    if user_signed_in?
      @groups = Group.where(user: current_user).order('updated_at DESC')
      @groups = [] if @groups.nil?
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      redirect_to groups_path(@group)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      redirect_to groups_path, status: :see_other
    else
      render :back, status: :unprocessable_entity
    end
  end

  def show
    group = Group.find(params[:id])
    if group.user == current_user
      @group = group
    else
      redirect_to groups_path
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.user = current_user
    if @group.update(group_params)
      redirect_to groups_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
