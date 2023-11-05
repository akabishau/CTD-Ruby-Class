class PagesController < ApplicationController

    def index
        @pages = Page.all
        render :index
    end

    def show
        @page = Page.find(params[:id])
        render :show
    end

    def edit
        @page = Page.find(params[:id])
        render :edit
    end

    # get new form
    def new
        @page = Page.new
        render :new
    end

    # post submit form with values available in params object
    def create
        @page = Page.new(page_params)
        @page.save
        redirect_to @page # browser will request page template view
    end

    

    def update
        @page = Page.find(params[:id])
        @page.update(page_params)
        redirect_to @page
    end


    private
        def page_params
            params.require(:page).permit(:title, :body, :slug)
        end
end
