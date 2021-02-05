class SpellsController < ApplicationController
    
    before_action :redirect_if_not_logged_in

    def index
        if params[:spellbook_id] && @spellbook = Spellbook.find(params[:spellbook_id])
            @spells = @spellbook.spells
        else
            @spells = Spell.all
        end
    end

    def show
        find_spell
    end

    def recent_spells
        @spells = Spell.newest_spells
        render :index
    end


    def new
        if params[:spellbook_id] && @spellbook = Spellbook.find(params[:spellbook_id])
            @spell = Spell.new(spellbook_id: params[:spellbook_id])
        else
            @spell = Spell.new
        end
    end

    def create
        @spell = current_user.spells.build(spell_params)
        if params[:spellbook_id]
            @spellbook = Spellbook.find(params[:spellbook_id])
        end
        if @spell.save
            redirect_to spells_path
        else
            render :new
        end
    end

    def edit
        find_spell
    end

    def update
        find_spell
        @spell.update(spell_params)
        if @spell.valid? && authorized_to_edit?
            redirect_to spells_path
        else
            render :edit
        end
    end

    def destroy
        find_spell
        if authorized_to_edit?
        @spell.destroy
        redirect_to spells_path
        else 
        find_spell 
        end
    end
    
    private
    def spell_params
        params.require(:spell).permit(:name, :level, :description, :spellbook_id, spellbook_attributes: [:user_id, :title, :category, :level])
    end
end