# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


events = Event.create([
  { 
    title: "Color Me Rad",
    waiver: "You agree not to sue us for any reason.",
    description: "An amazing race! If you think you've seen crazy, you ain't seen nothing.",
    path: "tough-mudder-denver-2014",
    live: true,
    street_address_one: "Center Square",
    street_address_two: "6057 Primrose Avenue",
    city: "San Francisco",
    state: "CA",
    zipcode: "84106",
    timezone: "PST",
    date: "2014-06-13",
    time: "2014-06-13 09:30:00",
    volunteer_coordinator_email: "help_volunteer@colormerad.com",
    support_email: "support@colormerad.com",
    google_maps_iframe: "<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d100940.14245968248!2d-122.4376!3d37.75769999999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80859a6d00690021%3A0x4a501367f076adff!2sSan+Francisco%2C+CA!5e0!3m2!1sen!2sus!4v1393975285751\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\"></iframe>",
    receipt_html: "<strong>Thanks for joining us!</strong>",
    race_day_info_html: "<emphasis>Get colored while you run</emphasis>",
    packet_pickup_info_html: "Pick up your packet on race day! Duh.",
    published: true
  }
])

tickets = Ticket.create([
  {
    for_sale_begin: "2014-04-13",
    for_sale_end: "2014-06-13",
    quantity: 700,
    price: 45.00,
    event_id: 1,
    ticket_type: "5k Registration",
    published: true
  },
  {
    for_sale_begin: "2014-04-13",
    for_sale_end: "2014-06-13",
    quantity: 50,
    price: 0,
    event_id: 1,
    ticket_type: "Volunteer",
    published: true
  }
  ])

user1 = User.new(
    first_name: "Breanna",
    last_name: "Meldrum",
    gender: "female",
    dob: "1988-05-04",
    shirtsize: "male small",
    zipcode: "84106",
    email: "breannamckendrick@gmail.com",
    type: "Participant",
    password: "test"
    )
user2 = User.new(
    first_name: "Rob",
    last_name: "Delancy",
    gender: "male",
    dob: "1955-08-09",
    shirtsize: "male small",
    zipcode: "10021",
    email: "rob@yahoo.com",
    type: "Participant",
    password: "test"
    )
user3 = User.new(
    first_name: "Daniel",
    last_name: "Chong",
    gender: "male",
    dob: "1990-11-04",
    shirtsize: "male medium",
    zipcode: "84106",
    email: "daniel@gmail.com",
    type: "Participant",
    password: "test"
    )
user4 = User.new(
    first_name: "Curtis",
    last_name: "Einstein",
    gender: "male",
    dob: "1980-02-21",
    shirtsize: "male large",
    zipcode: "93313",
    email: "curtisclueless@hotmail.com",
    type: "Participant",
    password: "test"
    )

user5 = User.new(
    first_name: "Trevor",
    last_name: "McKendrick",
    email: "trevormckendrick@gmail.com",
    password: "jello2you",
    subdomain: "trevor",
    stripe_user_id: "acct_103bl42399tuinsm",
    stripe_publishable_key: "pk_test_ttZ19Tol5oWtR4EyYBDHymCA",
    stripe_access_token: "sk_test_TfOHWKflKfkxXTv7BILlDLCE",
    stripe_refresh_token: "rt_3bl4Qk5P2wQpI0af4K17JmB3FndEjz8jRYjuNikqF6LlUIg1"
    )

user1.save!(:validate => false)
user2.save!(:validate => false)
user3.save!(:validate => false)
user4.save!(:validate => false)
user5.save!(:validate => false)

fees = Fee.create([
  {
    name: "Insurance fee",
    event_id: 1,
    amount: 2.00
  },
  {
    name: "Convenience fee",
    event_id: 1,
    amount: 1.50
  }
  ])

waves = Wave.create([
  {
    title: "Wave 1",
    start_time: Time.now,
    quantity: 1000,
    event_id: 1
  },
  {
    title: "Wave 2",
    start_time: Time.now+3600,
    quantity: 500,
    event_id: 1
  },
  {
    title: "Wave 3",
    start_time: Time.now+7200,
    quantity: 400,
    event_id: 1
  },
  {
    title: "Wave 4",
    start_time: Time.now+10800,
    quantity: 350,
    event_id: 1
  }
  ])

user_event = UserEvent.create([
  {
    event_id: 1,
    user_id: 1
  },
  {
    event_id: 1,
    user_id: 2
  },
  {
    event_id: 1,
    user_id: 3
  },
  {
    event_id: 1,
    user_id: 4
  },
  {
    event_id: 1,
    user_id: 5
  }
  ])

user_wave = UserWave.create([
  {
    wave_id: 1,
    user_id: 1
  },
  {
    wave_id: 2,
    user_id: 4
  },
  {
    wave_id: 3,
    user_id: 3
  },
  {
    wave_id: 4,
    user_id: 2
  }
  ])

user_ticket = UserTicket.create([
  {
    ticket_id: 1,
    user_id: 1
  },
  {
    ticket_id: 1,
    user_id: 2
  },
  {
    ticket_id: 1,
    user_id: 3
  },
  {
    ticket_id: 1,
    user_id: 4
  }
  ])
