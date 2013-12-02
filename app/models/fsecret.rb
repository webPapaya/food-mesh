class Fsecret < ActiveRecord::Base
  def initialize
    FatSecret.init('e2310b092c9f4acbb43657f59c242245', '3d0cc9b6114741bbbfe6c2510e8913c3');
  end

  def search query
    FatSecret.search_food query
  end
end
