class CrystalBallsController < ApplicationController

   def index
    @crystal_balls = CrystalBall.all
   end

   def show
    find_crystal_ball
   end

   def new
    @crystal_ball = CrystalBall.new 
   end

   def create
      params[:crystall_ball][:user_id] = current_user.id
      @crystal_ball = CrystalBall.new(crystall_ball_params)
      if @crystall_ball.save
         redirect_to crystall_ball_path(@crystal_ball)
      else
         render :new
      end
   end

   def edit
      find_crystal_ball
   end

   def update
      find_crystal_ball
      @crystall_ball.update(crystall_ball_params)
      if @crystal_ball.valid?
         redirect_to crystall_ball_path
      else
         render :edit
      end
   end

private

def crystall_ball_params
   params.require(:crystall_ball).permit(:type, :sorcery_score, :size)
end

end
