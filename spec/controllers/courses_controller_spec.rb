require 'rails_helper'

RSpec.describe CoursesController do
  describe 'getting index without login' do
    it "redirects to login page" do
      get :index
      expect(response).to redirect_to(login_url)
    end
  end

  describe 'getting index' do
    before :each do
      @request.session[:user_auth_id] = FactoryBot.create(:admin).user_auth.id
      @fake_results = [ FactoryBot.create(:course) ]
    end
    
    it 'calls the model method that returns active courses' do
      expect(Course).to receive(:active_courses).and_return(@fake_results)
      get :index
    end

    it "assigns @courses" do
      get :index
      expect(assigns(:courses)).to eq(@fake_results)
    end
  end

  describe 'getting index as student' do
    before :each do
      @request.session[:user_auth_id] = FactoryBot.create(:student).user_auth.id
    end

    it "renders the index/student template" do
      get :index
      expect(response).to render_template("index/student")
    end
  end

  describe 'getting index as teacher' do
    before :each do
      @request.session[:user_auth_id] = FactoryBot.create(:teacher).user_auth.id
    end

    it "renders the index/teacher template" do
      get :index
      expect(response).to render_template("index/teacher")
    end
  end

  describe 'create course' do
    before :each do
      @request.session[:user_auth_id] = FactoryBot.create(:admin).user_auth.id
    end

    it 'calls the model methods that creates new course' do
      course = FactoryBot.build(:course)
      course_params = { course_number: "#{course.course_number}", name: "#{course.name}", discipline_id: "#{course.discipline_id}", area: "#{course.area}", price: "#{course.price}" }
      expect(Course).to receive(:new).with(ActionController::Parameters.new(course_params).permit!).and_return(course)
      post :create, :params => { :course => course_params }
    end
  end
end
