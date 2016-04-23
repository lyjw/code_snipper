class SnippetsController < ApplicationController

  def index
    @kinds = Kind.all
    @snippets = Snippet.all
  end

  def new
    @snippet = Snippet.new
  end

  def create
    snippet_params = params.require(:snippet).permit([:kind_id, :title, :work])
    @snippet = Snippet.new snippet_params

    if @snippet.language != "Markdown"
      @snippet.work = "```#{@snippet.language}\n" + @snippet.work + "\n```"
    end

    if @snippet.save
      redirect_to snippet_path(@snippet), notice: "Snippet created!"
    else
      flash[:alert] = 'Invalid. Snippet not created.'
      render :new
    end
  end

  def show
    @snippet = Snippet.find params[:id]
  end

  def edit
    @snippet = Snippet.find params[:id]
  end

  def update
    @snippet = Snippet.find params[:id]
    snippet_params = params.require(:snippet).permit([:kind_id, :title, :work])

    if @snippet.update snippet_params
      redirect_to snippet_path(@snippet), notice: "Updated!"
    else
      render :edit
    end

  end

end
