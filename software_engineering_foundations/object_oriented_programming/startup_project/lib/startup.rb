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
    titles = @salaries.keys
    titles.include?(title)
  end

  def >(startup)
    @funding > startup.funding
  end

  def hire(employee_name, title)
    unless valid_title?(title)
      raise "Invalid title Error"
    else
      employee = Employee.new(employee_name, title)
      @employees << employee
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    title = employee.title
    salary = @salaries[title]

    if @funding >= salary
      employee.pay(salary)
      @funding -= salary
    else
      raise "Insufficient funds to pay salary to employee"
    end
  end

  def payday
    @employees.each { |employee| self.pay_employee(employee) }
  end
end
