### To The Market API

USDA Farmer's Market Data, parsed from a CSV and put into a beautiful RESTful API!

#### Usage

[**Production URL**](http://freshfinder.us)

`/api/v1/markets` is a list of all the farmer's markets in the U.S. by name

`/api/v1/markets?address=true` appends the address of each market to the original index of markets

`/api/v1/markets/:market_id/payment_types` is a listing of the types of payments a particular market takes

`/api/v1/markets/:market_id/products` is a listing of the types of products you can expect to find at this market
