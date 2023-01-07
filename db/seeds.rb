school_1 = School.create(name: "eldoki school")
school_2 = School.create(name: "mohamed school")

school_1.students.create(name: "ahmed" , order: 1)
school_2.students.create(name: "ali" , order: 1)

