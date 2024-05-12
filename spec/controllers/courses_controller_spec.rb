# spec/controllers/courses_controller_spec.rb
require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          course: {
            title: 'Introduction to Programming',
            description: 'A beginner-friendly course on programming fundamentals.',
            start_date: '2024-06-01',
            end_date: '2024-08-01'
          },
          tutors: [
            { name: 'John Doe', email: 'john.doe@example.com' },
            { name: 'Jane Smith', email: 'jane.smith@example.com' }
          ]
        }
      end

      it 'creates a new course and tutors' do
        post :create, params: valid_params, as: :json

        expect(response).to have_http_status(:created)
        expect(Course.count).to eq(1)
        expect(Tutor.count).to eq(2)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          course: {
            title: 'Introduction to Programming',
            description: 'A beginner-friendly course on programming fundamentals.',
            start_date: '2024-06-01',
            end_date: '2024-08-01'
          },
          tutors: [
            { name: 'John Doe', email: 'john.doe@example.com' },
            { name: 'Jane Smith', email: 'invalid_email' } # Invalid email
          ]
        }
      end

      it 'returns unprocessable_entity status' do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns error messages' do
        post :create, params: invalid_params
        expect(JSON.parse(response.body)['errors']).to include("Email is invalid")
      end
    end
  end

  describe 'GET #index' do
    it 'returns a list of courses with tutors' do
      course = FactoryBot.create(:course)
      tutor1 = FactoryBot.create(:tutor, course: course)
      tutor2 = FactoryBot.create(:tutor, course: course)

      get :index, as: :json
      expect(response).to have_http_status(:ok)

      parsed_response = JSON.parse(response.body)
      returned_course = parsed_response[0]

      expect(returned_course).to include('title')
      expect(returned_course['title']).to eq(course.title)

      expect(returned_course).to include('description')
      expect(returned_course['description']).to eq(course.description)

      tutors = returned_course['tutors']

      tutors.each do |tutor|
        expect(tutor).to include('name')
        expect(tutor).to include('email')
      end
    end
  end
end
