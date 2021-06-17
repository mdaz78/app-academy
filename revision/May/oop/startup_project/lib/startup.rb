require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.keys.include?(title)
  end

  def >(startup)
    self.funding > startup.funding
  end

  def hire(employee_name, title)
    if valid_title?(title)
      employee = Employee.new(employee_name, title)
      @employees << employee
    else
      raise "Invalid title"
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    salary = salaries[employee.title]
    if (funding >= salary)
      employee.pay(salary)
      @funding -= salary
    else
      raise "Not enough funding"
    end
  end

  def payday
    @employees.each do |employee|
      pay_employee(employee)
    end
  end

  def average_salary
    total_employees = @employees.length
    total_salaries = @employees.inject(0) do |total, employee|
      total += salaries[employee.title]
    end

    total_salaries / (total_employees * 1.0)
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup)
    @funding += startup.funding
    @employees = [*@employees, *startup.employees]

    startup.salaries.each do |title, salary|
      unless self.salaries.has_key?(title)
        self.salaries[title] = salary
      end
    end

    startup.close
  end
end
