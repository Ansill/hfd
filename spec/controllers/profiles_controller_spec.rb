require 'rails_helper'

RSpec.describe ProfilesController, :type => :controller do

  let!(:profile){
    create(:profile)
  }

  let!(:user){
    create(:user)
  }

  describe 'authentication' do
    it 'should have a current user' do
      sign_in user
      expect(subject.current_user).not_to eq nil
    end
  end

  describe 'GET #index' do
    before(:each) do
      get :index
    end

    it 'should return all profile objects' do
      expect(assigns(:profiles)).not_to eq nil
    end

    it 'should return one profile' do
      expect(assigns(:profiles).length).to eq(1)
    end

    it 'should include this profile' do
      expect(assigns(:profiles)).to include(profile)
    end
  end

  describe 'GET #show' do
    before(:each) do
      get :show, id: profile
    end

    it 'should show a profile object' do
      expect(assigns(:profile)).to eq profile
    end
  end

  describe 'GET #new' do
    before(:each) do
      sign_in user
      get :new
    end

    it 'instantiates a new object' do
      expect(assigns(:profile).class).to eq Profile
    end

    it 'should be a new record' do
      expect(assigns(:profile).new_record?).to eq true
    end
  end

  describe 'GET #edit' do
    before(:each) do
      sign_in user
      get :edit, id: profile
    end

    it 'should return the correct object' do
      expect(assigns(:profile)).to eq profile
    end
  end

  describe 'POST #create' do
    before(:each) do
      sign_in user
      @profile_params = FactoryGirl.attributes_for(:profile)
    end

    context 'with good data' do
      it 'should create a new record' do
        expect {
          post :create, :profile => @profile_params
        }.to change(Profile, :count).by(1)
      end
    end
  end

  describe 'PUT #update' do
    before(:each) do
      sign_in user
    end

    context 'with good data' do
      it 'updates the profile' do
        patch :update, id: profile,
        profile: FactoryGirl.attributes_for(:profile, name: "William", position: "Cameraman")
        expect(assigns(:profile).name).to eq "William"
        expect(assigns(:profile).position).to eq "Cameraman"
      end
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      sign_in user
    end

    it 'deletes the profile' do
      expect{
        delete :destroy, id: profile
      }.to change(Profile, :count).by(-1)
    end
  end

end
