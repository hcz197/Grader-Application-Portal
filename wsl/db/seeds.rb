# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'httparty'
require 'byebug'

def parse_schedule(meetings)
    meetings_schedule = "";

    if (meetings["monday"])
        meetings_schedule += "M";
    end

    if (meetings["tuesday"])
        meetings_schedule += "T";
    end

    if (meetings["wednesday"])
        meetings_schedule += "W";
    end

    if (meetings["thursday"])
        meetings_schedule += "R";
    end

    if (meetings["friday"])
        meetings_schedule += "F";
    end

    if (meetings["saturday"])
        meetings_schedule += "Sa";
    end

    if (meetings["sunday"])
        meetings_schedule += "Su";
    end

    return meetings_schedule;
end

def find_primary_instructor(instructors)
    primary_instructor = "";

    instructors.each do |i|
        if (i["role"] == "PI")
            primary_instructor = i["displayName"];
        end
    end

    return primary_instructor;
end

def scraper()
    url = "https://content.osu.edu/v2/classes/search?q=CSE&p=1&term=1214&campus=col&subject=cse";
    raw_page = HTTParty.get(url);
    parsed_page = raw_page.parsed_response;

    #Hash of data from HTTParty response
    data = parsed_page["data"];

    #Array of hashes containing course and section data
    courses = data["courses"];

    #Array of data to add ot the database
    db_courses = Array.new;
    elm = {"course_num" => 0, "course_name" => "", "section_num" => 0, "days" => 0,
        "start_time" => "", "end_time" => "", "waitlist" => 0, "enroll" => 0,
    "instructor" => ""};

    #Loop thru course info
    courses.each do |item|

        course = item["course"];
        sections = item["sections"];
        i = 0;

        sections.each do |sec|
            meetings = sec["meetings"];

            elm = Hash.new;
            elm["course_num"] = course["catalogNumber"];
            elm["course_name"] = course["title"];
            elm["section_num"] = sec["section"];
            elm["days"] = parse_schedule(meetings[0]);
            elm["start_time"] = meetings[0]["startTime"];
            elm["end_time"] = meetings[0]["endTime"];
            elm["enroll"] = sec["enrollmentTotal"];
            elm["waitlist"] = sec["waitlistTotal"];
            elm["instructor"] = find_primary_instructor(meetings[0]["instructors"]);

            db_courses << elm;
        end
    end

    return db_courses;
end

db_courses = scraper;

# Reset known courses and users in the database
Course.delete_all
User.delete_all   
    
# Loop through courses, and insert courses and users into the db accordingly
i = 0;
for course in db_courses

    # Split instructor name into fname and lname
    instr_name  = course['instructor'].split(" ", 2);
    first = instr_name[0];
    last = instr_name[1];

    # Check if instructor has been inserted into db yet
    instructor = User.find_by(fname:first,lname:last);

    if (instructor == nil)
        # Insert instructor into db as a User
        instructor = User.create(fname: first, lname: last, email:"ph" + i.to_s + "@gmail.com", password:"placeholder", password_confirmation:"placeholder", user_type: 2);
        instructor.save!
        i = i + 1;
    end

    # Insert course into db as a Course
    Course.create(coursenum:course['course_num'],sectionnum: course['section_num'], coursename:course['course_name'],days:course['days'],starttime:course['start_time'],endtime:course['end_time'],enrolled:course['enroll'],waitlist:course['waitlist'],user_id:instructor.id);      
end