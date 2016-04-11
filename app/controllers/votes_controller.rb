class VotesController < ApplicationController

  before_action :before_vote

  def upvote
    # check if already voted
    # check if changing vote
    @this_vote.upvote = true
    @this_vote.save
    redirect_to post_path(@review.post)
  end

  def downvote
    # check if already voted
    # check if changing vote
    @this_vote.upvote = false
    @this_vote.save
    redirect_to post_path(@review.post)
  end

  def before_vote
    @review = Review.find(params[:review_id])
    @this_vote = Vote.find_or_initialize_by(review: @review, user: current_user)
  end
end
