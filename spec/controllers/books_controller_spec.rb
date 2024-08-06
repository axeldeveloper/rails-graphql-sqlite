# # spec/controllers/users_controller_spec.rb
# require 'rails_helper'

# RSpec.describe UsersController, type: :controller do
#   let(:valid_attributes) { { name: 'John Doe', email: 'john@example.com', password: 'password', sign_in_count: 1, verified: true } }
#   let(:invalid_attributes) { { name: nil, email: nil } }
#   let(:user) { User.create!(valid_attributes) }

#   describe "GET #index" do
#     it "assigns @inactive_users, @active_users, and @most_active_users" do
#       get :index
#       expect(assigns(:inactive_users)).to eq(UsersListQuery.inactive)
#       expect(assigns(:active_users)).to eq(UsersListQuery.active)
#       expect(assigns(:most_active_users)).to eq(UsersListQuery.most_active)
#     end
#   end

#   describe "GET #show" do
#     it "assigns the requested user to @user" do
#       get :show, params: { id: user.id }
#       expect(assigns(:user)).to eq(user)
#     end
#   end

#   describe "POST #create" do
#     context "with valid attributes" do
#       it "creates a new User" do
#         expect {
#           post :create, params: { user: valid_attributes }
#         }.to change(User, :count).by(1)
#       end

#       it "redirects to the new user" do
#         post :create, params: { user: valid_attributes }
#         expect(response).to redirect_to(User.last)
#       end
#     end

#     context "with invalid attributes" do
#       it "does not create a new User" do
#         expect {
#           post :create, params: { user: invalid_attributes }
#         }.to change(User, :count).by(0)
#       end

#       it "re-renders the new template" do
#         post :create, params: { user: invalid_attributes }
#         expect(response).to render_template(:new)
#       end
#     end
#   end

#   describe "PATCH #update" do
#     context "with valid attributes" do
#       it "updates the requested user" do
#         patch :update, params: { id: user.id, user: { name: 'Jane Doe' } }
#         user.reload
#         expect(user.name).to eq('Jane Doe')
#       end

#       it "redirects to the updated user" do
#         patch :update, params: { id: user.id, user: valid_attributes }
#         expect(response).to redirect_to(user)
#       end
#     end

#     context "with invalid attributes" do
#       it "does not update the user" do
#         patch :update, params: { id: user.id, user: invalid_attributes }
#         user.reload
#         expect(user.name).to_not eq(nil)
#       end

#       it "re-renders the edit template" do
#         patch :update, params: { id: user.id, user: invalid_attributes }
#         expect(response).to render_template(:edit)
#       end
#     end
#   end

#   describe "DELETE #destroy" do
#     it "deletes the user" do
#       user
#       expect {
#         delete :destroy, params: { id: user.id }
#       }.to change(User, :count).by(-1)
#     end

#     it "redirects to the users list" do
#       delete :destroy, params: { id: user.id }
#       expect(response).to redirect_to(users_path)
#     end
#   end
# end
