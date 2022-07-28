json.extract! course, :id, :coursenum, :sectionnum, :coursename, :days, :starttime, :endtime, :enrolled, :waitlist, :created_at, :updated_at
json.url course_url(course, format: :json)
