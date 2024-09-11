# api_asg

int this asgemt i used two pkg 

- http for api call 
- cached_network_image to handle img that have eorr or take to long 






---
### widget used

- UserCardWidget to show user info

- UserDataWidget to show user data in the card in row 


- HomePage : the only page that have tabbar for each api call



---

### networking

const_url : will save the url and endpoint to used it later and make less eorr when using the api

model folder here there is all model that will hold the data and show it later 

- img_mix : here have all api call that for img in it there is method to get img and with some simple logic take only the first 10 

- user_mix : same is img_mix in some way but this user have extar thing and that is will check if user want to serch by id or want to see all users in the system 