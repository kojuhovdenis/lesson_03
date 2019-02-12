class Car
  #attr_accessor :current_rpm
  attr_reader :current_rpm

  #public

  def initialize
    @current_rpm = 0
  end

  def start_engine
    start_engine! if engine_stopped?
  end

  def engine_stopped?
    self.current_rpm.zero?
  end

  #private
  protected

  attr_writer :current_rpm

  #INITIAL_RPM = 700
  def initial_rpm
    700
  end

  def start_engine!
    self.current_rpm = initial_rpm
  end

end

class Truck < Car

  def loading
  end

  protected

  def initial_rpm
    500
  end

end

class SportCar < Car

  def start_engine
    puts "Click!!"
    #super() если есть аргументы
    super
    puts "Wroom!!"
  end

  protected

  def initial_rpm
    1000
  end

end
