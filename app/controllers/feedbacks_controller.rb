class FeedbacksController < ApplicationController
def index
  @feedbacks = Feedback.all
end

def new
  @feedback = Feedback.new
end

def create
  @feedback = Feedback.create(feedback_params)

  if @feedback.save
    redirect_to feedbacks_path
  else
    render :new
  end
end	

private
  
def feedback_params 
    params.require(:feedback).permit(:q1, :q2, :q3, :q4, :q5)
end
end
