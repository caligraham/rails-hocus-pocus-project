class SpellbooksController < ApplicationController
 
    before_action :redirect_if_not_logged_in
    
    def index
        @spellbooks = Spellbook.all 
    end

    def show
        find_spellbook
    end

    def new
        @spellbook = Spellbook.new
        2.times { @spellbook.spells.build }
    end

    def create
        params[:spellbook][:user_id] = current_user.id
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

    private

    


    def spellbook_params
        params.require(:spellbook).permit(:title, :category, :level, :user_id, spells_attributes: [:name, :description, :level, :category,])
    end

end
