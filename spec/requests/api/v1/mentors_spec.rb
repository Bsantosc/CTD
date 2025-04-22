require 'rails_helper'

RSpec.describe "Mentors", type: :request do

  describe "GET /mentors" do
    context "when mentors exist" do
      before do
        Mentor.create!(first_name: "Ada", last_name: "Lovelace", email: "ada@example.com")
        Mentor.create!(first_name: "Alan", last_name: "Turing", email: "alan@example.com")
      end

      it "returns a page containing names of all mentors" do
        get '/mentors'
        expect(response.body).to include('Ada Lovelace')
        expect(response.body).to include('Alan Turing')
      end
    end

    context "when no mentors exist" do
      it "still loads the page with the title Mentors" do
        get '/mentors'
        expect(response.body).to include('Mentors')
        expect(response.body).not_to include('<li>')
      end
    end
  end

  describe "GET /mentors/:id" do
    let(:mentor) do
      Mentor.create!(
        first_name: "Grace",
        last_name: "Hopper",
        email: "grace@example.com"
      )
    end

    it "displays the mentor's full name and email" do
      get "/mentors/#{mentor.id}"
      expect(response.body).to include("Grace Hopper")
      expect(response.body).to include("grace@example.com")
    end
  end

end
