module InstanceCounter

  module ClassMethods
    def vagon_count_all_from_module
     #@@vagon_count_all
     self.vagon_count_all
    end
  end

  module MyInsMethods
    def register_instance_from_module
      #@@vagon_count_all += 1
      self.vagon_count_all += 1      
    end
  end

end

class Vagon

  @@vagon_count_all ||= 0

  extend InstanceCounter::ClassMethods
# private
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

class BigVagon < Vagon
end

A = Vagon.new
Vagon.vagon_count_all                # -->> 1
A.vagon_count_all                    # -->> 1
B = BigVagon.new          
BigVagon.vagon_count_all             # -->> 2
B.vagon_count_all                    # -->> 2

Vagon.vagon_count_all_from_module    #uninitialized class variable @@vagon_count_all
BigVagon.vagon_count_all_from_module #uninitialized class variable @@vagon_count_all
