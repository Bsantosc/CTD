require 'rails_helper'

RSpec.describe 'Dashboard', type: :request do
  describe 'GET /dashboard' do
    it 'returns a 200 OK status' do
      # Send a GET request to the dashboard route
      get "/dashboard"

      # Check that the response status is 200 (OK)
      expect(response).to have_http_status(:ok)
    end

    before do
      current_trimester = Trimester.create!(
        term: 'Current term',
        year: Date.today.year.to_s,
        start_date: Date.today - 1.day,
        end_date: Date.today + 2.months,
        application_deadline: Date.today - 16.days
      )
      # Define past_trimester here and uncomment it when you're ready.
      past_trimester = Trimester.create!(
        term: 'Past term',
        year: (Date.today.year - 1).to_s,
        start_date: Date.today - 1.year,
        end_date: Date.today - 6.months,
        application_deadline: Date.today - 1.year - 2.weeks
      )
      
      #Define upcoming_trimester 
      upcoming_trimester = Trimester.create!(
        term: 'Upcoming term',
        year: (Date.today + 1.month).year.to_s,
        start_date: Date.today + 1.month,
        end_date: Date.today + 4.months,
        application_deadline: Date.today + 2.weeks
      )
  
    end

    it 'displays the current trimester' do
      get "/dashboard"
      expect(response.body).to include("Current term - #{Date.today.year} Courses")
      
    end

    it 'displays links to the courses in the current trimester' do
    end

    it 'displays the upcoming trimester' do
      get "/dashboard"
      expect(response.body).to include("Upcoming term - #{(Date.today + 1.month).year} Courses")
    end

    it 'displays links to the courses in the upcoming trimester' do
    end
  end
end