class NotesController < ApplicationController
  def destroy
    @note = Note.find(params[:id])
    if @note.destroy
      redirect_to group_student_path(@note.student.group, @note.student), status: :see_other
    else
      render :back, status: :unprocessable_entity
    end
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.student = Student.find(params[:query])
    if @note.save
      redirect_to group_student_path(@note.student.group, @note.student), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.student = Student.find(params[:query])
    if @note.update(note_params)
      redirect_to group_student_path(@note.student.group, @note.student), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def note_params
    params.require(:note).permit(:description)
  end
end
