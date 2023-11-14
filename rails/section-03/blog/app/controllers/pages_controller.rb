class PagesController < ApplicationController

    # "only" option is available as well
    before_action :set_page, except: [:index, :new, :create]

    def index
        @pages = Page.all
        render :index
    end

    # renders view with the same name by default
    def show
    end

    def edit
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
        @page.update(page_params)
        redirect_to @page
    end

    def destroy
        @page.destroy
        redirect_to pages_path
    end

    private
        def page_params
            params.require(:page).permit(:title, :body, :slug)
        end

        def set_page
            @page = Page.find(params[:id])
        end
end
