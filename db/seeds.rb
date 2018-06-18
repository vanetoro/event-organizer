Host.destroy_all
Event.destroy_all
vane = Host.create(username: 'Vane', email: 'vane@me.com', password: 'passpass')

events = [
  {event_name:'Reychella', location: 'The Deck', date: 'June 22, 2017'},
  {event_name:'Bartschlandfollies', location: 'McKittrich Hotel', date: 'June 15, 2017'}
].each {|e| vane.events << Event.create(e)}

# events.each do |e|
#   binding.pry
#  vane.events << e
#  end
