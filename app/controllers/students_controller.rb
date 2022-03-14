class StudentsController < ApplicationController

  def index
    name = params[:name]
    if (!!name == false)
      students = Student.all
      render json: students
    else
      first_match = Student.all.where({first_name: name.capitalize})
      last_match = Student.all.where({last_name: name.capitalize})
      if (first_match.size > 0 )
        render json: first_match
      elsif (last_match.size > 0)
        render json: last_match
      end
    end    
  end

  def show
    student = Student.all.find(params[:id])
    render json: student
  end


end
