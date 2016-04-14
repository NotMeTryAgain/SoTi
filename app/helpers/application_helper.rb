module ApplicationHelper
  def webseries_video(url)
    @post.link = url
    render :partial => 'video', :locals => { :url => url }
  end
end
