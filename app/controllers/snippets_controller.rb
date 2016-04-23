class SnippetsController < ApplicationController
  before_action :find_snippet, only: [:show, :edit, :update, :destroy]

  def index
    @kinds = Kind.all
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new snippet_params

    if @snippet.save
      redirect_to snippet_path(@snippet), notice: "Snippet created!"
    else
      @snippet.work = "" if @snippet.errors[:work]
      flash[:alert] = 'Invalid. Snippet not created.'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @snippet.update snippet_params
      redirect_to snippet_path(@snippet), notice: "Updated!"
    else
      render :edit
    end

  end

  private

  def find_snippet
    @snippet ||= Snippet.find params[:id]
  end

  def snippet_params
    @snippet_params = params.require(:snippet).permit([:kind_id, :title, :work])
  end

end
