require 'rails_helper'

RSpec.describe SnippetsController, type: :controller do

  let(:snippet) { Snippet.create(title: "Title", work: "def example_method end")}

  describe "#new" do

    before { get :new }

    it "renders the new template" do
      expect(response).to render_template(:new)
    end

    it "assigns a new Snippet to an instance variable" do
      expect(assigns(:snippet)).to be_a_new(Snippet)
    end

  end

  describe "#create" do

    context "with valid params" do

      def valid_request
        post :create, snippet: { title: "Ruby code", work: "def method end" }
      end

      it "adds a new Snippet record to the database" do
        expect { valid_request }.to change { Snippet.count }.by 1
      end

      it "redirect to the Snippet show page" do
        valid_request
        expect(response).to redirect_to snippet_path(Snippet.last)
      end

      it "sets a flash message" do
        valid_request
        expect(flash[:notice]).to be
      end
    end

    context "without valid params" do

      def invalid_request
        post :create, snippet: { title: "", work: "" }
      end

      it "does not add a new Snippet to the database" do
        expect { invalid_request }.to change { Snippet.count }.by 0
      end

      it "renders the new page" do
        invalid_request
        expect(response).to render_template(:new)
      end
    end

  end

  describe "#show" do

    before do
      get :show, id: snippet.id
    end

    it "renders the Snippet show template" do
      expect(response).to render_template(:show)
    end

    it "assigns a Snippet instance variable" do
      expect(assigns(:snippet)).to eq(snippet)
    end
  end

  describe "#edit" do

    let(:snippet) { Snippet.create(title: "Hello", work: "code snippet") }


    before { get :edit, id: snippet.id}


    it "renders the edit template" do
      expect(response).to render_template(:edit)
    end

    it "assigns a Snippet instance variable" do
      expect(assigns(:snippet)).to eq(snippet)
    end
  end

  describe "#update" do

    context "with valid params" do

      let(:new_valid_work) { "description" }

      before do
        patch :update, id: snippet.id, snippet: { work: new_valid_work }
      end

      it "adds a new Snippet record to the database" do
        expect(snippet.reload.work).to eq(new_valid_work)
      end

      it "redirect to the Snippet show page" do
        expect(snippet).to redirect_to(snippet_path(snippet))
      end
    end

    context "without valid params" do

      let(:new_invalid_title) { "" }

      before do
        patch :update, id: snippet.id, snippet: { work: new_invalid_title }
      end

      it "does not add a new Snippet to the database" do
        expect(snippet.title).to eq(snippet.reload.title)
      end

      it "renders the new page" do
        expect(response).to render_template(:edit)
      end
    end

  end

  # describe "#destroy"

end
