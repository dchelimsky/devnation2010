# describe DirectDeposit do
#   it ...
# end
# 
# describe Mail do
#   it ...
# end
# 
# describe Hold do
#   it ...
# end

class Payable; def pay; end; end
class Direct < Payable; end
class Salary < Payable; end

class Employee
  def initialize(*args)
    @args = args
  end
  
  def pay
    @args.each {|a| a.pay}
  end
end

describe Employee do
  it "delegates pay() to Salary" do
    pay_classification = Salary.new
    employee = Employee.new(pay_classification)

    pay_classification.should_receive(:pay)

    employee.pay
  end

  it "delegates pay() to Hourly"
  it "delegates pay() to Commission"
end

describe Employee do
  it "delegates pay() to Direct" do
    pay_classification = Salary.new
    payment_strategy = Direct.new
    employee = Employee.new(pay_classification, payment_strategy)

    payment_strategy.should_receive(:pay)

    employee.pay
  end

  it "delegates pay() to Mail"
  it "delegates pay() to Hold"
end


describe Employee do
  let(:pay_classification) { double("pay_classification").as_null_object }
  let(:payment_strategy)   { double("payment_strategy").as_null_object }
  let(:employee) do
    Employee.new(pay_classification, payment_strategy)
  end
  
  it "delegates pay() to payment strategy" do
    payment_strategy.should_receive(:pay)
    employee.pay
  end
  
  it "delegates pay() to calculation strategy" do
    pay_classification.should_receive(:pay)
    employee.pay
  end
end
