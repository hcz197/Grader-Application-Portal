require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  setup do
    @course = courses(:one)
  end

  test "visiting the index" do
    visit courses_url
    assert_selector "h1", text: "Courses"
  end

  test "creating a Course" do
    visit courses_url
    click_on "New Course"

    fill_in "Coursename", with: @course.coursename
    fill_in "Coursenum", with: @course.coursenum
    fill_in "Days", with: @course.days
    fill_in "Endtime", with: @course.endtime
    fill_in "Enrolled", with: @course.enrolled
    fill_in "Sectionnum", with: @course.sectionnum
    fill_in "Starttime", with: @course.starttime
    fill_in "Waitlist", with: @course.waitlist
    click_on "Create Course"

    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "updating a Course" do
    visit courses_url
    click_on "Edit", match: :first

    fill_in "Coursename", with: @course.coursename
    fill_in "Coursenum", with: @course.coursenum
    fill_in "Days", with: @course.days
    fill_in "Endtime", with: @course.endtime
    fill_in "Enrolled", with: @course.enrolled
    fill_in "Sectionnum", with: @course.sectionnum
    fill_in "Starttime", with: @course.starttime
    fill_in "Waitlist", with: @course.waitlist
    click_on "Update Course"

    assert_text "Course was successfully updated"
    click_on "Back"
  end

  test "destroying a Course" do
    visit courses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course was successfully destroyed"
  end
end
