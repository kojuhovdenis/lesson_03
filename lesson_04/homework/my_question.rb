module InstanceCounter

  module ClassMethods
    def vagon_count_all_from_module
     @@vagon_count_all
    end
  end

  module MyInsMethods
    def register_instance_from_module
      @@vagon_count_all += 1
    end
  end

end

class Vagon

  @@vagon_count_all ||= 0

  extend InstanceCounter::ClassMethods
  private
  include InstanceCounter::MyInsMethods

  def initialize
    @@vagon_count_all += 1
  end

  def vagon_count_all
    @@vagon_count_all
  end

  def self.vagon_count_all
    @@vagon_count_all
  end
  
end