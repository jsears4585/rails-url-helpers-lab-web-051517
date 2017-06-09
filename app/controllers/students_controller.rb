require 'pry'

class StudentsController < ApplicationController

  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    @student = set_student
  end

  def activate
    @student = Student.find(params[:id])
    @student.active ? @student.active = false : @student.active = true
    @student.save
    redirect_to action: :show, id: params[:id]
  end

  private
    def set_student
      Student.find(params[:id])
    end

end
