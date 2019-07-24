#проверка комментирования класса
class Station

  #dd
  def initialize(station_name)
    @station_name = station_name
    @list_train = []
  end

  attr_reader :station_name

  #Показать список поездов
  def show_list_train(train_type = 0)

    puts "Список поездов на станции #{@station_name}:"

    for index in (0..@list_train.count - 1)
      puts " - #{@list_train[index]}"
    end
  end

  #Принять поезд
  def take_train(new_train = "noname")
    @list_train.append(new_train)
    puts "Поезд #{new_train} прибыл на платформу"
  end

  #Отправить поезд
  def send_train(sender_train = "noname")
    @list_train.delete(sender_train)
    puts "Отправляется поезд #{sender_train}"
  end

end

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

#Create stations
st_SaintPetersburg = Station.new("Moscowsky vokzal (Saint-Petersburg)")
st_Leningradsky = Station.new("Leningradsky vokzal (Moscow)")
st_Rizhskiy = Station.new("Rizhskiy vokzal (Moscow)")
st_Kievskiy = Station.new("Kievskiy vokzal (Moscow)")
st_Mineralnae = Station.new("Mineralnae vody")
st_Pashkovka = Station.new("Pashkovka (Krasnodar)")
st_Krasnodar1 = Station.new("Krasnodar-1")
st_Adler = Station.new("Adler")

#Create route MSC-KRD
route_krd1 = Route.new(st_Rizhskiy, st_Adler)
route_krd1.add_station(st_Mineralnae)
route_krd1.add_station(st_Pashkovka)
route_krd1.add_station(st_Krasnodar1)
route_krd1.add_station(st_Adler)
route_krd1.del_station(st_Adler) #Для демонстрации удаления
#route_krd1.show_list_station

route_krd2 = Route.new(st_Kievskiy, st_Adler)
route_krd2.add_station(st_Krasnodar1)
#route_krd2.show_list_station

#Create route MSC-SBP
route_msc1 = Route.new(st_Leningradsky, st_SaintPetersburg)
#route_msc1.show_list_station

#Create train
train_Lastochka = Train.new(8980077, 1, 8)
train_Sapsan = Train.new(8777777, 1, 5)


#Сапсан
puts "Поезд №#{train_Sapsan.number}"
train_Sapsan.set_route(route_msc1)
puts train_Sapsan.current_route.show_list_station
puts " - текущая станция #{train_Sapsan.current_station.station_name}"
train_Sapsan.set_next_station
puts " - текущая станция #{train_Sapsan.current_station.station_name}"
train_Sapsan.set_next_station
puts " - текущая станция #{train_Sapsan.current_station.station_name}"
train_Sapsan.set_prev_station
puts " - текущая станция #{train_Sapsan.current_station.station_name}"
train_Sapsan.set_prev_station
puts " - текущая станция #{train_Sapsan.current_station.station_name}"


#Ласточка
puts "Поезд №#{train_Lastochka.number}"
train_Lastochka.set_route(route_krd1)
puts " - текущая станция #{train_Lastochka.current_station.station_name}"
puts train_Lastochka.current_route.show_list_station
puts " - текущая станция #{train_Lastochka.current_station.station_name}"
train_Lastochka.set_next_station
puts " - текущая станция #{train_Lastochka.current_station.station_name}"

puts " -------------------------- "

puts " - объявление, следующая станция #{train_Lastochka.get_next_station.station_name}"
puts " - объявление, следующая станция #{train_Lastochka.get_next_station.station_name}"
puts " - объявление, следующая станция #{train_Lastochka.get_next_station.station_name}"
puts " - объявление, следующая станция #{train_Lastochka.get_next_station.station_name}"
puts " - объявление, следующая станция #{train_Lastochka.get_next_station.station_name}"

train_Lastochka.set_next_station
puts " - поезд прибыл на станцию #{train_Lastochka.current_station.station_name}"


# my_train = Train.new(1,"pass",5)
# my_train.current_speed
# my_train.up_speed
# my_train.up_speed
# my_train.current_speed
# my_train.down_speed
# my_train.down_speed
# my_train.down_speed
# my_train.current_speed
#
# my_train.show_amount_vagon
# my_train.add_vagon #6
# my_train.show_amount_vagon
# my_train.del_vagon #5
# my_train.del_vagon #4
# my_train.del_vagon #3
# # my_train.del_vagon #2
# # my_train.del_vagon #1
# # my_train.del_vagon #0
# # my_train.del_vagon #-1


# st_Krasnodar1.take_train("Lastochka")
# st_Krasnodar1.take_train("Sapsan")
# st_Krasnodar1.take_train("Moscow-Boronezh")
# st_Krasnodar1.show_list_train
# st_Krasnodar1.send_train("Sapsan")
# st_Krasnodar1.show_list_train

# type_vagon = {1=>"pass", 2=>"freight"}
# puts type_vagon[1]


