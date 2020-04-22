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
plan1.name = "Plan1"
plan1.user_id = user1.id
plan1.catalog_id = catalog1.id
plan1.major_id = major1.id
plan1.save!

plan2 = Plan.new
plan2.name = "Plan2"
plan2.user_id = user1.id
plan2.catalog_id = catalog1.id
plan2.major_id = major1.id
plan2.save!

course1 = Course.new
course1.name = "OOD"
course1.designator = "CS-1220"
course1.description = "Battleship!"
course1.credits = 3
course1.save!

course2 = Course.new
course2.name = "Java"
course2.designator = "CS-2210"
course2.description = "Trees Galore"
course2.credits = 3
course2.save!

course3 = Course.new
course3.name = "Web Apps"
course3.designator = "CS-3220"
course3.description = "Who won the Medal of Honor at Gettysburg!"
course3.credits = 3
course3.save!

course4 = Course.new
course4.name = "O\/S"
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
course11.credits = 3
course11.save!

course12 = Course.new
course12.name = "Software Engr II"
course12.designator = "CS-4820"
course12.description = "Love Senior Design!!"
course12.credits = 3
course12.save!

course13 = Course.new
course13.name = "DLD"
course13.designator = "EGCP-1010"
course13.description = "Cool course with AND, OR, and NOT"
course13.credits = 3
course13.save!

course14 = Course.new
course14.name = "ADLD"
course14.designator = "EGCP-3010"
course14.description = "I AM ROBOT"
course14.credits = 3
course14.save!

course15 = Course.new
course15.name = "Computer Arch"
course15.designator = "EGCP-3210"
course15.description = "Build the Pipeline!"
course15.credits = 3
course15.save!

course16 = Course.new
course16.name = "Networks"
course16.designator = "EGCP-4310"
course16.description = "Networking is very importing for finding a job!"
course16.credits = 3
course16.save!

course17 = Course.new
course17.name = "Chemistry"
course17.designator = "CHEM-1050"
course17.description = "Bedroom Course!"
course17.credits = 3
course17.save!

course18 = Course.new
course18.name = "Calc I"
course18.designator = "MATH-1710"
course18.description = "A weedout course."
course18.credits = 3
course18.save!

course19 = Course.new
course19.name = "Calc II"
course19.designator = "MATH-1720"
course19.description = "For the few who passed Calc I"
course19.credits = 3
course19.save!

course20 = Course.new
course20.name = "Physics II"
course20.designator = "PHYS-2120"
course20.description = "Why do we take this again?"
course20.credits = 3
course20.save!

plancourse5 = PlanCourse.new
plancourse5.plan_id = plan1.id
plancourse5.course_id = course6.id
plancourse5.term = "Spring"
plancourse5.year = 2020
plancourse5.save!

plancourse6 = PlanCourse.new
plancourse6.plan_id = plan1.id
plancourse6.course_id = course7.id
plancourse6.term = "Spring"
plancourse6.year = 2020
plancourse6.save!

plancourse7 = PlanCourse.new
plancourse7.plan_id = plan1.id
plancourse7.course_id = course7.id
plancourse7.term = "Spring"
plancourse7.year = 2020
plancourse7.save!

plancourse8 = PlanCourse.new
plancourse8.plan_id = plan1.id
plancourse8.course_id = course8.id
plancourse8.term = "Spring"
plancourse8.year = 2020
plancourse8.save!

plancourse1 = PlanCourse.new
plancourse1.plan_id = plan1.id
plancourse1.course_id = course1.id
plancourse1.term = "Fall"
plancourse1.year = 2020
plancourse1.save!

plancourse2 = PlanCourse.new
plancourse2.plan_id = plan1.id
plancourse2.course_id = course2.id
plancourse2.term = "Fall"
plancourse2.year = 2020
plancourse2.save!

plancourse3 = PlanCourse.new
plancourse3.plan_id = plan1.id
plancourse3.course_id = course3.id
plancourse3.term = "Fall"
plancourse3.year = 2020
plancourse3.save!

plancourse4 = PlanCourse.new
plancourse4.plan_id = plan1.id
plancourse4.course_id = course4.id
plancourse4.term = "Fall"
plancourse4.year = 2020
plancourse4.save!

plancourse9 = PlanCourse.new
plancourse9.plan_id = plan1.id
plancourse9.course_id = course5.id
plancourse9.term = "Fall"
plancourse9.year = 2020
plancourse9.save!

# We aren't using requirements
requirement1 = Requirement.new
requirement1.name = "Req1"
requirement1.major_id = major1.id
requirement1.catalog_id = catalog1.id
requirement1.save!

category1 = Category.new
category1.name = "Cognates"
category1.save!

category2 = Category.new
category2.name = "Core"
category2.save!

category3 = Category.new
category3.name = "Electives"
category3.save!

coursecatalog1 = CourseCatalog.new
coursecatalog1.course_id = course1.id
coursecatalog1.catalog_id = catalog1.id
coursecatalog1.save!

coursecatalog2 = CourseCatalog.new
coursecatalog2.course_id = course2.id
coursecatalog2.catalog_id = catalog1.id
coursecatalog2.save!

coursecategory1 = CourseCategory.new
coursecategory1.course_id = course1.id
coursecategory1.category_id = category1.id
coursecategory1.save!

CourseCatalog.create(course_id: course2.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course3.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course4.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course5.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course6.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course7.id, catalog_id: catalog1.id)
CourseCatalog.create(course_id: course8.id, catalog_id: catalog1.id)