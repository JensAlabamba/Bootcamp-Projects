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
        return true if @salaries.keys.include?(title)
        false
    end

    def >(startup_2)
        return true if self.funding > startup_2.funding
        false
    end

    def hire(employee_name, title)
        if !valid_title?(title)
            raise_error
        else new_e = Employee.new(employee_name, title)
            @employees << new_e
        end
    end

    def size
        return @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if  salary < self.funding
            employee.pay(salary)
            @funding -= salary
        else
            raise_error
        end
    end

    def payday
        @employees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary
        sum = 0
        @employees.each do |emp|
            salary = @salaries[emp.title]
            sum += salary
        end
        return sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(another)
        @funding += another.funding
        @employees += another.employees
        another.salaries.each do |k, v|
            if !self.salaries.has_key?(k)
                self.salaries[k] = v 
            end
        end
        another.close
    end
end
