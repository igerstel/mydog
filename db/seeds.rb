# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Fbook.destroy_all
puts "Populating Facebook URLs."
File.open('fbseed.txt').each_line do |line|
	fbook = Fbook.create
	fbook.url,fbook.inimgur = line.split
	fbook.save
end

Imgurl.destroy_all
puts "Populating Imgur URLs."
File.open('imgurseed.txt').each_line do |line|
	imgurl = Imgurl.create
	imgurl.url = line
	imgurl.save
end


