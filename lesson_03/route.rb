#Класс маршрут
class Route

  def initialize(start_station, finish_station)
    @start_station = start_station
    @finish_station = finish_station
    @middle_stations = []
  end

  attr_reader :start_station
  attr_reader :finish_station
  attr_reader :middle_stations

  def add_station(added_station)

    # @middle_stations.append(added_station)
    @middle_stations << added_station

  end

  def del_station(deleted_station)
    @middle_stations.delete(deleted_station)
  end

  def show_list_station

    puts "Список станций маршрута:"

    puts " - start: #{@start_station.station_name}"
    for index in (0..@middle_stations.count - 1)
      puts " - middle: #{@middle_stations[index].station_name}"
    end
    puts " - finish: #{@finish_station.station_name}"

  end
end