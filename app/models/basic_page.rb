##
# basic_page.rb
#
# university:  University of Applied Sciences Salzburg
# studie:      MultiMediaTechnology
# usage:	    Multimediaprojekt 2a (MMP2a)
# author:      - Thomas Mayrhofer (thomas@mayrhofer.at)
#              - Franziska Oberhauser

class BasicPage
    include Mongoid::Document
    field :title, type: String
    field :body, type: String
end
