class Order < ActiveRecord::Base
  attr_accessible :name, :state

  before_create :bug_callback, :if => :check_method

  state_machine :state, :initial => :new do
    event :complete do
      transition :new => :completed
    end
  end

  private

  def check_method
    true
  end

  def bug_callback
    complete
  end
end
