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
        var lastYear = this.years[this.years.length - 1].year;
        this.years.push(new Year(String(parseInt(lastYear) + 1)));
        this.convert();
        this.build();
    }

    removeYear() {
        this.years.pop();
        this.convert();
        this.build();
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

                html += '<div class="col-lg semester year' + String(z + 1) + '">';

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

                    html += '<tr data-toggle="tooltip" data-placement="bottom" title="' + course.description +
                        '"><td class="course-designator">' + course.id +
                        '</td><td class="course-name">' + course.name +
                        '</td></tr>';
                }
                html += '</table></div></div>';
            }
            html += '</div>';
        }
        document.getElementById("academicPlan").innerHTML = html;
        document.getElementById("totalHours").innerHTML = this.hours();

        // Initialize Tooltips
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })

        document.getElementById("studentName").innerHTML = this.student;
        document.getElementById("studentMajor").innerHTML = this.major;
        document.getElementById("studentCatalog").innerHTML = this.catYear;
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
            var courseName;
            $.each(catalog.courses, function () {
                if (this.id == categoryId) {
                    courseName = this.name;
                    return false;
                }
            });
            if (courseName) {
                $("#cognates").append("<li>" + this.id + " " + courseName + "</li>");
            }
        });
        $("#courses").html('');
        $.each(this.core.courses, function () {
            var categoryId = this;
            var courseName;
            $.each(catalog.courses, function () {
                if (this.id == categoryId) {
                    courseName = this.name;
                    return false;
                }
            });
            if (courseName) {
                $("#core").append("<li>" + this + " " + courseName + "</li>");
            }
        });
        $("#electives").html('');
        $.each(this.electives.courses, function () {
            var categoryId = this;
            var courseName;
            $.each(catalog.courses, function () {
                if (this.id == categoryId) {
                    courseName = this.name;
                    return false;
                }
            });
            if (courseName) {
                $("#electives").append("<li>" + this + " " + courseName + "</li>");
            }
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
            $("#catalogTable").append(
                "<tr>" +
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
                "scrollX": false
            });
        });
    }
}

function addYear() {
    myPlan.addYear();
}

function removeYear() {
    myPlan.removeYear();
}

let myCatalog = new Catalog();
let myCategories = new Categories(myCatalog);
let myPlan = new Plan(myCatalog);

function updatePlan(pid){
    // Get JSON Stuff
    $.getJSON("http://localhost:3000/plans/" + pid + ".json", function (json) {
        const data = json;
        myCategories.cognates = data.categories.Cognates;
        myCategories.core = data.categories.Core;
        myCategories.electives = data.categories.Electives;
        myCategories.build();
        myPlan.student = data.plan.student;
        myPlan.name = data.plan.name;
        myPlan.major = data.plan.major;
        myPlan.currYear = data.plan.currYear;
        myPlan.currTerm = data.plan.currTerm;
        myPlan.courses = data.plan.courses;
        myPlan.catYear = data.plan.catYear;
        myCatalog.year = data.catalog.year;
        myCatalog.courses = data.catalog.courses;
    });

    $(document).ajaxStop(function () {
        myPlan.convert();
        myPlan.build();
        myCategories.build();
    });
}

// ******************** SELECT PLAN DROPDOWN METHODS ******************** //

function loadPlans() {
    $.getJSON("http://judah.cedarville.edu/~loula/Project4/getPlans.php", function (json) {  // Returns all plans
        const data = json;
        var list = "";
        $.each(json, function (id, name) {
            list += "<option value='" + id + "'>" + name + "</option>";
        });
        document.getElementById("plan").innerHTML = list;
    });
}

$(document).ready(function () {
    loadPlans();
    updatePlan(1);
});

var catalogBuilt = false;
$(this).ajaxStop(function () {
    if (catalogBuilt == false) {
        myCatalog.build();
        catalogBuilt = true;
    }
 });


$('select').on('change', function() {
    updatePlan(this.value);
  });

//END