class ApplicationController < ActionController::Base
    include ApplicationHelper

    def fallback
        redirect_to user_path
    end

    private

    def authorized_to_edit?
        @spell.users == current_user
      end

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

    def find_crystal_ball
        @crystal_ball = CrystalBall.find(params[:id])
    end


end
