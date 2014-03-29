# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


events = Event.create([
  { 
    title: "Tough Mudder Colorado",
    waiver: "You agree not to sue us for any reason.",
    description: "An amazing race! If you think you've seen crazy, you ain't seen nothing.",
    path: "tough-mudder-denver-2014",
    live: true,
    street_address_one: "Center Square",
    street_address_two: "6057 Primrose Avenue",
    city: "San Francisco",
    state: "CA",
    zipcode: "84106",
    timezone: "Pacific Time (US & Canada)",
    date: "2014-06-13",
    time: "2014-06-13 09:30:00",
    volunteer_coordinator_email: "help_volunteer@toughmudder.com",
    support_email: "support@toughmudder.com",
    google_maps_iframe: "<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d100940.14245968248!2d-122.4376!3d37.75769999999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80859a6d00690021%3A0x4a501367f076adff!2sSan+Francisco%2C+CA!5e0!3m2!1sen!2sus!4v1393975285751\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\"></iframe>",
    receipt_html: "<strong>Thanks for joining us!</strong>",
    race_day_info_html: "<emphasis>Get colored while you run</emphasis>",
    packet_pickup_info_html: "Pick up your packet on race day! Duh.",
    published: true,
    on_sale: true
  },
  { 
    title: "Color Me Rad Salt Lake City 2014",
    waiver: "If you hurt yourself, I'm sorry",
    description: "Hare Chrishna",
    path: "color-me-rad-slc-2014",
    live: true,
    street_address_one: "Temple Square",
    street_address_two: "",
    city: "Salt Lake City",
    state: "UT",
    zipcode: "84106",
    timezone: "Mountain Time (US & Canada)",
    date: "2014-12-13",
    time: "2014-12-13 11:30:00",
    volunteer_coordinator_email: "help_volunteer@colormerad.com",
    support_email: "support@colormerad.com",
    google_maps_iframe: "<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d100940.14245968248!2d-122.4376!3d37.75769999999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80859a6d00690021%3A0x4a501367f076adff!2sSan+Francisco%2C+CA!5e0!3m2!1sen!2sus!4v1393975285751\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\"></iframe>",
    receipt_html: "<strong>Thanks for joining us!</strong>",
    race_day_info_html: "<emphasis>Get colored while you run</emphasis>",
    packet_pickup_info_html: "Pick up your packet on race day! Duh.",
    published: true,
    on_sale: true
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
  },
  {
    for_sale_begin: "2014-04-13",
    for_sale_end: "2014-06-13",
    quantity: 700,
    price: 45.00,
    event_id: 2,
    ticket_type: "VIP",
    published: true
  },
  {
    for_sale_begin: "2014-04-13",
    for_sale_end: "2014-06-13",
    quantity: 50,
    price: 0,
    event_id: 2,
    ticket_type: "Runner",
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
    email: "curtis@hotmail.com",
    type: "Participant",
    password: "test"
    )

user5 = User.new(
    first_name: "Trevor",
    last_name: "McKendrick",
    email: "trevor@gmail.com",
    password: "test",
    subdomain: "trevor",
    stripe_user_id: "acct_103gWr2sIUiMQYE0",
    stripe_publishable_key: "pk_test_gN63WMHZMqklRs22NlJh3TV6",
    stripe_access_token: "sk_test_np5fVHQs61y2pJE1tyjYmjG0",
    stripe_refresh_token: "rt_3gWrsbsB9czlgbELvPsA2yvAuIHcNEJwgKhs4UInkZX4pbei",
    type: "User",
    account_id: 1
    )

user6 = User.new(
    first_name: "Trevor",
    last_name: "McKendrick",
    email: "test@test.com",
    password: "test",
    subdomain: "test",
    type: "User",
    account_id: 2
    )

user1.save!(:validate => false)
user2.save!(:validate => false)
user3.save!(:validate => false)
user4.save!(:validate => false)
user5.save!(:validate => false)
user6.save!(:validate => false)

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
  },
   {
    name: "Insurance fee",
    event_id: 2,
    amount: 3.00
  },
  {
    name: "Convenience fee",
    event_id: 2,
    amount: 2.50
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
  },
  {
    title: "Wave 1",
    start_time: Time.now,
    quantity: 1000,
    event_id: 2
  },
  {
    title: "Wave 2",
    start_time: Time.now+3600,
    quantity: 500,
    event_id: 2
  },
  {
    title: "Wave 3",
    start_time: Time.now+7200,
    quantity: 400,
    event_id: 2
  },
  {
    title: "Wave 4",
    start_time: Time.now+10800,
    quantity: 350,
    event_id: 2
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
  },
  {
    event_id: 2,
    user_id: 1
  },
  {
    event_id: 2,
    user_id: 2
  },
  {
    event_id: 2,
    user_id: 3
  },
  {
    event_id: 2,
    user_id: 4
  },
  {
    event_id: 2,
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
  },
   {
    wave_id: 8,
    user_id: 1
  },
  {
    wave_id: 7,
    user_id: 4
  },
  {
    wave_id: 6,
    user_id: 3
  },
  {
    wave_id: 5,
    user_id: 2
  }
  ])

user_ticket = UserTicket.create([
  {
    ticket_id: 1,
    user_id: 1,
    order_id: 1
  },
  {
    ticket_id: 1,
    user_id: 2,
    order_id:2
  },
  {
    ticket_id: 1,
    user_id: 3,
    order_id:1
  },
  {
    ticket_id: 1,
    user_id: 4,
    order_id:1
  },
   {
    ticket_id: 2,
    user_id: 1,
    order_id:3
  },
  {
    ticket_id: 2,
    user_id: 2,
    order_id:3
  },
  {
    ticket_id: 2,
    user_id: 3,
    order_id:3
  },
  {
    ticket_id: 2,
    user_id: 4,
    order_id:3
  }
  ])

referral_code = ReferralCode.create([
  {
  name: "50% Facebook July 2013",
  code: "fb50july",
  amount: 50,
  discount_type: "flat_rate",
  published: true,
  quantity: 100,
  type: "PromoCode",
  event_id: 1
  },
  {
  name: "$10 Twitter back to school",
  code: "twitterbts10",
  amount: 10,
  discount_type: "percent",
  published: true,
  quantity: 50,
  type: "PromoCode",
  event_id: 1
  },
  {
  name: "Email 20%",
  code: "20please",
  amount: 20,
  discount_type: "percent",
  published: true,
  quantity: 275,
  type: "PromoCode",
  event_id: 1
  }
  ])

orders = Order.create([
  {
    referral_code_id: 1
  },
  {
    referral_code_id: 2
  },
  {
    referral_code_id: 3
  },
  {

  },
  {

  }
  ])

affiliate_setting = AffiliateSetting.create([
  {
    discount_type: "flat_rate",
    reward_type: "both",
    event_id: 1,
    enabled: true,
    amount: 20
  },
  {
    discount_type: "percent",
    reward_type: "affiliate",
    event_id: 2,
    enabled: true,
    amount: 10
  }
  ])

orders = Order.create([
  {
    referral_code_id: 1,
    event_id: 1
  },
  {
    referral_code_id: 2,
    event_id: 1
  },
  {
    referral_code_id: 3,
    event_id: 1
  }
  ])

teams = Team.create([
  {
    name: "Awesome Possums",
    event_id: 1
  },
  {
    name: "We go fast",
    event_id: 1
  },
  {
    name: "Love to run",
    event_id: 1
  },
  {
    name: "The Bosses",
    event_id: 1
  },
  {
    name: "Waaazzzzup",
    event_id: 2
  },
  {
    name: "The Amazing Racers",
    event_id: 2
  }
  ])

user_team = UserTeam.create([
  {
    team_id: 1,
    user_id: 1
  },
   {
    team_id: 1,
    user_id: 2
  },
   {
    team_id: 1,
    user_id: 3
  },
   {
    team_id: 1,
    user_id: 4
  },
   {
    team_id: 2,
    user_id: 1
  },
   {
    team_id: 2,
    user_id: 1
  },
   {
    team_id: 2,
    user_id: 1
  },
   {
    team_id: 2,
    user_id: 1
  }
  ])

teams = Team.create([
  {
    name: "Awesome Possums",
    event_id: 1
  },
  {
    name: "The Amazing Racers",
    event_id: 2
  }
  ])

user_ticket = UserTeam.create([
  {
    team_id: 1,
    user_id: 1
  },
   {
    team_id: 1,
    user_id: 2
  },
   {
    team_id: 1,
    user_id: 3
  },
   {
    team_id: 1,
    user_id: 4
  },
   {
    team_id: 2,
    user_id: 1
  },
   {
    team_id: 2,
    user_id: 1
  },
   {
    team_id: 2,
    user_id: 1
  },
   {
    team_id: 2,
    user_id: 1
  }
  ])

account = Account.create([
  {
    header: '<style>
#DIV_1 {
    clear: both;
    color: rgb(34, 34, 34);
    height: 172px;
    width: 978px;
    background: rgb(255, 255, 255) none repeat scroll 0% 0% / auto padding-box border-box;
    border-top: 1px solid rgb(224, 222, 222);
    border-right: 1px solid rgb(224, 222, 222);
    border-bottom: 0px none rgb(34, 34, 34);
    border-left: 1px solid rgb(224, 222, 222);
    border-radius: 3px 3px 3px 3px;
    font: normal normal normal 13px/20px Arial;
    margin: 0px 0px 20px;
    outline: rgb(34, 34, 34) none 0px;
}/*#DIV_1*/

#DIV_2 {
    color: rgb(34, 34, 34);
    height: 171px;
    width: 978px;
    border-top: 0px none rgb(34, 34, 34);
    border-right: 0px none rgb(34, 34, 34);
    border-bottom: 1px solid rgb(205, 205, 205);
    border-left: 0px none rgb(34, 34, 34);
    border-radius: 0 0 3px 3px;
    font: normal normal normal 13px/20px Arial;
    outline: rgb(34, 34, 34) none 0px;
}/*#DIV_2*/

#DIV_3 {
    color: rgb(34, 34, 34);
    height: 156px;
    width: 978px;
    border: 0px none rgb(34, 34, 34);
    font: normal normal normal 13px/20px Arial;
    outline: rgb(34, 34, 34) none 0px;
    overflow: hidden;
    padding: 0px 0px 15px;
}/*#DIV_3*/

#A_4 {
    color: rgb(1, 111, 167);
    text-decoration: none;
    border: 0px none rgb(1, 111, 167);
    font: normal normal normal 13px/20px Arial;
    outline: rgb(1, 111, 167) none 0px;
}/*#A_4*/

#IMG_5 {
    color: rgb(1, 111, 167);
    display: block;
    float: left;
    height: 96px;
    max-width: 100%;
    text-align: center;
    vertical-align: middle;
    width: 196px;
    border: 0px none rgb(1, 111, 167);
    font: normal normal normal 13px/20px Arial;
    margin: 30px 0px 0px;
    outline: rgb(1, 111, 167) none 0px;
    padding: 15px;
}/*#IMG_5*/

#DIV_6 {
    color: rgb(34, 34, 34);
    float: right;
    height: 154px;
    width: 733px;
    border: 0px none rgb(34, 34, 34);
    font: normal normal normal 13px/20px Arial;
    margin: 0px 10px 0px 0px;
    outline: rgb(34, 34, 34) none 0px;
}/*#DIV_6*/

#DIV_7 {
    color: rgb(34, 34, 34);
    height: 44px;
    width: 733px;
    border: 0px none rgb(34, 34, 34);
    font: normal normal normal 13px/20px Arial;
    margin: 0px 0px 45px;
    outline: rgb(34, 34, 34) none 0px;
    overflow: hidden;
}/*#DIV_7*/

#DIV_8 {
    color: rgb(34, 34, 34);
    float: left;
    height: 24px;
    width: 426px;
    border: 0px none rgb(34, 34, 34);
    font: normal normal normal 13px/20px Arial;
    margin: 20px 0px 0px;
    outline: rgb(34, 34, 34) none 0px;
}/*#DIV_8*/

#A_9, #A_11, #A_13, #A_15, #A_17, #A_19, #A_21 {
    color: rgb(1, 111, 167);
    text-decoration: none;
    border: 0px none rgb(1, 111, 167);
    font: normal normal normal 13px/20px Arial;
    margin: 0px 0px 0px 5px;
    outline: rgb(1, 111, 167) none 0px;
}/*#A_9, #A_11, #A_13, #A_15, #A_17, #A_19, #A_21*/

#IMG_10, #IMG_12, #IMG_16, #IMG_20 {
    color: rgb(1, 111, 167);
    height: 24px;
    max-width: 100%;
    vertical-align: middle;
    width: 24px;
    border: 0px none rgb(1, 111, 167);
    font: normal normal normal 13px/20px Arial;
    outline: rgb(1, 111, 167) none 0px;
}/*#IMG_10, #IMG_12, #IMG_16, #IMG_20*/

#IMG_14, #IMG_18 {
    color: rgb(1, 111, 167);
    height: 24px;
    max-width: 100%;
    vertical-align: middle;
    width: 24px;
    border: 0px none rgb(1, 111, 167);
    font: normal normal normal 13px/20px Arial;
    outline: rgb(1, 111, 167) none 0px;
}/*#IMG_14, #IMG_18*/

#IMG_22 {
    color: rgb(1, 111, 167);
    height: 23px;
    max-width: 100%;
    vertical-align: middle;
    width: 223px;
    border: 0px none rgb(1, 111, 167);
    font: normal normal normal 13px/20px Arial;
    outline: rgb(1, 111, 167) none 0px;
}/*#IMG_22*/

#DIV_23 {
    color: rgb(34, 34, 34);
    width: 733px;
    border: 0px none rgb(34, 34, 34);
    font: normal normal normal 13px/20px Arial;
    outline: rgb(34, 34, 34) none 0px;
}/*#DIV_23*/

#DIV_24 {
    color: rgb(34, 34, 34);
    height: 45px;
    width: 733px;
    border: 0px none rgb(34, 34, 34);
    font: normal normal normal 13px/20px Arial;
    margin: 0px 0px 20px;
    outline: rgb(34, 34, 34) none 0px;
}/*#DIV_24*/

#DIV_25 {
    box-shadow: rgba(0, 0, 0, 0.0627451) 0px 1px 4px 0px;
    color: rgb(34, 34, 34);
    height: 45px;
    min-height: 40px;
    width: 693px;
    border: 0px none rgb(34, 34, 34);
    border-radius: 4px 4px 4px 4px;
    font: normal normal normal 13px/20px Arial;
    outline: rgb(34, 34, 34) none 0px;
    padding: 0px 20px;
}/*#DIV_25*/

#DIV_25:after {
    clear: both;
    color: rgb(34, 34, 34);
    display: table;
    width: 1px;
    content: '';
    border: 0px none rgb(34, 34, 34);
    font: normal normal normal 13px/0px Arial;
    outline: rgb(34, 34, 34) none 0px;
}/*#DIV_25:after*/

#DIV_25:before {
    color: rgb(34, 34, 34);
    display: table;
    width: 1px;
    content: '';
    border: 0px none rgb(34, 34, 34);
    font: normal normal normal 13px/0px Arial;
    outline: rgb(34, 34, 34) none 0px;
}/*#DIV_25:before*/

#DIV_26 {
    color: rgb(34, 34, 34);
    height: 45px;
    width: 693px;
    border: 0px none rgb(34, 34, 34);
    font: normal normal normal 13px/20px Arial;
    outline: rgb(34, 34, 34) none 0px;
}/*#DIV_26*/

#DIV_26:after {
    clear: both;
    color: rgb(34, 34, 34);
    display: table;
    width: 1px;
    content: '';
    border: 0px none rgb(34, 34, 34);
    font: normal normal normal 13px/0px Arial;
    outline: rgb(34, 34, 34) none 0px;
}/*#DIV_26:after*/

#DIV_26:before {
    color: rgb(34, 34, 34);
    display: table;
    width: 1px;
    content: '';
    border: 0px none rgb(34, 34, 34);
    font: normal normal normal 13px/0px Arial;
    outline: rgb(34, 34, 34) none 0px;
}/*#DIV_26:before*/

#A_27 {
    box-shadow: rgba(255, 255, 255, 0.0980392) 0px 1px 0px 0px inset, rgba(255, 255, 255, 0.0745098) 0px 1px 0px 0px;
    color: rgb(255, 255, 255);
    cursor: pointer;
    display: none;
    float: right;
    text-align: center;
    text-decoration: none;
    vertical-align: middle;
    background: rgb(237, 237, 237) linear-gradient(rgb(242, 242, 242), rgb(229, 229, 229)) repeat-x scroll 0% 0% / auto padding-box border-box;
    border-top: 1px solid rgba(0, 0, 0, 0.14902);
    border-right: 1px solid rgba(0, 0, 0, 0.14902);
    border-bottom: 1px solid rgba(0, 0, 0, 0.247059);
    border-left: 1px solid rgba(0, 0, 0, 0.14902);
    border-radius: 4px 4px 4px 4px;
    font: normal normal normal 14px/20px Arial;
    margin: 5px 5px 0px;
    outline: rgb(255, 255, 255) none 0px;
    padding: 7px 10px;
}/*#A_27*/

#SPAN_28 {
    box-shadow: rgba(0, 0, 0, 0.247059) 0px 1px 0px 0px;
    color: rgb(255, 255, 255);
    cursor: pointer;
    display: block;
    height: 2px;
    text-align: center;
    width: 18px;
    border: 0px none rgb(255, 255, 255);
    border-radius: 1px 1px 1px 1px;
    font: normal normal normal 14px/8.390625px FontAwesome;
    margin: 1px 0px 0px;
    outline: rgb(255, 255, 255) none 0px;
}/*#SPAN_28*/

#SPAN_29, #SPAN_30 {
    box-shadow: rgba(0, 0, 0, 0.247059) 0px 1px 0px 0px;
    color: rgb(255, 255, 255);
    cursor: pointer;
    display: block;
    height: 2px;
    text-align: center;
    width: 18px;
    border: 0px none rgb(255, 255, 255);
    border-radius: 1px 1px 1px 1px;
    font: normal normal normal 14px/8.390625px FontAwesome;
    margin: 3px 0px 0px;
    outline: rgb(255, 255, 255) none 0px;
}/*#SPAN_29, #SPAN_30*/

#DIV_31 {
    color: rgb(34, 34, 34);
    position: relative;
    width: 693px;
    border: 0px none rgb(34, 34, 34);
    font: normal normal normal 13px/20px Arial;
    outline: rgb(34, 34, 34) none 0px;
    transition: height 0.35s ease 0s;
}/*#DIV_31*/

#UL_32 {
    color: rgb(34, 34, 34);
    width: 693px;
    border: 0px none rgb(34, 34, 34);
    font: normal normal normal 13px/20px Arial;
    list-style: none outside none;
    margin: 0px;
    outline: rgb(34, 34, 34) none 0px;
    padding: 0px;
}/*#UL_32*/

#LI_33 {
    color: rgb(34, 34, 34);
    float: left;
    height: 45px;
    width: 161px;
    border: 0px none rgb(34, 34, 34);
    font: normal normal normal 13px/20px Arial;
    list-style: none outside none;
    outline: rgb(34, 34, 34) none 0px;
}/*#LI_33*/

#A_34 {
    background-position: 0px 0px;
    color: rgb(88, 88, 90);
    display: block;
    height: 45px;
    text-align: left;
    text-decoration: none;
    text-transform: uppercase;
    width: 69px;
    background: rgb(247, 247, 246) none repeat scroll 0px 0px / auto padding-box border-box;
    border: 0px none rgb(88, 88, 90);
    font: normal normal normal 12px/45px AvenirLTStd-Black, sans-serif;
    list-style: none outside none;
    margin: 0px 0px 0px 2px;
    outline: rgb(88, 88, 90) none 0px;
    padding: 0px 45px;
}/*#A_34*/

#LI_35, #LI_37 {
    color: rgb(34, 34, 34);
    float: left;
    height: 45px;
    width: 133px;
    border: 0px none rgb(34, 34, 34);
    font: normal normal normal 13px/20px Arial;
    list-style: none outside none;
    outline: rgb(34, 34, 34) none 0px;
}/*#LI_35, #LI_37*/

#A_36 {
    background-position: 0px 0px;
    color: rgb(88, 88, 90);
    display: block;
    height: 45px;
    text-align: left;
    text-decoration: none;
    text-transform: uppercase;
    width: 41px;
    background: rgb(227, 223, 220) none repeat scroll 0px 0px / auto padding-box border-box;
    border: 0px none rgb(88, 88, 90);
    font: normal normal normal 12px/45px AvenirLTStd-Black, sans-serif;
    list-style: none outside none;
    margin: 0px 0px 0px 2px;
    outline: rgb(88, 88, 90) none 0px;
    padding: 0px 45px;
}/*#A_36*/

#A_38 {
    background-position: 0px 0px;
    color: rgb(88, 88, 90);
    display: block;
    height: 45px;
    text-align: left;
    text-decoration: none;
    text-transform: uppercase;
    width: 41px;
    background: rgb(247, 247, 246) none repeat scroll 0px 0px / auto padding-box border-box;
    border: 0px none rgb(88, 88, 90);
    font: normal normal normal 12px/45px AvenirLTStd-Black, sans-serif;
    list-style: none outside none;
    margin: 0px 0px 0px 2px;
    outline: rgb(88, 88, 90) none 0px;
    padding: 0px 45px;
}/*#A_38*/

#LI_39 {
    color: rgb(34, 34, 34);
    float: left;
    height: 45px;
    width: 124px;
    border: 0px none rgb(34, 34, 34);
    font: normal normal normal 13px/20px Arial;
    list-style: none outside none;
    outline: rgb(34, 34, 34) none 0px;
}/*#LI_39*/

#A_40 {
    background-position: 0px 0px;
    color: rgb(88, 88, 90);
    display: block;
    height: 45px;
    text-align: left;
    text-decoration: none;
    text-transform: uppercase;
    width: 32px;
    background: rgb(247, 247, 246) none repeat scroll 0px 0px / auto padding-box border-box;
    border: 0px none rgb(88, 88, 90);
    font: normal normal normal 12px/45px AvenirLTStd-Black, sans-serif;
    list-style: none outside none;
    margin: 0px 0px 0px 2px;
    outline: rgb(88, 88, 90) none 0px;
    padding: 0px 45px;
}/*#A_40*/

#LI_41 {
    color: rgb(34, 34, 34);
    float: left;
    height: 45px;
    width: 142px;
    border: 0px none rgb(34, 34, 34);
    font: normal normal normal 13px/20px Arial;
    list-style: none outside none;
    outline: rgb(34, 34, 34) none 0px;
}/*#LI_41*/

#A_42 {
    background-position: 0px 0px;
    color: rgb(88, 88, 90);
    display: block;
    height: 45px;
    text-align: left;
    text-decoration: none;
    text-transform: uppercase;
    width: 50px;
    background: rgb(247, 247, 246) none repeat scroll 0px 0px / auto padding-box border-box;
    border: 0px none rgb(88, 88, 90);
    font: normal normal normal 12px/45px AvenirLTStd-Black, sans-serif;
    list-style: none outside none;
    margin: 0px 0px 0px 2px;
    outline: rgb(88, 88, 90) none 0px;
    padding: 0px 45px;
}/*#A_42*/
</style>


<div id="DIV_1">
  <div id="DIV_2">
    <div id="DIV_3">
       <a href="http://www.colormerad.com/" id="A_4"><img height="96" width="196" alt="Color Me Rad 5K" src="//secure.colormerad.com/tickets/pics/images/logo_hd4.jpg" id="IMG_5" /></a>
      <div id="DIV_6">
        <div id="DIV_7">
          <div id="DIV_8">
             <a href="https://plus.google.com/106070113924847522899/posts" id="A_9"><img height="24" width="24" alt="Google Plus" src="//www.colormerad.com/images/i-google.jpg" id="IMG_10" /></a> <a href="http://instagram.com/colormerad5k?ref=badge" id="A_11"><img height="24" width="24" alt="Instagram" src="//www.colormerad.com/images/i_instagram.jpg" id="IMG_12" /></a> <a href="http://www.youtube.com/colormerad5k" id="A_13"><img height="24" width="24" alt="Youtube" src="//www.colormerad.com/images/i_youtube.jpg" id="IMG_14" /></a> <a href="http://www.pinterest.com/colormerad5k" id="A_15"><img height="24" width="24" alt="Pinterest" src="//www.colormerad.com/images/i_pinterest.jpg" id="IMG_16" /></a> <a href="http://www.facebook.com/colormerad5k" id="A_17"><img height="24" width="24" alt="Facebook" src="//www.colormerad.com/images/i_facebook.jpg" id="IMG_18" /></a> <a href="http://www.twitter.com/colormerad5k" id="A_19"><img height="24" width="24" alt="Twitter" src="//www.colormerad.com/images/i_twitter.jpg" id="IMG_20" /></a> <a href="/contact/contact.i" id="A_21"><img height="24" width="223" alt="Join our mailing list" src="//www.colormerad.com/images/join_mailing_list.jpg" id="IMG_22" /></a>
          </div>
        </div>
        <div id="DIV_23">
        </div>
        <div id="DIV_24">
          <div id="DIV_25">
            <div id="DIV_26">
               <a id="A_27"><span id="SPAN_28"></span><span id="SPAN_29"></span><span id="SPAN_30"></span></a>
              <div id="DIV_31">
                <ul id="UL_32">
                  <li id="LI_33">
                    <a href="http://www.colormerad.com/racemap.i" id="A_34">Locations</a>
                  </li>
                  <li id="LI_35">
                    <a href="http://www.colormerad.com/about.html" id="A_36">About</a>
                  </li>
                  <li id="LI_37">
                    <a href="http://shop.colormerad.com" id="A_38">Store</a>
                  </li>
                  <li id="LI_39">
                    <a href="http://www.colormerad.com/faq/faq.i" id="A_40">FAQs</a>
                  </li>
                  <li id="LI_41">
                    <a href="http://www.colormerad.com/gallery/gallery_list.i?cmd=list&amp;galleryid=1" id="A_42">Photos</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>'
    }])
