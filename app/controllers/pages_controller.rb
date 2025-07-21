class PagesController < ApplicationController
  def homepage
    render "homepage"
  end
  def setter
    render "setter"
  end
  def getter
    render "getter"
  end
  def deleter
    render "deleter"
  end
  def updater
    render "updater"
  end
end
