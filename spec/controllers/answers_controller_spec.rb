# require 'rails_helper'
# # 
# RSpec.describe AnswersController, type: :controller do
#     describe "POST #create" do
#         let(:question){ create :question }
#         context 'with valid attributes' do
#             it 'saves the new answer in the database' do
#                 expect do
#                   post :create, params: { answer: attributes_for(:answer), question_id: question, format: :js }
#                 end.to change(question.answers, :count).by(1)
#                 # 
#             end
#             # 
#             it 'redirects to question show view' do
#                 # expect { post :create, answer: attributes_for(:answer) }.to change(answer, :count).by(1)
#                  #expect { post :create, params: {answer: attributes_for}}.to change(answer, :count).by(1)
#                 post :create, params: { answer: attributes_for(:answer), question_id: question, format: :js }
#                 # post :create, answer: attributes_for(:answer), question_id: question, format: :js
#                 expect(response).to redirect_to question_path(assigns(:question))
#             end
#             # 
#         end
#         context 'with invalid attributes' do
#             it 'does not save the answer' do
#                 expect do
#                     post :create, params: { answer: attributes_for(:invalid_answer), question_id: question, format: :js }
#                 end.to_not change(Answer, :count)
#             end
#       # 
#             it 'redirects to question show view' do
#                 # expect { post :create, answer: attributes_for(:answer) }.to change(answer, :count).by(1)
#                  #expect { post :create, params: {answer: attributes_for}}.to change(answer, :count).by(1)
#                 post :create, params: { answer: attributes_for(:invalid_answer), question_id: question, format: :js }
#                 expect(response).to redirect_to question_path(assigns(:question))
#             end
#         end
#     end
#     describe 'PATCH #update' do
#       let(:question){ create :question }
#       let(:answer){ create(:answer, question: question) }
#   # 
#       it 'assings the requested answer to @answer' do
#         patch :update, params: { id: answer.id, question_id: question.id, answer: attributes_for(:answer), format: :js }
#         expect(assigns(:answer)).to eq answer
#       end
#   # 
#       it 'assigns th question' do
#         patch :update, params: { id: answer.id, question_id: question.id, answer: attributes_for(:answer), format: :js }
#         expect(assigns(:question)).to eq question
#       end
#   # 
#       it 'changes answer attributes' do
#         patch :update, params: { id: answer.id, question_id: question.id, answer: { body: 'new body'}, format: :js }
#         answer.reload
#         expect(answer.body).to eq 'new body'
#       end
#   # 
#       it 'render update template' do
#         patch :update, params: { id: answer.id, question_id: question.id, answer: attributes_for(:answer), format: :js }
#         expect(response).to render_template :update
#       end
#     end
# end

require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let!(:question) { create :question }
  let(:user) { create :user }
  
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new answer in the database' do
        expect do
            post :create, params: { answer: attributes_for(:answer), question_id: question[:id], user_id: user[:id], format: :js }
        end.to change(question.answers, :count).by(1)
      end

      it 'render nothing' do
        post :create, params: {answer: attributes_for(:answer), question_id: question, format: :js}
        expect(response.body).to be_blank
      end
    end

    context 'with invalid attributes' do
      it 'does not save the question' do
        expect { post :create, params: {answer: attributes_for(:invalid_answer), question_id: question, format: :js }}.to_not change(Answer, :count)
      end

      it 'render crate template' do
        post :create, params: {answer: attributes_for(:invalid_answer), question_id: question, format: :js}
        expect(response).to render_template :create
      end
    end
  end

  describe 'PATCH #update' do
    let(:answer) { create(:answer, question: question) }

    it 'assings the requested answer to @answer' do
      patch :update, params: {id: answer, question_id: question, answer: attributes_for(:answer), format: :js}
      expect(assigns(:answer)).to eq answer
    end

    it 'assigns th question' do
      patch :update, params: {id: answer, question_id: question, answer: attributes_for(:answer), format: :js}
      expect(assigns(:question)).to eq question
    end

    it 'changes answer attributes' do
      patch :update, params: {id: answer, question_id: question, answer: { body: 'new body'}, format: :js}
      answer.reload
      expect(answer.body).to eq 'new body'
    end

    it 'render update template' do
      patch :update, params: {id: answer, question_id: question, answer: attributes_for(:answer), format: :js}
      expect(response).to render_template :update
    end
  end
end
