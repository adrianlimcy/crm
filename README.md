# Crm

This is a simple CRM for companies that deal with serviceable equipment they sell or rent out.

Steps:
1. mix phx.new crm
2. Get into the folder
  - mix ecto.create
3. mix phx.gen.live Countries Country countries name:string
  - copy routes to router.ex
  - mix ecto.migrate
4. mix phx.gen.live Companies Company companies name:string billingadd1:text billingadd2:text postalcode:string country_id:references:countries
  - copy routes to router.ex
  - mix ecto.migrate
5. modify the company.ex to properly link to countries
  - remember to preload the data in companies so that it shows in the index
6. mix phx.gen.live Contacts Contact contacts name:string email:string mobileno:string officeno:string location:text company_id:references:companies
  - copy routes to router.ex
  - mix ecto.migrate
7. modify the contact.ex to properly link to companies
  - remember to preload the data in contact so that it shows up in index
8. mix phx.gen.live Contracts Contract contracts do:string po:string itq:string startdate:date enddate:date type:string svcalloperdevice:integer timeallo:integer value:float active:boolean company_id:references:companies
  - copy routes to router.ex
  - mix ecto.migrate
9. modify the contract.ex to properly link to companies