class SpellsController < ApplicationController
    def index
        if params[:spellbook_id] && @spellbook = Spellbook.find(params[:spellbook_id])
            @spells = @spellbook.spells
        else
            @spells = Spell.all
        end
    end

    def show
        @spell = Spell.find(params[:id])
    end

    def new
        if params[:spellbook_id] && @spellbook = Spellbook.find(params[:spellbook_id])
            @spell = Spell.new(spellbook_id: params[:spellbook_id])
        else
            @spell = Spell.new
            @spell.build_spellbook
        end
    end

    def create
        @spell = Spell.new(spell_params)
        if params[:book_id]
            @spellbook = Spellbook.find(params[:spellbook_id])
        end
        if @spell.save
            redirect_to spells_path
        else
            render :new
        end
    end

    def edit
        @spell = Spell.find(params[:id])
    end

    def update
        @spell = Spell.find(params[:id])
        @spell.update(spell_params)
        if @spell.valid?
            redirect_to spells_path
        else
            render :edit
        end
    end

    def destroy
        @spell = Spell.find(params[:id])
        @spell.destroy
        redirect_to spells_path
    end
    
    private
    def spell_params
        params.require(:spell).permit(:name, :category, :level, :description,  spellbook_attributes: [:title, :category, :level])
    end
end