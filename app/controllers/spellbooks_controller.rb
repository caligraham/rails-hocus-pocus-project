class SpellbooksController < ApplicationController
 
    before_action :redirect_if_not_logged_in, :current_user
    
    def index
        @spellbooks = Spellbook.all 
    end

    def show
        find_spellbook
    end

    def recent_spellbooks
        @spellbooks = Spellbook.newest_spellbooks
        render :index
    end

    def new
        @spellbook = Spellbook.new
    end

    def create
        @spellbook = Spellbook.new(spellbook_params)
        if @spellbook.save 
            redirect_to spellbook_path(@spellbook)
        else
            render :new
        end   
    end


    def edit
        find_spellbook
    end

    def update
        find_spellbook
        @spellbook.update(spellbook_params)
        if @spellbook.valid?
            redirect_to spellbooks_path
        else
            render :edit
        end
    end

    def destroy
        find_spellbook
        if current_user.id != @spellbook.user_id
            redirect_to spellbooks_path
        else 
            @spellbook.destroy 
            redirect_to spellbooks_path
        end
    end

    private

    


    def spellbook_params
        params.require(:spellbook).permit(:title, :category, :level)
    end

    def find_spellbook
        @spellbook = Spellbook.find(params[:id])
    end

end
