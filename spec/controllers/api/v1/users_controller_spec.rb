require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe Api::V1::UsersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Api::V1::User. As you add validations to Api::V1::User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
     {email: 'test@test.org', password: 'test123456'} }

  let(:invalid_attributes) {
    {email: 'test', password: 'test123456'} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Api::V1::UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    let(:user) { User.create! valid_attributes }

    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let(:user) { User.create! valid_attributes }
    it "returns a success response" do
      get :show, params: {id: user.to_param}, session: valid_session
      expect(response).to be_successful
    end
    it 'returns user' do
      get :show, params: {id: user.to_param}, session: valid_session
      json_response = JSON.parse(self.response.body)
      expect(user.email).to eq json_response['email']
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: {user: valid_attributes}, session: valid_session
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new user" do

        post :create, params: {user: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        # expect(response.location).to eq(api_v1_users_url(User.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new user" do

        post :create, params: {user: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "PUT #update" do
    let(:user) { User.create! valid_attributes }
    context "with new valid params" do
      let(:new_attributes) {
        {email: 'test@test.org', password: 'newpass123'} }

      it "updates the requested user" do
        put :update, params: {id: user.to_param, user: new_attributes}, session: valid_session
        user.reload
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end

      it "renders a JSON response with the user" do
        put :update, params: {id: user.to_param, user: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the user" do
        put :update, params: {id: user.to_param, user: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "DELETE #destroy" do
    let(:user) { User.create! valid_attributes }
    xit "destroys the requested user" do
      expect {
        delete :destroy, params: {id: user.to_param}, session: valid_session
      }.to change(User, :count).by(-1)
    end
  end

end