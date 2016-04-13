class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review

    mail(
      to: review.post.user.email,
      subject: "New Review for #{review.post.webseries_name}"
    )
  end
end
