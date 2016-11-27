class IndexController < ApplicationController
  def index
    @lesson = Lesson.all
  end
end
