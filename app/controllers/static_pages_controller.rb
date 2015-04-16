class StaticPagesController < ApplicationController
  before_filter :disable_nav, only: [:home]
  def home
    @questions = Question.all.order("created_at DESC").limit(5)
  end

  def about
  end

  def contact
  end

  def faq
  end

  def how_it_works
  end

  def privacy
  end

  def terms
  end
end
