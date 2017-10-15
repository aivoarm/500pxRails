
# Or wrap things up in your own class
class Course
include HTTParty

base_uri 'https://api.coursera.org/api/courses.v1'
format :json

# which can be :friends, :user or :public
# options[:query] can be things like since, since_id, count, etc.
def self.for(s)
  pp get(s)["element"]
end


end
