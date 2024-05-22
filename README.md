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
5. modify the company.ex to link properly to countries
6. remember to preload the data in companies so that it shows in the index
7.
