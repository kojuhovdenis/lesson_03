
#Класс поезд
class Train
  attr_reader :number
  attr_reader :type
  attr_reader :amount_vagon
  attr_reader :speed
  attr_reader :current_route
  attr_reader :current_station

  def initialize(number, type, amount_vagon = 1)
    @number = number
    @type = type
    @amount_vagon = amount_vagon
    @speed = 0
    @current_index_middle_station = nil
    @current_station = nil
    @current_route = nil
  end

  def up_speed
    @speed += 10
  end

  def down_speed
    if speed > 0 then
      @speed -= 10
    end
  end

  def current_speed
    puts "Current speed train №#{@number}: #{@speed} km/h"
  end

  def show_amount_vagon
    puts "Amount vagon of train №#{@number}: #{@amount_vagon} piece"
  end

  def add_vagon
    if @speed > 0 then
      puts "You can't add or deleted a wagon until the train speed is greater than zero"
      return
    end

    @amount_vagon += 1
  end

  def del_vagon
    if @speed > 0 then
      puts "You can't add or deleted a wagon until the train speed is greater than zero"
      return
    end
    if @amount_vagon == 0 then
      puts "Vagons are no more"
      return
    end

    @amount_vagon -= 1
  end

  def set_route(new_route)
    @current_route = new_route
    @current_station = new_route.start_station
    @current_index_middle_station = -1
  end

  def get_next_middle_station(ref_current_route)

    # ref_current_route.middle_stations.last
    if @current_index_middle_station > ref_current_route.middle_stations.count - 1 then
      return ref_current_route.finish_station
    end

    return ref_current_route.middle_stations[@current_index_middle_station+1]

  end

  def get_prev_middle_station(ref_current_route)

    if @current_index_middle_station < 0 then
      return ref_current_route.start_station
    end

    return ref_current_route.middle_stations[@current_index_middle_station-1]

  end

  def get_next_station

    result_station = @current_station

    if @current_station == @current_route.finish_station then
      puts "достигнута конечная станция"
    else
      puts "смотрим следующую станцию из middle или finish"
      if @current_route.middle_stations.empty? then
        result_station = @current_route.finish_station
      else
        result_station = get_next_middle_station(@current_route)
      end
    end

    return result_station

  end

  def get_prev_station

    result_station = @current_station

    if @current_station == @current_route.start_station then
      puts "достигнута начальная станция"
    else
      puts "смотрим предыдущую станцию из middle или start"
      if @current_route.middle_stations.empty? then
        result_station = @current_route.start_station
      else
        result_station = get_prev_middle_station(@current_route)
      end
    end

    return result_station

  end

  def set_next_station

    if @current_route == nil then
      puts "The route is not set"
      return
    end
    @current_station = get_next_station
    @current_index_middle_station += 1

  end

  def set_prev_station

    if @current_route == nil then
      puts "The route is not set"
      return
    end
    @current_station = get_prev_station
    @current_index_middle_station -= 1

  end
end

