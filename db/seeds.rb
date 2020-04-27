# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.new
user1.login = "joe"
user1.email = "joe@cedarville.edu"
user1.password = "password"
user1.password_confirmation = "password"
user1.role = "Admin"
user1.save!

user2 = User.new
user2.login = "pete"
user2.email = "pete@cedarville.edu"
user2.password = "password"
user2.password_confirmation = "password"
user2.role = "Faculty"
user2.save!

user3 = User.new
user3.login = "steve"
user3.email = "steve@cedarville.edu"
user3.password = "password"
user3.password_confirmation = "password"
user3.role = "Student"
user3.save!

catalog1 = Catalog.new
catalog1.year = 2017
catalog1.save!

catalog2 = Catalog.new
catalog2.year = 2018
catalog2.save!

major1 = Major.new
major1.name = "Computer Engineering"
major1.save!

major2 = Major.new
major2.name = "Computer Science"
major2.save!

plan1 = Plan.new
plan1.name = "This Plan"
plan1.user_id = user1.id
plan1.catalog_id = catalog1.id
plan1.major_id = major1.id
plan1.save!

plan2 = Plan.new
plan2.name = "That Plan"
plan2.user_id = user1.id
plan2.catalog_id = catalog2.id
plan2.major_id = major2.id
plan2.save!

course0 = Course.new
course0.name = "C++ Programming"
course0.designator = "CS-1210"
course0.description = "Battleship!"
course0.credits = 2
course0.save!

course1 = Course.new
course1.name = "Object-Oriented Design w/ C++"
course1.designator = "CS-1220"
course1.description = "OOOOOD - A romantical term"
course1.credits = 3
course1.save!

course2 = Course.new
course2.name = "Data Structures Using Java"
course2.designator = "CS-2210"
course2.description = "Trees Galore"
course2.credits = 3
course2.save!

course3 = Course.new
course3.name = "Web Applications"
course3.designator = "CS-3220"
course3.description = "Who won the Medal of Honor at Gettysburg!"
course3.credits = 3
course3.save!

course4 = Course.new
course4.name = "Operating Systems"
course4.designator = "CS-3310"
course4.description = "Forget Windows; Let's do Linux!"
course4.credits = 3
course4.save!

course5 = Course.new
course5.name = "Software Security"
course5.designator = "CS-4330"
course5.description = "buffer overflow!"
course5.credits = 3
course5.save!

course6 = Course.new
course6.name = "Algorithms"
course6.designator = "CS-3410"
course6.description = "The heart of Computer Science"
course6.credits = 3
course6.save!

course7 = Course.new
course7.name = "Compiler"
course7.designator = "CS-3510"
course7.description = "The BEST! Way Cool!"
course7.credits = 3
course7.save!

course8 = Course.new
course8.name = "Database"
course8.designator = "CS-3610"
course8.description = "What's a left join?"
course8.credits = 3
course8.save!

course9 = Course.new
course9.name = "Cyber Ops"
course9.designator = "CS-4310"
course9.description = "Attack!"
course9.credits = 3
course9.save!

course10 = Course.new
course10.name = "Parallel Computing"
course10.designator = "CS-4410"
course10.description = "Impossible."
course10.credits = 3
course10.save!

course11 = Course.new
course11.name = "Software Engr I"
course11.designator = "CS-4810"
course11.description = "Love Senior Design!"
course11.credits = 4
course11.save!

course12 = Course.new
course12.name = "Software Engr II"
course12.designator = "CS-4820"
course12.description = "Love Senior Design!!"
course12.credits = 4
course12.save!

course13 = Course.new
course13.name = "Digital Logic Design"
course13.designator = "EGCP-1010"
course13.description = "Cool course with AND, OR, and NOT"
course13.credits = 3
course13.save!

course14 = Course.new
course14.name = "Advanced Digital Logic Design"
course14.designator = "EGCP-3010"
course14.description = "I AM ROBOT"
course14.credits = 3
course14.save!

course15 = Course.new
course15.name = "Computer Architecture"
course15.designator = "EGCP-3210"
course15.description = "Build the Pipeline!"
course15.credits = 3
course15.save!

course16 = Course.new
course16.name = "Computer Networks"
course16.designator = "EGCP-4310"
course16.description = "Networking is very importing for finding a job!"
course16.credits = 3
course16.save!

course17 = Course.new
course17.name = "Chemistry"
course17.designator = "CHEM-1050"
course17.description = "Bedroom Course!"
course17.credits = 3.5
course17.save!

course18 = Course.new
course18.name = "Calculus I"
course18.designator = "MATH-1710"
course18.description = "A weedout course."
course18.credits = 5
course18.save!

course19 = Course.new
course19.name = "Calculus II"
course19.designator = "MATH-1720"
course19.description = "For the few who passed Calc I"
course19.credits = 5
course19.save!

course20 = Course.new
course20.name = "Physics II"
course20.designator = "PHYS-2120"
course20.description = "Why do we take this again?"
course20.credits = 4
course20.save!

course21 = Course.new
course21.name = "SPIFO"
course21.designator = "BTGE-1720"
course21.description = "Introductory Bible Class"
course21.credits = 3
course21.save!

course22 = Course.new
course22.name = "Ethics"
course22.designator = "EGGN-3110"
course22.description = "Politicians need to take this course!"
course22.credits = 3
course22.save!

course23 = Course.new
course23.name = "Computer Graphics"
course23.designator = "CS-4710"
course23.description = "Just games"
course23.credits = 3
course23.save!

course24 = Course.new
course24.name = "Discrete Math w\/ Prob"
course24.designator = "MATH-2520"
course24.description = "We should always be discrete"
course24.credits = 3
course24.save!

course25 = Course.new
course25.name = "Linear Algebra"
course25.designator = "MATH-3610"
course25.description = "As opposed to non-linear algegra?"
course25.credits = 3
course25.save!

course26 = Course.new
course26.name = "Physics I"
course26.designator = "PHYS-2110"
course26.description = "velovity and MAGNITUDE?"
course26.credits = 3
course26.save!

course27 = Course.new
course27.name = "PACL"
course27.designator = "IDK-0000"
course27.description = "Most valuable class of your CU Career they said"
course27.credits = 3
course27.save!

# We aren't using requirements
requirement1 = Requirement.new
requirement1.name = "Req1"
requirement1.major_id = major1.id
requirement1.catalog_id = catalog1.id
requirement1.save!

category1 = Category.new
category1.name = "Core"
category1.save!

category2 = Category.new
category2.name = "Electives"
category2.save!

category3 = Category.new
category3.name = "Cognates"
category3.save!

PlanCourse.create(plan_id: plan1.id, course_id: course13.id, term: "Fall", year: 2017)
PlanCourse.create(plan_id: plan1.id, course_id: course17.id, term: "Fall", year: 2017)
PlanCourse.create(plan_id: plan1.id, course_id: course0.id, term: "Fall", year: 2017)
PlanCourse.create(plan_id: plan1.id, course_id: course18.id, term: "Fall", year: 2017)
PlanCourse.create(plan_id: plan1.id, course_id: course19.id, term: "Spring", year: 2018)
PlanCourse.create(plan_id: plan1.id, course_id: course1.id, term: "Spring", year: 2018)
PlanCourse.create(plan_id: plan1.id, course_id: course20.id, term: "Fall", year: 2018)
PlanCourse.create(plan_id: plan1.id, course_id: course4.id, term: "Fall", year: 2018)
PlanCourse.create(plan_id: plan1.id, course_id: course2.id, term: "Spring", year: 2019)
PlanCourse.create(plan_id: plan1.id, course_id: course15.id, term: "Spring", year: 2019)
PlanCourse.create(plan_id: plan1.id, course_id: course6.id, term: "Fall", year: 2019)
PlanCourse.create(plan_id: plan1.id, course_id: course3.id, term: "Spring", year: 2020)
PlanCourse.create(plan_id: plan1.id, course_id: course14.id, term: "Spring", year: 2020)
PlanCourse.create(plan_id: plan1.id, course_id: course16.id, term: "Fall", year: 2021)

# Computer Engineering Requirements
CourseCategory.create(course_id: course0.id, category_id: category1.id)
CourseCategory.create(course_id: course1.id, category_id: category1.id)
CourseCategory.create(course_id: course2.id, category_id: category1.id)
CourseCategory.create(course_id: course3.id, category_id: category2.id)
CourseCategory.create(course_id: course4.id, category_id: category1.id)
CourseCategory.create(course_id: course5.id, category_id: category2.id)
CourseCategory.create(course_id: course6.id, category_id: category1.id)
CourseCategory.create(course_id: course7.id, category_id: category2.id)
CourseCategory.create(course_id: course8.id, category_id: category2.id)
CourseCategory.create(course_id: course9.id, category_id: category2.id)
CourseCategory.create(course_id: course10.id, category_id: category2.id)
#CourseCategory.create(course_id: course11.id, category_id: category2.id)
#CourseCategory.create(course_id: course12.id, category_id: category2.id)
CourseCategory.create(course_id: course13.id, category_id: category3.id)
CourseCategory.create(course_id: course14.id, category_id: category1.id)
CourseCategory.create(course_id: course15.id, category_id: category1.id)
CourseCategory.create(course_id: course16.id, category_id: category1.id)
CourseCategory.create(course_id: course17.id, category_id: category3.id)
CourseCategory.create(course_id: course18.id, category_id: category3.id)
CourseCategory.create(course_id: course19.id, category_id: category3.id)
CourseCategory.create(course_id: course20.id, category_id: category3.id)

# 2017
CourseCatalog.create(course_id: course0.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course1.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course2.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course3.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course4.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course5.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course6.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course7.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course8.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course9.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course10.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course11.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course12.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course13.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course14.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course15.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course16.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course17.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course18.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course19.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course20.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course21.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course22.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course23.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course24.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course25.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course26.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course27.id, catalog_id: catalog1.id)

# 2018
CourseCatalog.create(course_id: course0.id, catalog_id: catalog2.id)
CourseCatalog.create(course_id: course1.id, catalog_id: catalog2.id)
CourseCatalog.create(course_id: course2.id, catalog_id: catalog2.id)
CourseCatalog.create(course_id: course3.id, catalog_id: catalog2.id)
CourseCatalog.create(course_id: course4.id, catalog_id: catalog2.id)
CourseCatalog.create(course_id: course5.id, catalog_id: catalog2.id)
CourseCatalog.create(course_id: course6.id, catalog_id: catalog2.id)
CourseCatalog.create(course_id: course7.id, catalog_id: catalog2.id)
CourseCatalog.create(course_id: course8.id, catalog_id: catalog2.id)
CourseCatalog.create(course_id: course9.id, catalog_id: catalog2.id)
CourseCatalog.create(course_id: course10.id, catalog_id: catalog2.id)
CourseCatalog.create(course_id: course11.id, catalog_id: catalog2.id)
CourseCatalog.create(course_id: course12.id, catalog_id: catalog2.id)
CourseCatalog.create(course_id: course13.id, catalog_id: catalog2.id)
CourseCatalog.create(course_id: course14.id, catalog_id: catalog2.id)
CourseCatalog.create(course_id: course15.id, catalog_id: catalog2.id)
CourseCatalog.create(course_id: course16.id, catalog_id: catalog2.id)
CourseCatalog.create(course_id: course17.id, catalog_id: catalog2.id)
CourseCatalog.create(course_id: course18.id, catalog_id: catalog2.id)
CourseCatalog.create(course_id: course19.id, catalog_id: catalog2.id)
CourseCatalog.create(course_id: course20.id, catalog_id: catalog2.id)
>>>>>>> 5aa99869b9b052a37007fd411469e1674aafddc5
