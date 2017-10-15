class CoursesController < ApplicationController
  def index

  @out =  Course.get('https://api.coursera.org/api/courses.v1')['elements']

  end
end
