class KindsController < ApplicationController

  def show
    @kind = Kind.find params[:id]
  end

end
