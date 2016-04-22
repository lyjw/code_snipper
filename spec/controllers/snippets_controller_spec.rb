require 'rails_helper'

RSpec.describe SnippetsController, type: :controller do

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
      it "adds a new Snippet record to the database"
      it "redirect to the Snippet show page"
    end

    context "without valid params" do
      it "does not add a new Snippet to the database"
      it "renders the new page"
    end

  end

  describe "#show" do
    it "renders the Snippet show template"
    it "assigns a Snippet instance variable"
  end

  describe "#edit" do
    it "renders the edit template"
    
  end

  describe "#update" do

    context "with valid params" do
      it "adds a new Snippet record to the database"
      it "redirect to the Snippet show page"
    end

    context "without valid params" do
      it "does not add a new Snippet to the database"
      it "renders the new page"
    end

  end

  describe "#index"

  # describe "#destroy"


end
