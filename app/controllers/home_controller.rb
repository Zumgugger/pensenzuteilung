class HomeController < ApplicationController
  before_action :authenticate_user!

  def overview
    @school = current_user.school
    @teachers = @school.teachers
    @subjects = @school.subjects
    @grades = @school.grades
    @school_classes = @school.school_classes
    @courses = Course.joins(:school_class).where(school_classes: { school_id: @school.id })
  end
end
