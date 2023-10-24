class StudentsController < ApplicationController
  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      redirect_to group_path(@student.group), status: :see_other
    else
      render :back, status: :unprocessable_entity
    end
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.group = Group.find(params[:group_id])
    if @student.save
      redirect_to group_path(@student.group), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.group = Group.find(params[:group_id])
    if @student.update(student_params)
      redirect_to group_path(@student.group)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    student = Student.find(params[:id])
    if student.group.user == current_user
      @student = student
    else
      redirect_to group_path(student.group)
    end
  end

  private

  def student_params
    params.require(:student).permit(:firstname, :lastname)
  end
end
