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

# New stuff
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

# old stuff
# give joe a couple of plans
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

plancourse2 = PlanCourse.new
plancourse2.plan_id = plan1.id
plancourse2.course_id = course2.id
plancourse2.term = "Spring"
plancourse2.year = 2020
plancourse2.save!

plancourse1 = PlanCourse.new
plancourse1.plan_id = plan1.id
plancourse1.course_id = course1.id
plancourse1.term = "Fall"
plancourse1.year = 2020
plancourse1.save!

# New Stuff

requirement1 = Requirement.new
requirement1.name = "Req1"
requirement1.major_id = major1.id
requirement1.catalog_id = catalog1.id
requirement1.save!

category1 = Category.new
category1.name = "Cognates"
#category1.requirement_id = requirement1.id
category1.save!

category2 = Category.new
category2.name = "Core"
#category2.requirement_id = requirement1.id
category2.save!

category3 = Category.new
category3.name = "Electives"
#category3.requirement_id = requirement1.id
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

#alternate syntax
#Plan.create(user_id: user1.id, name: "Plan1")
#Plan.create(user_id: user1.id, name: "Plan2")