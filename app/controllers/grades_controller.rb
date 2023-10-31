class GradesController < ApplicationController
  def new
    @grade = Grade.new
  end

  def create
    @grade = Grade.new(grade_params)
    @grade.student = Student.find(params[:query])
    if @grade.save
      redirect_to group_path(@grade.student.group), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @grade = Grade.find(params[:id])
    if @grade.destroy
      redirect_to group_path(@grade.student.group), status: :see_other
    else
      render :back, status: :unprocessable_entity
    end
  end

  private

  def grade_params
    params.require(:grade).permit(:grade)
  end
end
