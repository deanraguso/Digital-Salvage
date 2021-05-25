# Digital Salvage
Deployed Application: https://digital-salvage.herokuapp.com/ 
GitHub: https://github.com/deanraguso/Digital-Salvage 

## Description
### Purpose
Digital Salvage is a marketplace website, dedicated to the trade of used computer parts, where clear product descriptions and classifications are paramount.

Users of the website can buy and sell their used computer parts, with all the functionality to communicate and transact payment to support the exchange.
### Functionality / Features
 - A user can create an account, using their email and a unique password.
 - Users can list an item, with a supporting image, stored in an AWS S3 bucket.
 - Users can buy a listed item, through Stripe, and view their order.
 - A buyer can message a seller directly to enquire about the product.

### Sitemap

### Screenshots

### Target Audience
This application is designed to cater to an educated audience, who have a decent level of understanding with what component they are selling, and what component they seek to buy.

There is a large number of people who have such understanding, and could benifit from a market system which uses specific part_type and specific names as part of the listing.

This is not intended for users who wish to sell old computers they know nothing about, or to people who cannot describe the component they wish to sell or buy.

### Tech Stack
- The back-end is done using Ruby on Rails.
- The database management system used in Postgresql.
- The front-end seen by the user is a combination of HTML, CSS and JavaScript (with some jQuery).
- The website is hosted on a Heroku server.
## The problem this app solves:
As technology advances, newer and better performing hardware is released yearly. Millions of people upgrade their setup, and often throw or stow away their old components.

Digital Salvage, gives the seller the oportunity to list their item in a marketplace designed specifically for the sale of computer components. It gives buyers the ability to shop for the hardware component required, without having to filter through unrelated products, as would occur when using a traditional platform like ebay or amazon.

This is the power of a niche marketplace, directed just on the trade of computer hardware components.

## Why this is a problem that needs solving:
Traditional marketplace applications, such as eBay and Amazon, allow for the sale of many types of products. But, when searching for a specific product, the buyer may need to filter out many incorrectly titled products, that may have nothing to do with the buyers item of interest.

If a marketplace were to emerge specific to the niche of used computer components, many computer builders would prefer to use it over existing solutions. It would reduce the time wasted filtering through incorrectly labelled products.

