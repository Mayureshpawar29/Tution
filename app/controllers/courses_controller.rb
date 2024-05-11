class CoursesController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    @course = Course.new(course_params)

    Course.transaction do
      @course.save!
      create_tutors
    rescue ActiveRecord::RecordInvalid => e
      handle_validation_errors(e)
      raise ActiveRecord::Rollback
    end
  end

  def index
    @courses = Course.includes(:tutors)
  end

  private

  def create_tutors
    tutors_params.each do |tutor_param|
      tutor = @course.tutors.build(tutor_param)
      tutor.save!
    end
  end

  def handle_validation_errors(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

  def tutors_params
    params.require(:tutors).map do |tutor_param|
      tutor_param.permit(:name, :email)
    end
  end

  def course_params
    params.require(:course).permit(:title, :description, :start_date, :end_date)
  end
end
