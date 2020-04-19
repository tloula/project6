#json.plan do
#    json.id @plan.id
#    json.courses @plan.plan_courses do |planCourse|
#        json.designator planCourse.course.designator
#        json.year planCourse.year
#        json.term planCourse.term
#    end
#end

#json.planList do
#    json.plans @plans do |plan|
#        json.id plan.id
#        json.name plan.name
#    end
#end

#json.courses do
#    json.courses @courses do |course|
#        json.designator course.designator
#        json.name course.name
#        json.credits course.credits
#    end
#end

# New Stuff
json.plan do
    json.id @plan.id
    json.student @current_user.login
    json.name @plan.name
    json.major @plan.major.name
    json.currYear 2020
    json.currTerm "Spring"
    json.courses @plan.plan_courses do |planCourse|
        json.id planCourse.course.designator
        json.year planCourse.year
        json.term planCourse.term
    end
    json.catYear @plan.catalog.year
end

json.catalog do
    json.year @plan.catalog.year
    json.courses @courseCatalog do |course|
        #json.set! course.course.designator do
            json.id course.course.designator
            json.name course.course.name
            json.description course.course.description
            json.credits course.course.credits
        #end
    end
end

#json.courses do
#    @plan.plan_courses.each{ |planCourse|
#        json.set! planCourse.course.designator, planCourse.course.name }
#end

json.categories do
    json.Core do
        json.courses @courseCategory do |course|
            if course.category.name == "Core"
                json.id course.course.designator
            end
        end
    end
    json.Electives do
        json.courses @courseCategory do |course|
            if course.category.name == "Electives"
                json.id course.course.designator
            end
        end
    end
    json.Cognates do
        json.courses @courseCategory do |course|
            if course.category.name == "Cognates"
                json.id course.course.designator
            end
        end
    end
end