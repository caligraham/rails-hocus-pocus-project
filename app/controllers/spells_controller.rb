class SpellsController < ApplicationController
    
    before_action :redirect_if_not_logged_in
    #before_action :current_user, only: [:edit, :update, :destroy]
    #before_action :redirect_if_not_spellbook_owner, only: [:destroy, :edit, :update]

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
            @spell.build_spellbook
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
        if @spell.valid? 
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

    def redirect_if_not_spellbook_owner
        find_spell
        find_spellbook
        return redirect_to spells_path unless @spellbook
        redirect_to spells_path unless current_user.id == @spellbook.user_id
    end

    def find_spellbook
        @spellbook = Spellbook.find_by_id(params[:id])
    end

    def find_spell
        @spell = Spell.find_by_id(params[:id])
    end
end