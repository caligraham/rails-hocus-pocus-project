class ApplicationController < ActionController::Base
    include ApplicationHelper

    private

    def redirect_if_not_logged_in
        redirect_to '/login' if !logged_in?
    end

    def redirect_if_logged_in
        redirect_to user_path(current_user) if logged_in?
    end

    def find_spellbook
        @spellbook = Spellbook.find(params[:id])
    end

    def find_spell
        @spell = Spell.find(params[:id])
    end

end
