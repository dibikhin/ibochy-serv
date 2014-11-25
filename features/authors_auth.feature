Feature: Authors auth
  In order to use valuable features
  As an author
  I want to sign up, login, logout, suspend my account or restore forgotten password

#  Scenario: Sign up request
#    Given the system knows about the following authors:
#      | name  | email           |
#      | Sasha | sasha@pussy.com |
#    When the customer requests sign up
#    Then the response is new sign up

  Scenario: Login action
    Given the system knows about the following authors:
      | name  | email           |
      | Sasha | sasha@pussy.com |
    When the author does login with attrs
      | attribute | type   | value       |
      | username  | String | Sasha       |
      | password  | String | nanopass432 |
    Then the response is successive result of logging in

  Scenario: Sign up action
    Given the system knows about the following authors:
      | name  | email           |
      | Sasha | sasha@pussy.com |
    When the author does signup with attrs
      | attribute | type   | value               |
      | username  | String | klopkin             |
      | email     | String | klopkin@turtles.net |
      | password  | String | 678megapass         |
    Then the response is successive result of signing up

  Scenario: Logout action
    Given the system knows about the following authors:
      | name  | email           |
      | Sasha | sasha@pussy.com |
    When the author Sasha logouts without attrs
    Then the response is successive result of logging out

  Scenario: Restore password action
    Given the system knows about the following authors:
      | name  | email           |
      | Sasha | sasha@pussy.com |
    When the author Sasha restores without attrs
    Then the response is successive result of action

  Scenario: Suspend account action
    Given the system knows about the following authors:
      | name  | email           |
      | Sasha | sasha@pussy.com |
    When the author Sasha suspends without attrs
    Then the response is successive result of action
