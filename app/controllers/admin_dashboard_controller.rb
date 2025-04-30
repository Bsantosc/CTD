class AdminDashboardController < ApplicationController
  def index
    @spring_trimester = Trimester.find_by(term: "Spring", year: 2025)
    @summer_trimester = Trimester.find_by(term: "Summer", year: 2025)

    @current_trimester = Trimester.where("start_date <= ?", Date.today).where("end_date >= ?", Date.today).first
    @upcoming_trimester = Trimester.where("start_date > ? AND start_date < ?", Date.today, Date.today + 6.months).first

  end
end