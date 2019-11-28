class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |h, k| h[k] = [] }
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if @students.length < @student_capacity
      @students << student
      return true
    else
      return false
    end
  end

  def enrolled?(student)
    @students.include?(student)
  end

  def student_to_teacher_ratio
    number_of_students = @students.length
    number_of_teachers = @teachers.length

    number_of_students / number_of_teachers
  end

  def add_grade(student, grade)
    if enrolled?(student)
      @grades[student] << grade
      return true
    end

    return false
  end

  def num_grades(student)
    if enrolled?(student)
      return @grades[student].length
    end
    return nil
  end

  def average_grade(student)
    if enrolled?(student)
      return nil if @grades[student].length == 0
      sum_of_grades = @grades[student].sum
      return sum_of_grades / num_grades(student)
    end

    return nil;
  end
end
