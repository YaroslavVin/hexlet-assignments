# frozen_string_literal: true

class Posts::ApplicationController < ApplicationController
  def resource_post
    @resource_post ||= Post.find(params[:post_id])
  end

  def resource_post_comment
    @resource_post_comment ||= resource_post.comments.find(params[:id])
  end
end
