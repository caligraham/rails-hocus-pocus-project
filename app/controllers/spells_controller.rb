class SpellsController < ApplicationController
    
    before_action :redirect_if_not_logged_in
    before_action :find_spell, only: [:show, :edit, :update, :destroy]
    before_action :find_spellbook, only: [:show, :edit, :destroy]

    #macro to run particular method before the action methods below execute. Useful because we're able to create validations as well as queries to populate a specific instance variable that we may use within that method. Decreases lines of code and keeps stuff dry. 

    def index
        if params[:spellbook_id] && @spellbook = Spellbook.find(params[:spellbook_id])
            @spells = @spellbook.spells
        else
            @spells = Spell.all
        end
    end

    def show
    end

    def new
        @spellbook = Spellbook.find(params[:spellbook_id])
        @spell = @spellbook.spells.build
        
    end

    def create
        @spell = current_user.spells.build(spell_params)
        @spell.spellbook_id = params[:spellbook_id]
        if @spell.save
            redirect_to spellbook_spell_path(params[:spellbook_id],@spell)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @spell.update(spell_params)
        if @spell.valid? 
            redirect_to spell_path(@spell)
        else
            render :edit
        end
    end

    def destroy
        if authorized_to_edit?
        @spell.destroy
        redirect_to spellbooks_path
        else 
        find_spell 
        end
    end
    
    private
    def spell_params
        params.require(:spell).permit(:name, :level, :description, :spellbook_id, spellbook_attributes: [:id, :user_id, :title, :category, :level])
    end

    def redirect_if_not_spellbook_owner
        find_spell
        find_spellbook
        return redirect_to spells_path unless @spellbook
        redirect_to spells_path unless current_user.id == @spellbook.user_id
    end

    def find_spellbook
        @spellbook = Spellbook.find_by_id(params[:spellbook_id])
    end

    def find_spell
        @spell = Spell.find_by_id(params[:id])
    end
end