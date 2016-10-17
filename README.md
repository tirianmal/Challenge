Notes from implementer:
  many functions are not optimized/performance tuned. Many operations involve
  asking DB for values (even if cached) repeatedly. This would be optimized as
  needed in future. This was a quick implementation as befits the nature of the
  exercise

  I do not have experience with RSPEC/CAPYBARA so I've attempted a few tests just
  to get a feel for the process. So far as I can tell, it is easy enough.
  However, the 'log_in/X' paths rely on setting session variables and apparently
  as I have Capybara/Rspec set up, this was NOT persisting. This may be 
  misunderstanding on my part about set up, or use of C/Rspec. Might be a bug.

  AJAX call to Play in Video#Show was done as a quick hack. I fully expect that 
  in a full dev environment standards for how to handle all this would have been
  established and I would have structured the HTML much better to assist in proper
  updating/re-writing of data on page. Or used a fuller featured framework for same.

  For now, it is what it is.


# :warning: DO NOT FORK THIS REPOSITORY :warning:

## Badge Challenges Application

### Overview of the application

This Application is a small Rails App that can be compared to a tiny Vodeclic App :)

You will find a "Company" model, linked to "User" and those users are also linked to "Video" and to "Badge" models.

A seed is present to let you start with some datas.
The UI Header let you logging as one of the four users present in the seed data.
Once a User is logged-in, accessing the "video#show" action will *link* a Video to the User.


### Challenge 1: Show Badges that belongs to a Company

You need to modify the "companies#show" action in order to show badges associated to a Company (through Users). The view should looks like "users#show":
* Company own a Badge once at least one of its users own one
* For each Badge that an Company own, you will have to show how many users own Badges

Notes:
* CSS Stylesheets is already present in the application and use a "Grid" system. The application use Ruby helpers in order to generate corresponding HTML tags for the grid, take a look at the "users/show" view for some inspiration. You can use any block type collection. Helpers are provided by the [r_kit](https://github.com/Saphyr/r_kit) Gem (code is the documentation!)
* A custom *decorator* logic is already implemented inside the Application - you don't need Gems to do that, if you want to understand how it works take a look at the "user" decorator.


### Challenge 2: Link a Badge to a User

The goal of this challenge is to define a logic that will automatically link a Badge to a User once required conditions are met.
This logic has to be as much flexible as possible because additional Badges could be created internally, with different behaviors, so the integration of those new Badges has to be simple.

Here is the obtained conditions for currently implemented Badges:
* "Halfway" Badge: User has to have viewed at least two videos
* "Allway" Badge: User has to have viewed all videos
* "SpeedRun" Badge: User has to have viewed the "Ruby classes" video only


### Challenge 3: Rebuild the "viewed" mecanism

The current "viewed" logic is too simple, you need to modify it and add a "play" button on the "video#show" view and then only trigger the "viewed" state once User clicked it (*Tips: use simple AJAX*).

This challenge is also a good opportunity to refactor the association between User and Video. For example today once a user watch multiple times the same video we create a new record each time - obviously this is not a great logic - you should add an "iteration" column on the joint table.


### Challenge 4: Adding tests using RSpec / Capybara

Everything is in the title :)


### Additional notes

The "companies" scaffold was once named "compagnies" due to a typo, but don't worry we fixed that for you ;)
