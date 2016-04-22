class SnippetsController < ApplicationController

  def index
    @snippets = Snippet.all
  end

  def new
    @snippet = Snippet.new
  end

  def create
    snippet_params = params.require(:snippet).permit([:kind, :title, :work])
    @snippet = Snippet.new snippet_params

    if @snippet.save
      redirect_to snippet_path(@snippet), notice: "Snippet created!"
    else
      flash[:alert] = "Invalid. Snippet not created."
      render :new
    end
  end

  def show
    @snippet = Snippet.find params[:id]

    # @random = HTML.new.block_code(@snippet.work, ruby)


  end

  def edit

  end

end
