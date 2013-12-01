require 'fatsecret'
require 'fsecret'

class FsecretController < ApplicationController
    instance = Fsecret.new

    @debug = instance.query "banana"
end