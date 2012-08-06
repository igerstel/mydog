# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Fbook.destroy_all

puts "Creating URLs."
fbooks = [
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-snc7/s720x720/397039_353923457956487_1043824412_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-snc7/294032_272989676049866_3819365_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-ash4/295187_272989699383197_2435389_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-snc6/228919_272989722716528_2117921_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash4/226131_272989759383191_3510238_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash4/292557_272989782716522_8210454_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash4/292683_272989802716520_7209220_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-ash4/185483_272989822716518_4189660_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-snc6/223655_272989856049848_5411571_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-snc6/223726_272989896049844_104600_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash4/294113_272989922716508_605469_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash4/293000_272989946049839_5731317_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-snc6/262938_272989972716503_2593218_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-snc7/292502_272989996049834_2783950_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-snc7/293127_272990022716498_375987_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-snc7/292828_272990046049829_444980_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-snc6/223763_272990076049826_2366694_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-snc7/295126_272990612716439_5569822_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-snc7/295432_272990646049769_6057524_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-ash4/198788_272990696049764_2110019_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-snc7/293429_272990726049761_5259358_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-snc6/223689_272990779383089_6381093_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-snc6/281600_272990796049754_7474515_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash4/294526_272990812716419_204362_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash4/294493_272990836049750_468764_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-snc7/293787_272990886049745_7547132_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-ash4/295521_272990909383076_445181_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-snc7/292979_272990942716406_5244482_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-ash4/293329_272990959383071_6731377_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash4/295644_272990979383069_5067260_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-snc6/185557_272991006049733_2845276_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-ash4/254760_272991029383064_4007726_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-ash4/291800_272991046049729_3893665_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-snc7/293650_272991066049727_838985_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash4/263390_272991089383058_7527576_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-snc7/292414_272991116049722_6107110_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash4/291826_272991126049721_5963668_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-snc6/285561_272991139383053_159878_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-ash4/293636_272991152716385_8347617_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-ash4/294467_272991179383049_5092149_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-snc6/205923_272991199383047_7418182_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-snc7/s720x720/382352_314963938519106_34021085_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-ash4/s720x720/382997_314963975185769_1385336029_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-snc7/s720x720/401099_349924021689764_740913574_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-ash4/s720x720/385866_349924051689761_1601122975_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-snc7/s720x720/389875_349924088356424_1499062231_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash4/s720x720/376157_349924111689755_527421577_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-snc7/s720x720/381697_349924141689752_852331641_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash4/s720x720/405749_353769721305194_1208330682_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-snc7/s720x720/319795_488071964541635_1233662556_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-prn1/s720x720/543282_488071841208314_326335716_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-snc6/s720x720/181495_488071861208312_1148038160_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-snc6/s720x720/206077_488071884541643_489352607_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash4/s720x720/428543_488072291208269_1068319231_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-prn1/s720x720/404530_373528669329299_1511244323_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-ash4/s720x720/409455_373528709329295_1784956714_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash4/s720x720/417348_373528739329292_2091943646_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash4/s720x720/401295_373528775995955_1468531814_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-snc7/s720x720/430422_412562212092611_854027574_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-ash4/s720x720/310080_415773071771525_672984932_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-snc7/s720x720/389186_415773108438188_1235059885_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-snc7/s720x720/403985_415773135104852_1951723193_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash4/s720x720/480727_415773181771514_821926896_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash4/s720x720/486365_415773211771511_9052086_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-snc7/s720x720/309952_415773241771508_791327693_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-ash4/s720x720/403819_415773275104838_2137020455_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-snc7/s720x720/295306_415773301771502_1476097867_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash4/s720x720/380572_427361087279390_1562108325_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-ash3/s720x720/563146_427361157279383_2047436523_n.jpg	“ },
{ :url => “	http://sphotos-a.xx.fbcdn.net/hphotos-ash3/s720x720/557881_427361187279380_1297774424_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash3/s720x720/529300_427361233946042_110903038_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash3/s720x720/562528_427361250612707_391934123_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash3/s720x720/532191_490394447642720_344226844_n.jpg	“ },
{ :url => “	http://sphotos-b.xx.fbcdn.net/hphotos-ash4/s720x720/396063_501512493197582_925803876_n.jpg	“ }
]

fbooks.each do |fbook|
	Fbook.create fbook
end