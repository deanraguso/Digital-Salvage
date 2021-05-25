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

### Target Audience
This application is designed to cater to an educated audience, who have a decent level of understanding with what component they are selling, and what component they seek to buy.

There is a large number of people who have such understanding, and could benifit from a market system which uses specific part_type and specific names as part of the listing.

This is not intended for users who wish to sell old computers they know nothing about, or to people who cannot describe the component they wish to sell or buy.

### Tech Stack:
- The back-end is done using Ruby on Rails.
- The database management system used in Postgresql.
- The front-end seen by the user is a combination of HTML, CSS and JavaScript (with some jQuery).
- The website is hosted on a Heroku server.
## High-Level Components:
There are several high-level components within my application. The user, items, orders, the inbox, and the message.
## Third Party Services:
This application made use of 3 third party services, Stripe for the handling of payments, and Amazon Web Service's (AWS) Simple Storage Service (S3) for the storage of user uploaded images. Lastly, the application made use of Heroku web hosting service, to the make application available to the public.

These applications required the developer (myself), to sign up to their platform separately to obtain a set of Application Program Interface (API) keys. These API keys can be added through encryption to the application, giving it the ability to perform tasks authorized by myself. 

<strong>Stripe</strong> for example, allows the application to redirect the user to a secure website, where they can enter their credit card information to pay for a product. This would go into the site owners account, and can then be payed to the seller minus the fee of using the website.

The purpose of using Stripe, is compliance and simplcity. There are laws that govern how information is stored on the internet, if my website was hacked or accidentally leaked client credit card information, the site owner is liable. Stripe, for a small fee, takes on that liability.

Through the use of a web-hook, redirection after payment sccess or failure is also quite easy, saving a step in the development proccess.

<strong>AWS S3</strong> as the name implies, is a simple storage service. It gives the owner the ability to create a "bucket" or directory hosted online, specifically for the storage of large files to be called upon by other web applications.

S3 is highly scalable, depending on the package you choose, you can have whatever speed of file retrieval required to meet your websites demands, for a price. You can also give the bucket access rules, so the filesare only available to the domains you permit.

<strong>Heroku</strong>
Heroku acts as a repository, which then gets hosted similarly to how it is locally, but on a globally available domain. 

It's simple to use, you install the Heroku CLI, and from there, git push to the remotely configured respository on heroku. You can debug, and use the Rails console also through the CLI.
## Task Tracking:
GitHub Projects: https://github.com/deanraguso/Digital-Salvage/projects?query=is%3Aclosed 

On this occassion, I wanted to split my big project down into many smaller projects to be worked on incrementally, I found GitHub projects to be an adequate tool for the job.

The advantage is that because the interface is always one click away from the repository files, it's easy to tab over to and update as the project develops. Once the project is complete, it gets closed, disapearing to the closed tab (linked above), helps to see the remaining tasks in the project decreasing.

I identified 5 sub projects, which I lumped into the "Application Build" project.
- Base development - for the basic structure and creation of the application, including users and their items.
- Layout - for the styling of the website with bootstrap.
- Order System - for the model, controllers and views associated with recorded user purchases.
- Instant Messaging System - for the communication between users.
- Major Refactor - to make the code clean after initial development, optimising queries and making the code healthier.

Each of these sub projects had their own project. This allowed me to complete the project sequentially, as I though development should occur to minimize breaking changes.

Within each project is a KanBan style system, of three lists, "To Do", "In Progress", and "Done". I found doing the project and updating the project task tracker was extremely helpful in keeping clear understanding of where I was, and how much left I had to do for a particular feature.

## The problem this app solves:
As technology advances, newer and better performing hardware is released yearly. Millions of people upgrade their setup, and often throw or stow away their old components.

Digital Salvage, gives the seller the oportunity to list their item in a marketplace designed specifically for the sale of computer components. It gives buyers the ability to shop for the hardware component required, without having to filter through unrelated products, as would occur when using a traditional platform like ebay or amazon.

This is the power of a niche marketplace, directed just on the trade of computer hardware components.

## Why this is a problem that needs solving:
Traditional marketplace applications, such as eBay and Amazon, allow for the sale of many types of products. But, when searching for a specific product, the buyer may need to filter out many incorrectly titled products, that may have nothing to do with the buyers item of interest.

If a marketplace were to emerge specific to the niche of used computer components, many computer builders would prefer to use it over existing solutions. It would reduce the time wasted filtering through incorrectly labelled products.

