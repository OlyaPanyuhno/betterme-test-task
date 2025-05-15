Scenario Create Pet with valid data 
Given I have correct data <id>, <name>, <photoUrls>, <status>
When I send post request 
Then I recive status code 200 and correct data <id>, <name>, <photoUrls>, <status>

Examples:
| id  | name    | photoUrls     | status   |
| 405 | Marty_1 | linkWithPhoto | nice cat |

Scenario Creating pet with same id
Given I have pet with id '405'
When I send post request with id '405' again 
Then I recive an error that pet with this id already exists 
#actual: got 200 staus 

Scenario Validation for type data
Given I try to create pet with id 'abc'
#letters instead numbers
When I send post request 
Then I expect validation error 
#actual: 500 server error 

Scenario Absent field 
Given I try to create pet without 'name' field 
When I send post request 
Then I expect bad request
#actual: pet created without name

Scenario Send empty array 
Given I try to create pet with empty array "photoUrls": []
When I send post request 
Then I receive empty value for 'photoUrls' and pet created 

Scenario Create pet with two 'photoUrls'
Given I try to create pet with two 'photoUrls'
When I send post request 
Then I receive both links in response 

Scenario Not valid json file 
Given I try to create pet with incorect json 
#delete any bracket 
When I send post request 
Then I recive error 400 bad request

Scenario Create pet with 0 id
Given I try to create pet with 0 id
When I send post request
Then Pet created with random id

Scenario Create pet with long name 
Given I try to create pet with long name 
#1000+symbols 
When I send post request 
Then pet created with long name 
#actual: try 10000 and pet was created 