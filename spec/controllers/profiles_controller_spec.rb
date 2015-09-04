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

      it 'should redirect to profile index action' do
        post :create, :profile => @profile_params
        expect(response).to redirect_to :action => :index
      end
    end

    context 'with bad data' do

      it 'should not create a new record' do
        expect {
          post :create, :profile => {
            name: '',
            position: '',
            biography: '',
            facebook_url: '',
            instagram_url: '',
            twitter_url: '',
            youtube_url: ''
          }
        }.not_to change(Profile, :count)
      end

      it 'should render a new template' do
        post :create, :profile => {
            name: '',
            position: '',
            biography: '',
            facebook_url: '',
            instagram_url: '',
            twitter_url: '',
            youtube_url: ''
        }
        expect(response).to render_template :new
      end

      it 'should render a new template' do
        post :create, :profile => {
            name: '',
            position: '',
            biography: '',
            facebook_url: '',
            instagram_url: '',
            twitter_url: '',
            youtube_url: ''
        }
        expect(flash[:notice]).to eq "Profile not created"
      end
    end
  end

  describe 'PUT #update' do
    before(:each) do
      sign_in user
    end

    context 'with good data' do

      before(:each) do
        patch :update, id: profile,
          profile: FactoryGirl.attributes_for(:profile,
          name: "William",
          position: "Cameraman",
          biography: "Lorem ipsum dolor sit amet, audire fuisset elaboraret cu mel, liber dicant splendide mea cu. Qui an gubergren rationibus, ad oratio ignota efficiendi qui. Sed eirmod signiferumque ne, an iuvaret invidunt est. Option deleniti comprehensam an duo. Libris pertinacia an eos, mei ad veniam aliquam atomorum, wisi quaeque vim at.",
          facebook_url: "www.facebook.com/wtholt",
          instagram_url: "www.instagram.com/wtholt",
          twitter_url: "www.twitter.com/wtholt",
          youtube_url: "www.youtube.com/wtholt"
        )
      end
      it 'updates the profile name' do
        expect(assigns(:profile).name).to eq "William"
      end

      it 'updates the profile position' do
        expect(assigns(:profile).position).to eq "Cameraman"
      end

      it 'updates the profile biography' do
        expect(assigns(:profile).biography).to eq "Lorem ipsum dolor sit amet, audire fuisset elaboraret cu mel, liber dicant splendide mea cu. Qui an gubergren rationibus, ad oratio ignota efficiendi qui. Sed eirmod signiferumque ne, an iuvaret invidunt est. Option deleniti comprehensam an duo. Libris pertinacia an eos, mei ad veniam aliquam atomorum, wisi quaeque vim at."
      end

      it 'updates the profile facebook url' do
        expect(assigns(:profile).facebook_url).to eq "www.facebook.com/wtholt"
      end

      it 'updates the profile instagram url' do
        expect(assigns(:profile).instagram_url).to eq "www.instagram.com/wtholt"
      end

      it 'updates the profile twitter url' do
        expect(assigns(:profile).twitter_url).to eq "www.twitter.com/wtholt"
      end

      it 'updates the profile youtube url' do
        expect(assigns(:profile).youtube_url).to eq "www.youtube.com/wtholt"
      end

      it 'should redirect to the profile index' do
        expect(response).to redirect_to :action => :index
      end
    end

    context 'with bad data' do
      before(:each) do
        patch :update, id: profile,
          profile: FactoryGirl.attributes_for(:profile,
          name: "",
          position: "",
          biography: "",
          facebook_url: "",
          instagram_url: "",
          twitter_url: "",
          youtube_url: ""
        )
      end

      it 'should not update the profile' do
        expect(response).to render_template :edit
      end
    end

    context 'with bad data for name' do
      before(:each) do
        patch :update, id: profile,
          profile: FactoryGirl.attributes_for(:profile,
          name: "",
          position: "test",
          biography: "test",
          facebook_url: "test",
          instagram_url: "test",
          twitter_url: "test",
          youtube_url: "test"
        )
      end

      it 'should not update the profile' do
        expect(response).to render_template :edit
      end
    end

    context 'with bad data for position' do
      before(:each) do
        patch :update, id: profile,
          profile: FactoryGirl.attributes_for(:profile,
          name: "test",
          position: "",
          biography: "test",
          facebook_url: "test",
          instagram_url: "test",
          twitter_url: "test",
          youtube_url: "test"
        )
      end

      it 'should not update the profile' do
        expect(response).to render_template :edit
      end
    end

    context 'with bad data for biography' do
      before(:each) do
        patch :update, id: profile,
          profile: FactoryGirl.attributes_for(:profile,
          name: "test",
          position: "test",
          biography: "",
          facebook_url: "test",
          instagram_url: "test",
          twitter_url: "test",
          youtube_url: "test"
        )
      end

      it 'should not update the profile' do
        expect(response).to render_template :edit
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
