class Order < ActiveRecord::Base
  attr_accessible :name, :state

  before_create :bug_callback, :if => :check_method

  state_machine :state, :initial => :new do
    event :complite do
      transition :new => :complited
    end
  end

  private

  def check_method
    true
  end

  def bug_callback
    complite
  end
end
