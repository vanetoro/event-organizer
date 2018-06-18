Host.destroy_all
Event.destroy_all
vane = Host.create(username: 'Vane', email: 'vane@me.com', password: 'passpass')
rachel = Host.create(username: 'Rachel', email: 'rachel@me.com', password: 'passpass')
events_vane = [
  {event_name:'Reychella', location: 'The Deck', date: 'June 23, 2017'},
  {event_name:'Bartschlandfollies', location: 'McKittrich Hotel', date: 'June 15, 2017'}
].each {|e| vane.events << Event.create(e)}


events_rachel = [
  {event_name:'Kunst Pride', location: 'Elsewhere', date: 'June 22, 2017'},
  {event_name:'Ibiza Trip', location: 'Ibiza', date: 'July 08, 2017'}
].each {|e| rachel.events << Event.create(e)}
