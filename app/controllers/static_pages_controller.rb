class StaticPagesController < ApplicationController
  before_filter :disable_nav, only: [:home]
  def home
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
