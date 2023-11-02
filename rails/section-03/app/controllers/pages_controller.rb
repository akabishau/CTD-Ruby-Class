class PagesController < ApplicationController

    def index
        @pages = Page.all
        render :index
    end

    def show
        @page = Page.find(params[:id])
        render :show
    end
end
