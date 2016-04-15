#SoTi

![Build Status](https://codeship.com/projects/1807a240-dcba-0133-b80a-760a1f8f56cd/status?branch=master)

![Code Climate](https://codeclimate.com/github/pablo-honeybear/SoTi.png)

![Coverage Status](https://coveralls.io/repos/pablo-honeybear/SoTi/badge.png)

"State of the Indie", or SoTi, is a group project website mockup created to review on-line independent web series. Users submit their favorite Web Series with brief description and links to the trailer and the series homepage. Users can also review other series that they are familiar with or that they have been lead to by the site. If a review is helpful or not helpful it can be voted up or down. A user can change their vote on a review as well as delete their vote, but cannot vote more than once.

The SoTi app implements these features:
 - The ability to add an item to be reviewed.
 - The ability to rate (score on a scale) the item and to optionally comment on it (i.e. write a review).
 - The ability to upvote or downvote a review. A user can only upvote or downvote once and can change their vote from up to down. This feature should utilize AJAX so that a complete page reload isn't necessary.
 - A sign up and authentication system for your users (with devise).
 - An ability to upload a profile photo (with CarrierWave).
 - The ability to search for items.
 - An admin role. Admins are able to delete reviews or items if they are deemed to be inappropriate.
 - Pagination (with Kaminari).

Our group used this project to test a number of web based technologies listed in no particular order.
- Ruby 2.2.3
- Rails 4.2.6
- HTML
- CSS
- Foundations
- SASS
- AJAX
- PostgreSQL
- Devise (Ruby Gem)
- Carrierwave (Ruby Gem)

We also implemented a number of course concepts in the development of our website.
- Object-oriented programming
- Object Relation Mapping
- Model-View-Controller design
- User Authentication
- TDD (Capybara)

Project authors: 
- Jenn Eng
- Eric Darsey
- Candace Hazlett
- Mike Hebert

Visit us at: https://best-soti.herokuapp.com/posts/34
