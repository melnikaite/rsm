Feature: rsmapi test
  In order to have a fun
  I want to get clips

Scenario:
  Given I am on the home page
  Then I should see "List of available new clips" within "h3"
  When I press "video_5"
  When I wait for AJAX
  Then I should see "avi"