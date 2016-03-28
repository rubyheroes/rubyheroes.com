class PagesController < ApplicationController
  def lets_encrypt
    render text: params[:id]
  end
end
