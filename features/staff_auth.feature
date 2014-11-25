Feature: Staff auth
  In order to privately use system
  As a staff member
  I want to login and logout

  Scenario: Login action
    Given the system knows about the following staff:
      | name      | email            |
      | ali-ahmed | ali@ibochy.tk    |
      | nurshi    | nurshi@ibochy.tk |
    When the staff does login with attrs
      | attribute | type   | value       |
      | username  | String | ali-ahmed       |
      | password  | String | puper048super |
    Then the response is successive result of logging in

  Scenario: Logout action
    Given the system knows about the following staff:
      | name      | email            |
      | ali-ahmed | ali@ibochy.tk    |
      | nurshi    | nurshi@ibochy.tk |
    When the staff Sasha logouts without attrs
    Then the response is successive result of logging out
