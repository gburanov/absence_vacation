require 'hawk'
require 'dotenv'

require_relative 'absence_api'

Dotenv.load

id = ENV['ID']
key = ENV['KEY']

raise "Id is empty" if id.empty?
raise "Key is empty" if key.empty?

api = AbsenceApi.new(id, key)
vacations = api.get_vacations
