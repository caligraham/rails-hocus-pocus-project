class ApplicationController < ActionController::Base
    include ApplicationHelper

    helper_method :current_user, :logged_in?

    def fallback
        redirect_to user_path
    end

    def authorized_to_edit?
        @spell.user == current_user
      end

    private

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to '/login' if !logged_in?
    end

    def redirect_if_logged_in
        redirect_to user_path(current_user) if logged_in?
    end


    def find_crystal_ball
        @crystal_ball = CrystalBall.find(params[:id])
    end


end
