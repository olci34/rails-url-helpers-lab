class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :activation]
  
  def index
    @students = Student.all
  end

  def show
    @message = @student.active ? "This student is currently active." : "This student is currently inactive."
  end

  def activation
    if @student.active
      @student.active = false
    else
      @student.active = true
    end
    @student.save
    redirect_to student_path(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end