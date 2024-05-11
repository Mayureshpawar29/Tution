# app/controllers/courses_controller.rb
class CoursesController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    course = Course.new(course_params)

    if course.save
      tutors_params = params[:tutors]
      tutors_params.each do |tutor_param|
        course.tutors.create(name: tutor_param[:name], email: tutor_param[:email])
      end
      render json: course, status: :created
    else
      render json: { errors: course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    @courses = Course.includes(:tutors)
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :start_date, :end_date)
  end
end
