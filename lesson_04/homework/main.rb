require_relative 'station'
require_relative 'route'
require_relative 'train'

#Create stations
st_SaintPetersburg  = Station.new("Moscowsky vokzal (Saint-Petersburg)")
st_Leningradsky     = Station.new("Leningradsky vokzal (Moscow)")
st_Rizhskiy         = Station.new("Rizhskiy vokzal (Moscow)")
st_Kievskiy         = Station.new("Kievskiy vokzal (Moscow)")
st_Mineralnae       = Station.new("Mineralnae vody")
st_Pashkovka        = Station.new("Pashkovka (Krasnodar)")
st_Krasnodar1 	    = Station.new("Krasnodar-1")
st_Adler            = Station.new("Adler")

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
