class Car
  attr_accessor :current_rpm

  #public

  def initialize
    @current_rpm = 0
  end

  def start_engine
    start_engine! if engine_stopped?
  end

  #private

  def engine_stopped?
    self.current_rpm.zero?
  end

  def start_engine!
    self.current_rpm = 700
  end

end
