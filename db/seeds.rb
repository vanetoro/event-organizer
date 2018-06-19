Host.destroy_all
Event.destroy_all
Venue.destroy_all

vane = Host.create(username: 'Vane', email: 'vane@me.com', password: 'passpass')
rachel = Host.create(username: 'Rachel', email: 'rachel@me.com', password: 'passpass')

deck = Venue.create(name: "The Deck", location: 'Brooklyn')
mckittrich = Venue.create(name: "The McKittrich Hotel", location: 'Manhattan')
elsewhere = Venue.create(name: "Elsewhere", location: 'Brooklyn')


raychella = Event.create(name:'Raychella', date: 'June 23, 2017')
follies = Event.create(name:'Bartschland Follies', date: 'June 15, 2017')
kunst = Event.create(name:'Kunst Pride', date: 'June 22, 2017')

deck.events << raychella
elsewhere.events << kunst
mckittrich.events << follies

vane.events << raychella
vane.events << follies

rachel.events << kunst
