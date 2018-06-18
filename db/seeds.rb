vane = Host.create(username: 'Vane', email: 'vane@me.com', password: 'passpass')
birthday = Event.create(name:'Reychella', date: 'June')

vane.events << birthday
