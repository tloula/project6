class Plan {
    constructor(catalog) {
        this.student = "";
        this.name = "";
        this.major = "";
        this.currYear = 0;
        this.currTerm = "";
        this.courses = [];
        this.catYear = 0;
        this.catalog = catalog;
        this.years = [];     // Is built later
    }

    addCourse(course) {
        this.courses.push(course);
    }

    addYear() {
        var lastYear;
        if (this.years.length == 0){ // Years are empty (empty plan)
            lastYear = 2020;
        } else {
            lastYear = this.years[this.years.length - 1].year;
        }
        this.years.push(new Year(String(parseInt(lastYear) + 1)));
        init();
    }

    removeYear() {
        removeYear = this.years.pop().year;

        // Delete courses in year from plan
        for (i = 0; i < this.courses.length; i++){

            var course = this.courses[i];
            var courseYear = course.year;
            if (course.term == "Spring" || course.term == "Summer") {
                courseYear = String(parseInt(course.year) - 1);
            }

            if(courseYear == removeYear){
                if (i == 0){
                    this.courses.shift();
                } else {
                    this.courses.splice(i, 1);
                }
                // Fix indexing since just removed a course
                if (i > 0){
                    i = i - 1;
                }
                // Mark course as not planned in accordian
                $.each(myCatalog.courses, function () {  // Iterate through each course in the catalog
                    if (course.id == this.id){
                        this.planned = false;
                    }
                });
            }
        }

        init();
    }

    hours() {
        var totalHours = 0;

        $.each(this.courses, function () {
            totalHours += Number(this.credits);
        });
        return totalHours;
    }

    convert() {

        // Convert from Gallagher Data to Trevor Data
        var catalog = this.catalog;
        $.each(this.courses, function (index, planCourse) {
            $.each(catalog.courses, function (index2, catCourse) {
                if (catCourse.id === planCourse.id) {
                    planCourse.description = catCourse.description;
                    planCourse.credits = catCourse.credits;
                    planCourse.name = catCourse.name;
                    return false;
                }
            });
        });


        // Reset Years Variable
        $.each(this.years, function () {          // Iterate through each year
            $.each(this.terms, function () {      // Iterate though each term
                this.courses = [];                  // Clear out all courses
            });
        });

        var plan = this;
        $.each(this.courses, function () {                // Iterate through each course in the plan

            // Save JSON course as JavaScript course object
            let course = new Course(this.id, this.name, this.description, this.credits, this.term, this.year);

            var year = this.year;
            if (this.term == "Spring" || this.term == "Summer") {
                year = String(parseInt(this.year) - 1);
            }

            var exists = false;
            $.each(plan.years, function () {            // Iterate through each year in the plan
                if (this.year == year) {              // Check if courses year is in plan
                    exists = true;
                    return false;
                }
            });

            if (!exists) {                           // If year does not exist in plan, add it
                plan.years.push(new Year(year));
            }

            $.each(plan.years, function () {          // Iterate though each year in years object
                if (this.year == year) {
                    this.terms[course.termId()].courses.push(course);
                }
            });
        });
    }

    build() {
        var html = "";
        for (var z = 0; z < this.years.length; z++) {                                         // Iterate through each year in the plan
            var year = this.years[z];

            html += '<div class="row">';

            for (var j = 0; j < 3; j++) {                                                     // Iterate through each of the three terms in a year
                var term = year.terms[j];

                html += '<div class="col-lg drop semester year' + String(z + 1) + '" id="' + term.term + year.year + '">';

                var modifiedYear = year.year;
                if (term.term == "Spring" || term.term == "Summer") {
                    modifiedYear = String(parseInt(modifiedYear) + 1);
                }

                html += '<strong>' + term.term + ' ' + modifiedYear + '</strong>';
                html += '<div class="hours text-right">Hours ' + term.hours() + '</div>';
                html += '<div class="courses">';
                html += '<table>';

                for (var k = 0; k < term.courses.length; k++) {                              // Iterate through each course in a term
                    var course = term.courses[k];

                    html += '<tr class="drag" id="' + course.id + '" title="' + course.description +
                        '"><td class="course-designator">' + course.id +
                        '</td><td class="course-name">' + course.name +
                        '</td></tr>';
                }
                html += '</table></div></div>';
            }
            html += '</div>';
        }
        document.getElementById("academicPlan").innerHTML = html;
        // Enable dropping of classes into plan, this only worked when placed here
        $('.drop').droppable( {
            drop: handleDropEvent
        });
        document.getElementById("totalHours").innerHTML = this.hours();

        // Initialize Tooltips
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })

        document.getElementById("studentName").innerHTML = this.student;
        document.getElementById("studentMajor").innerHTML = this.major;
        document.getElementById("studentCatalog").innerHTML = this.catYear;
    }

    evaluate(catalog){                             // Mark courses as planned if on the plan
        $.each(this.courses, function () {  // Iterate through each course in the plan
            var planCourse = this;
            $.each(catalog.courses, function () {  // Iterate through each course in the catalog
                if (planCourse.id == this.id){
                    this.planned = true;
                }
            });
        });
    }
}

class Course {
    constructor(id, name, description, credits, term, year) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.credits = credits;
        this.term = term;
        this.year = year;
        this.planned = false;
    }

    termId() {
        if (this.term == "Fall") {
            return 0;
        } else if (this.term == "Spring") {
            return 1;
        } else {
            return 2;
        }
    }
}

class Year {
    constructor(year) {
        this.year = year;   // i.e. "2019"
        this.terms = [new Term("Fall"), new Term("Spring"), new Term("Summer")];
    }
}

class Term {
    constructor(term) {
        this.term = term;   // i.e. "FA"
        this.courses = [];
    }
    hours() {
        var totalHours = 0;

        $.each(this.courses, function () {
            totalHours += Number(this.credits);
        });
        return totalHours;
    }
}

class Categories {
    constructor(catalog) {
        this.cognates = [];
        this.core = [];
        this.electives = [];
        this.catalog = catalog;
    }

    build() {
        var catalog = this.catalog;
        $("#cognates").html('');
        $.each(this.cognates.courses, function () {
            var categoryId = this.id;
            var course;
            $.each(catalog.courses, function () {
                if (this.id == categoryId) {
                    course = this;
                    return false;
                }
            });
            if (course) {
                var cssClass = "unplannedCourse";
                if(course.planned == true){
                    cssClass = "plannedCourse";
                }
                $("#cognates").append("<li class='drag " + cssClass + "' id='" + this.id + "'>" + this.id + " " + course.name + "</li>");
            }
        });
        $('.drag').draggable( {
            appendTo: "body",
            helper: "clone"
       });
        $("#core").html('');
        $.each(this.core.courses, function () {
            var categoryId = this.id;
            var course;
            $.each(catalog.courses, function () {
                if (this.id == categoryId) {
                    course = this;
                    return false;
                }
            });
            if (course) {
                var cssClass = "unplannedCourse";
                if(course.planned == true){
                    cssClass = "plannedCourse";
                }
                $("#core").append("<li class='drag " + cssClass + "' id='" + this.id + "'>" + this.id + " " + course.name + "</li>");
            }
        });
        $('.drag').draggable( {
            appendTo: "body",
            helper: "clone"
       });
        $("#electives").html('');
        $.each(this.electives.courses, function () {
            var categoryId = this.id;
            var course;
            $.each(catalog.courses, function () {
                if (this.id == categoryId) {
                    course = this;
                    return false;
                }
            });
            if (course) {
                var cssClass = "unplannedCourse";
                if(course.planned == true){
                    cssClass = "plannedCourse";
                }
                $("#electives").append("<li class='drag " + cssClass + "' id='" + this.id + "'>" + this.id + " " + course.name + "</li>");
            }
        });
        $('.drag').draggable( {
            appendTo: "body",
            helper: "clone"
       });
    }
}

class Catalog {
    constructor() {
        this.year = 0;
        this.courses = [];
    }

    build() {
        $.each(this.courses, function () {
            $("#catalog").append(
                "<tr class='drag' id='" + this.id + "'>" +
                "<td>" + this.id + "</td>" +
                "<td>" + this.name + "</td>" +
                "<td>" + this.description + "</td>" +
                "<td>" + this.credits + "</td>" +
                "</tr>"
            );
        });
        $(document).ready(function () {
            $('#catalogTable').DataTable({
                "scrollY": "200px",
                "scrollCollapse": true,
                "paging": false,
                "scrollX": false,
                "searching": false
            });
        });
    }
}

$(document).ready(function () {
    $("#addYear").click(function() {
        myPlan.addYear();
    });
    
    $("#removeYear").click(function() {
        myPlan.removeYear();
    });
});

let myCatalog = new Catalog();
let myCategories = new Categories(myCatalog);
let myPlan = new Plan(myCatalog);

$(document).ready(function () {
    var pid = $("#planId").html();
    // Get JSON Stuff
    $.getJSON("http://localhost:3000/plans/" + pid + ".json", function (json) {
        const data = json;
        myPlan.student = data.plan.student;
        myPlan.name = data.plan.name;
        myPlan.major = data.plan.major;
        myPlan.currYear = data.plan.currYear;
        myPlan.currTerm = data.plan.currTerm;
        myPlan.courses = data.plan.courses;
        myPlan.catYear = data.plan.catYear;
        myCatalog.year = data.catalog.year;
        myCatalog.courses = data.catalog.courses;
        myCategories.cognates = data.categories.Cognates;
        myCategories.core = data.categories.Core;
        myCategories.electives = data.categories.Electives;
    });

    $(document).ajaxStop(function () {
        init();
    });
});

// Only build catalog once
var catalogBuilt = false;
$(document).ajaxStop(function () {
    if (catalogBuilt == false) {
        myCatalog.build();
        catalogBuilt = true;
    }
 });

 function init(){
    myPlan.convert();
    myPlan.build();
    myPlan.evaluate(myCatalog); // Pass catalog to check which courses are planned
    myCategories.build();
 }

 // ************************************************** DRAG N DROP ************************************************** //
 function handleDropEvent( event, ui ) {
    var draggable = ui.draggable.attr("id");
    var droppable = this.id;
    
    // Delete course from plan
    for (i = 0; i < myPlan.courses.length; i++){
        if(myPlan.courses[i].id == draggable){
            if (i == 0){
                myPlan.courses.shift();
            } else {
                myPlan.courses.splice(i, 1);
            }
            // Mark course as not planned in accordian
            $.each(myCatalog.courses, function () {  // Iterate through each course in the catalog
                if (draggable == this.id){
                    this.planned = false;
                }
            });
        }
    }

    // Add course to plan
    if (droppable != "remove-course"){
        var year = droppable.match(/\d+/)[0];
        var term = droppable.match(/[A-Za-z]+/)[0];

        // Correct year
        if (term == "Spring" || term == "Summer") {
            year = String(parseInt(year) + 1);
        }

        var newCourse;
        // Find course object from catalog
        $.each(myCatalog.courses, function () {
            if(this.id == draggable){
                // Javascript doesn't support copy constructor :<
                newCourse = new Course(this.id, this.name, this.description, this.credits, term, year, this.planned);
            }
        });

        // Add course object to plan
        myPlan.courses.push(newCourse);
    }

    // Rebuild everything
    init();
 }