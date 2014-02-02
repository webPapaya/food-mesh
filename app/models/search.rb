##
# search.rb
#
# university:  University of Applied Sciences Salzburg
# studie:      MultiMediaTechnology
# usage:	    Multimediaprojekt 2a (MMP2a)
# author:      - Thomas Mayrhofer (thomas@mayrhofer.at)
#              - Franziska Oberhauser

class Search
    include Mongoid::Document
    field :_id, type: String
    field :food_items, type: Array
    field :timestamp, type: Array

    validates_presence_of :id, :food_items

    def self.search(_query)
        item = Search.find(_query)
        return nil if item.nil?

        item['timestamp'] = [] if item['timestamp'].nil?
        timestamps = item['timestamp'] + [Time.now.getutc]
        item.update_attributes!(timestamp: timestamps)
        item
    end

    def self.add(_query, _item_list)
        i = Search.new(
            _id:        _query,
            food_items: prepare_item_list(_item_list),
            timestamp:  [Time.now.getutc]
        )
        i.save
    end

    def self.clear_cache
        Search.delete_all
    end

    def self.fetch_most_searched
        items = Search.all.order_by([[:timestamp.length, :desc]])
        items
    end

    def self.prepare_item_list(_item_list)
        list = []
        _item_list.each do |item|
            list << (FoodItem.create_id item[:api_key], item[:item_id])
        end
        list
    end

    private_class_method :prepare_item_list
end
