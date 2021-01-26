class SpellbooksController < ApplicationController

    def index
        @spellbooks = Spellbook.all 
    end

    def show
        @spellbook = Spellbook.find(params[:id])
    end

    def new
        @spellbook = Spellbook.new
        2.times { @spellbook.spells.build }
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
        @spellbook = Spellbook.find(params[:id])
    end

    def update
        @spellbook = Spellbook.find(params[:id])
        @spellbook.update(spellbook_params)
        if @spellbook.valid?
            redirect_to spellbooks_path
        else
            render :edit
        end
    end

    private

    def spellbook_params
        params.require(:spellbook).permit(:title, :category, :level, spells_attributes: [:name, :description, :level, :category])
    end

end
