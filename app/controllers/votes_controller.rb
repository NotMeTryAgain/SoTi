class VotesController < ApplicationController
  before_action :before_vote

  def upvote
    @this_vote.upvote = true
    @this_vote.save
    render json: { uvTotal: @this_vote.review.upvote_total, dvTotal: @this_vote.review.downvote_total }
  end

  def downvote
    @this_vote.upvote = false
    @this_vote.save
    render json: { uvTotal: @this_vote.review.upvote_total, dvTotal: @this_vote.review.downvote_total }
  end

  def unvote
    @this_vote.destroy
    flash[:notice] = "Your vote has been removed"
    render json: { uvTotal: @this_vote.review.upvote_total, dvTotal: @this_vote.review.downvote_total }
  end

  def before_vote
    @review = Review.find(params[:review_id])
    @this_vote = Vote.find_or_initialize_by(review: @review, user: current_user)
  end
end
