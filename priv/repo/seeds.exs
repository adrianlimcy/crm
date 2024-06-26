# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Crm.Repo.insert!(%Crm.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Crm.Countries
alias Crm.Companies
alias Crm.Contacts
alias Crm.Contracts
alias Crm.Devices
alias Crm.Records

countries = [
  %{    name: "Singapore"  },
  %{    name: "Malaysia"  },
  %{    name: "Indonesia"  },
  %{    name: "Vietnam"  },
  %{    name: "Australia"  },
  %{    name: "Japan"  },
  %{    name: "Korea"  }
]

companies = [
  %{
    name: "Company01",
    brn: "11221122",
    billingadd1: "someaddress01",
    billingadd2: "#08-88",
    postalcode: "112233",
    country_id: "1"
  },
  %{
    name: "Company02",
    brn: "1124334422",
    billingadd1: "someaddress02",
    billingadd2: "#09-99",
    postalcode: "1334455",
    country_id: "2"
  },
  %{
    name: "Company03",
    brn: "11254454422",
    billingadd1: "someaddress03",
    billingadd2: "#01-10",
    postalcode: "1553325",
    country_id: "3"
  },
  %{
    name: "Company04",
    brn: "11344324122",
    billingadd1: "someaddress04",
    billingadd2: "#02-11",
    postalcode: "234334",
    country_id: "4"
  },
  %{
    name: "Company05",
    brn: "1145645622",
    billingadd1: "someaddress05",
    billingadd2: "#01-11",
    postalcode: "2343dsf34",
    country_id: "4"
  },
  %{
    name: "Company06",
    brn: "1566564322",
    billingadd1: "someaddress06",
    billingadd2: "#05-11",
    postalcode: "233434",
    country_id: "1"
  },
  %{
    name: "Company07",
    brn: "11224454542",
    billingadd1: "someaddress07",
    billingadd2: "#02-11",
    postalcode: "234334",
    country_id: "4"
  },
  %{
    name: "Company08",
    brn: "1124535422",
    billingadd1: "someaddress08",
    billingadd2: "#02-11",
    postalcode: "234334",
    country_id: "4"
  },
  %{
    name: "Company09",
    brn: "11254535422",
    billingadd1: "someaddress09",
    billingadd2: "#02-11",
    postalcode: "234334",
    country_id: "4"
  },
  %{
    name: "Company010",
    brn: "4322213122",
    billingadd1: "someaddress10",
    billingadd2: "#02-11",
    postalcode: "234334",
    country_id: "4"
  }
]

contacts = [
  %{
    name: "Bob",
    email: "bob@test.com.sg",
    mobileno: "112233344",
    officeno: "333343423",
    location: "SomeLocation01",
    company_id: "1"
  },
  %{
    name: "Jane",
    email: "jane@test.com.my",
    mobileno: "545433344",
    officeno: "564543423",
    location: "SomeLocation02",
    company_id: "2"
  },
  %{
    name: "Izzy",
    email: "izzy@test.com.my",
    mobileno: "665653344",
    officeno: "766767643423",
    location: "SomeLocation3",
    company_id: "3"
  },
  %{
    name: "Rock",
    email: "rock@test.com.my",
    mobileno: "665445444",
    officeno: "64443423",
    location: "SomeLocation4",
    company_id: "4"
  },
  %{
    name: "Rockie",
    email: "rockie@test.com.my",
    mobileno: "665445444",
    officeno: "64443423",
    location: "SomeLocation4",
    company_id: "4"
  },
  %{
    name: "Rocky",
    email: "rocky@test.com.my",
    mobileno: "665445444",
    officeno: "64443423",
    location: "SomeLocation4",
    company_id: "4"
  },
  %{
    name: "Pock",
    email: "pock@test.com.my",
    mobileno: "665445444",
    officeno: "64443423",
    location: "SomeLocation4",
    company_id: "4"
  },
  %{
    name: "Pockie",
    email: "pockie@test.com.my",
    mobileno: "665445444",
    officeno: "64443423",
    location: "SomeLocation4",
    company_id: "4"
  },
  %{
    name: "Pocky",
    email: "Pock@test.com.my",
    mobileno: "665445444",
    officeno: "64443423",
    location: "SomeLocation4",
    company_id: "4"
  },
  %{
    name: "Poock",
    email: "poock@test.com.my",
    mobileno: "665445444",
    officeno: "64443423",
    location: "SomeLocation4",
    company_id: "4"
  }
]

contracts = [
  %{
    do: "",
    po: "4524343F",
    itq: "",
    startdate: "2020-01-01",
    enddate: "2025-01-01",
    type: "PM",
    svcalloperdevice: "4",
    timeallo: "5000",
    value: "10000",
    active: true,
    contractno: "20200101001",
    company_id: "1",
    careof_id: "1",
    remarks: "Some Remark"
  },
  %{
    do: "232132",
    po: "54544454A",
    itq: "343324",
    startdate: "2019-01-01",
    enddate: "2020-12-01",
    type: "PM",
    svcalloperdevice: "2",
    timeallo: "",
    value: "5000",
    active: true,
    contractno: "201912010112",
    company_id: "2",
    careof_id: "1",
    remarks: "no remarks"
  },
  %{
    do: "",
    po: "3542334343C",
    itq: "",
    startdate: "2018-06-01",
    enddate: "2025-05-30",
    type: "PM",
    svcalloperdevice: "4",
    timeallo: "",
    value: "20000",
    active: true,
    contractno: "201806001111",
    company_id: "3",
    careof_id: "1",
    remarks: ""
  },
  %{
    do: "",
    po: "324324",
    itq: "23213",
    startdate: "2018-08-01",
    enddate: "2020-07-30",
    type: "PM",
    svcalloperdevice: "4",
    timeallo: "",
    value: "8899",
    active: true,
    contractno: "201801010111",
    company_id: "4",
    careof_id: "1",
    remarks: "Nothing"
  },
  %{
    do: "",
    po: "324324",
    itq: "23213",
    startdate: "2018-08-01",
    enddate: "2020-07-30",
    type: "PM",
    svcalloperdevice: "4",
    timeallo: "",
    value: "8899",
    active: true,
    contractno: "201801010111",
    company_id: "2",
    careof_id: "1",
    remarks: "Nothing"
  },
  %{
    do: "",
    po: "324324",
    itq: "23213",
    startdate: "2018-08-01",
    enddate: "2020-07-30",
    type: "PM",
    svcalloperdevice: "4",
    timeallo: "",
    value: "8899",
    active: true,
    contractno: "201801010111",
    company_id: "3",
    careof_id: "1",
    remarks: "Nothing"
  },
  %{
    do: "",
    po: "3665324",
    itq: "223213",
    startdate: "2018-08-01",
    enddate: "2020-07-30",
    type: "PM",
    svcalloperdevice: "4",
    timeallo: "",
    value: "8899",
    active: true,
    contractno: "201801010111",
    company_id: "4",
    careof_id: "1",
    remarks: "Nothing"
  },
  %{
    do: "",
    po: "54654324",
    itq: "23213",
    startdate: "2018-08-01",
    enddate: "2020-07-30",
    type: "PM",
    svcalloperdevice: "4",
    timeallo: "",
    value: "8899",
    active: true,
    contractno: "201801010111",
    company_id: "1",
    careof_id: "1",
    remarks: "Nothing"
  },
  %{
    do: "",
    po: "656524324",
    itq: "2413",
    startdate: "2018-08-01",
    enddate: "2020-07-30",
    type: "PM",
    svcalloperdevice: "4",
    timeallo: "",
    value: "8899",
    active: true,
    contractno: "201801010111",
    company_id: "1",
    careof_id: "1",
    remarks: "Nothing"
  },
  %{
    do: "",
    po: "77324",
    itq: "56213",
    startdate: "2018-08-01",
    enddate: "2020-07-30",
    type: "PM",
    svcalloperdevice: "4",
    timeallo: "",
    value: "8899",
    active: true,
    contractno: "201801010111",
    company_id: "1",
    careof_id: "1",
    remarks: "Nothing"
  },
  %{
    do: "",
    po: "94324",
    itq: "533213",
    startdate: "2018-08-01",
    enddate: "2020-07-30",
    type: "PM",
    svcalloperdevice: "4",
    timeallo: "",
    value: "8899",
    active: true,
    contractno: "201801010111",
    company_id: "1",
    careof_id: "1",
    remarks: "Nothing"
  }
]

devices = [
  %{
    serialno: "3434221232",
    brand: "Kodak",
    model: "i3200",
    currentlocation: "Some office level floor 7",
    remarks: "call before service",
    contract_id: "1",
    active: true
  },
  %{
    serialno: "664543543",
    brand: "Fujitsu",
    model: "ix1600",
    currentlocation: "some office",
    remarks: "some remark",
    contract_id: "2",
    active: true
  },
  %{
    serialno: "44545433243",
    brand: "Zetuschel",
    model: "OS C2",
    currentlocation: "ANRI",
    remarks: "Under Tata",
    contract_id: "4",
    active: true
  },
  %{
    serialno: "3454645435",
    brand: "Mekel",
    model: "MEKEL VIEWSCAN M200",
    currentlocation: "Office",
    remarks: "something",
    contract_id: "2",
    active: true
  },
  %{
    serialno: "345wew645435",
    brand: "Kodak",
    model: "i3300",
    currentlocation: "Office",
    remarks: "something",
    contract_id: "3",
    active: true
  },
  %{
    serialno: "3454645435",
    brand: "Mekel",
    model: "MEKEL VIEWSCAN M200",
    currentlocation: "Office",
    remarks: "something",
    contract_id: "2",
    active: true
  },
  %{
    serialno: "34535435",
    brand: "Fujitsu",
    model: "ix1600",
    currentlocation: "Office",
    remarks: "something",
    contract_id: "4",
    active: true
  },
  %{
    serialno: "34535435",
    brand: "Fujitsu",
    model: "ix1600",
    currentlocation: "Office",
    remarks: "something",
    contract_id: "4",
    active: true
  },
  %{
    serialno: "34535435",
    brand: "Fujitsu",
    model: "ix1600",
    currentlocation: "Office",
    remarks: "something",
    contract_id: "4",
    active: true
  },
  %{
    serialno: "34535435",
    brand: "Fujitsu",
    model: "ix1600",
    currentlocation: "Office",
    remarks: "something",
    contract_id: "4",
    active: true
  },
  %{
    serialno: "34535435",
    brand: "Fujitsu",
    model: "ix1600",
    currentlocation: "Office",
    remarks: "something",
    contract_id: "4",
    active: true
  },
  %{
    serialno: "34535435",
    brand: "Fujitsu",
    model: "ix1600",
    currentlocation: "Office",
    remarks: "something",
    contract_id: "4",
    active: true
  },
  %{
    serialno: "34535435",
    brand: "Fujitsu",
    model: "ix1600",
    currentlocation: "Office",
    remarks: "something",
    contract_id: "4",
    active: true
  },
  %{
    serialno: "34535435",
    brand: "Fujitsu",
    model: "ix1600",
    currentlocation: "Office",
    remarks: "something",
    contract_id: "4",
    active: true
  },
  %{
    serialno: "34535435",
    brand: "Fujitsu",
    model: "ix1600",
    currentlocation: "Office",
    remarks: "something",
    contract_id: "4",
    active: true
  },
  %{
    serialno: "34535435",
    brand: "Fujitsu",
    model: "ix1600",
    currentlocation: "Office",
    remarks: "something",
    contract_id: "4",
    active: true
  },
  %{
    serialno: "34535435",
    brand: "Fujitsu",
    model: "ix1600",
    currentlocation: "Office",
    remarks: "something",
    contract_id: "4",
    active: true
  },
]

records = [
  %{svcno: "11221122",
  svcdate: "2020-01-01",
  timeused: "30",
  device_id: "1",
  contact_id: "1",
  createdby_id: "1",
  engineer_id: "2"
  },
  %{svcno: "11221123",
  svcdate: "2020-01-01",
  timeused: "30",
  device_id: "1",
  contact_id: "1",
  createdby_id: "1",
  engineer_id: "2"
  },
  %{svcno: "11221332",
  svcdate: "2020-01-01",
  timeused: "30",
  device_id: "1",
  contact_id: "1",
  createdby_id: "1",
  engineer_id: "2"
  },
  %{svcno: "11233122",
  svcdate: "2020-01-01",
  timeused: "30",
  device_id: "1",
  contact_id: "1",
  createdby_id: "1",
  engineer_id: "2"
  },
  %{svcno: "13321122",
  svcdate: "2020-01-01",
  timeused: "30",
  device_id: "1",
  contact_id: "1",
  createdby_id: "1",
  engineer_id: "2"
  },
  %{svcno: "13331122",
  svcdate: "2020-01-01",
  timeused: "30",
  device_id: "1",
  contact_id: "1",
  createdby_id: "1",
  engineer_id: "2"
  },
  %{svcno: "14441122",
  svcdate: "2020-01-01",
  timeused: "30",
  device_id: "1",
  contact_id: "1",
  createdby_id: "1",
  engineer_id: "2"
  }
]

Enum.each(countries, fn(data)->
  Countries.create_country(data)
end)
Enum.each(companies, fn(data)->
  Companies.create_company(data)
end)
Enum.each(contacts, fn(data)->
  Contacts.create_contact(data)
end)
Enum.each(contracts, fn(data)->
  Contracts.create_contract(data)
end)
Enum.each(devices, fn(data)->
  Devices.create_device(data)
end)
Enum.each(records, fn(data)->
  Records.create_record(data)
end)
