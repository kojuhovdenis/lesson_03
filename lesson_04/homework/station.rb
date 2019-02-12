class Station

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
