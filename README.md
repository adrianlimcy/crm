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
10. Work on the drop down lists by listing all and using Enum.map
  - Countries in Company
  - Companies in Contacts
  - Companies in Contracts
    - modify the index.ex defp apply actions for the new and edit to assign the respective variables
    - pass the variable through index.html.heex to form_component
    - Enum.map in the options for the select type
11. Add c/o and remarks and contractno into contracts
    - mix ecto.migration add_careof_and_remarks
    - alter contracts table to add careof and remarks
    - update contract.ex to include the new fields
    - mix ecto.migrate
12. mix phx.gen.live Devices Device devices contract_id:references:contracts serialno:string brand:string model:string currentlocation:text active:boolean remarks:text
  - copy routes to router.ex
  - mix ecto.migrate
13. modify the device.ex to properly link to companies and contracts
14. Work on the drop down lists by listing all and using Enum.map
  - Companies in Devices
  - Contracts in Devices
15. Create the dummy database entries in seeds.exs
16. Create the simple authentication with user and profiles
  - https://github.com/adrianlimcy/accountwithprofiledemo
  - mix phx.gen.auth Accounts User users
  - mix deps.get
  - mix ecto.migrate
17. mix ecto.gen.migration add_name_profile_role
  - added profile, role and active
  - add in migration changes
  - add fields in user.ex and amend changeset
18. Follow the steps in the github link
19. adding pagination for all tables
  - https://github.com/adrianlimcy/phoenix_pagination
  - add {:scrivener_ecto, "~> 2.7"} to mix.exs within defp deps
  - mix deps.get
  - set use Scrivener, page_size: 5 in lib/crm/repo.ex
20. create function in lib/crm/devices.ex
  - def paginate_devices
  - modify lib/crm_web/live/device_live/index.ex in def mount sockets
  - have to amend show.ex to include the load the associations so that the dropdown works
21. do the same for
  - contracts
  - contact
  - company
  - country


To do:
22. mix phx.gen.live Records Record records svcno:string svcdate:date timeused:integer device_id:reference:devices contact_id:reference:contacts engineer_id:reference:users createdby_id:reference:users
  - should I create a next in the modal to filter the contacts? Or figure out a way to filter contacts via device_id -> contract+id -> company_id -> contacts?
  - try to paginate list using https://github.com/drewolson/scrivener_ecto
