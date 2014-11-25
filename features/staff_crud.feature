Feature: Staff CRUD
  In order to manage staff who helps authors
  As a superuser
  I want to view all staff, create new members, edit or view particular
  existing members, suspend them, <!! view action history !!>

  Scenario: List staff
    Given the system knows about the following staff:
      | name      | email            |
      | ali-ahmed | ali@ibochy.tk    |
      | nurshi    | nurshi@ibochy.tk |
    When the superuser requests a list of staff
    Then the response is a list containing two staff
    And a one staff has the following attributes:
      | attribute | type   | value         |
      | name      | String | ali-ahmed     |
      | email     | String | ali@ibochy.tk |
    And a one staff has the following attributes:
      | attribute | type   | value            |
      | name      | String | nurshi           |
      | email     | String | nurshi@ibochy.tk |

  Scenario: Show staff member
    Given the system knows about the following staff:
      | name      | email            |
      | ali-ahmed | ali@ibochy.tk    |
      | nurshi    | nurshi@ibochy.tk |
    When the superuser requests the staff named Ali-ahmed
    Then the response is a one staff named Ali-ahmed
    And the one staff has the following attributes:
      | attribute | type   | value         |
      | name      | String | ali-ahmed     |
      | email     | String | ali@ibochy.tk |

  Scenario: Create staff member request
    Given the system knows about the following staff:
      | name      | email            |
      | ali-ahmed | ali@ibochy.tk    |
      | nurshi    | nurshi@ibochy.tk |
    When the superuser requests a new staff
    Then the response is a new empty staff
    And a one staff has the following attributes:
      | attribute | type   | value |
      | name      | String |       |
      | email     | String |       |

  Scenario: Create staff member action
    Given the system knows about the following staff:
      | name      | email            |
      | ali-ahmed | ali@ibochy.tk    |
      | nurshi    | nurshi@ibochy.tk |
    When the superuser creates staff with attrs
      | attribute | type   | value         |
      | name      | String | ali-ahmed     |
      | email     | String | ali@ibochy.tk |
    Then the response is successive result of creation w/ new staff

  Scenario: Edit staff member request
    Given the system knows about the following staff:
      | name      | email            |
      | ali-ahmed | ali@ibochy.tk    |
      | nurshi    | nurshi@ibochy.tk |
    When the superuser requests staff named Ali-ahmed for edit
    Then the response is a one staff of Ali-ahmed
    And the one staff has the following attributes:
      | attribute | type   | value         |
      | name      | String | ali-ahmed     |
      | email     | String | ali@ibochy.tk |

  Scenario: Edit staff member action
    Given the system knows about the following staff:
      | name      | email            |
      | ali-ahmed | ali@ibochy.tk    |
      | nurshi    | nurshi@ibochy.tk |
    When the superuser edits staff named Ali-ahmed to attrs
      | attribute | type   | value               |
      | name      | String | ali-ahmed           |
      | email     | String | new-email@ibochy.tk |
    Then the response is successive result of editing

  Scenario: Delete staff member
    Given the system knows about the following staff:
      | name      | email            |
      | ali-ahmed | ali@ibochy.tk    |
      | nurshi    | nurshi@ibochy.tk |
    When the superuser deletes the staff of School
    Then the response is successive result of deletion