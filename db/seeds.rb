vane = Host.create(username: 'Vane', email: 'vane@me.com', password: 'passpass')
birthday = Event.create(event_name:'Reychella', date: 'June 22, 2017')
follies = Event.create(event_name:'Bartschlandfollies', date: 'June 15, 2017')
vane.events << birthday
vane.events << follies
