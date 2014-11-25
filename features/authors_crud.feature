Feature: Authors CRUD
  In order to monitor authors, help them to recall forgotten email for password restoration
  or stop suspicious author activity or stop all illegal sites of the author
  As a staff member
  I want to view all authors, view particular authors and suspend them

  Scenario: List authors
    Given the system knows about the following authors:
      | username | email           |
      | Sasha    | sasha@pussy.com |
      | Mary     | mary@dick.com   |
    When the staff member requests a list of authors
    Then the response is a list containing two authors
    And a one author has the following attributes:
      | attribute | type   | value           |
      | username  | String | Sasha           |
      | email     | String | sasha@pussy.com |
    And a one author has the following attributes:
      | attribute | type   | value         |
      | username  | String | Mary          |
      | email     | String | mary@dick.com |

  Scenario: Show author
    Given the system knows about the following authors:
      | username | email           |
      | Sasha    | sasha@pussy.com |
      | Mary     | mary@dick.com   |
    When the staff member requests the author named Sasha
    Then the response is a one author named Sasha
    And the one author has the following attributes:
      | attribute | type   | value           |
      | username  | String | Sasha           |
      | email     | String | sasha@pussy.com |

  Scenario: Edit author action
    Given the system knows about the following authors:
      | username | email           |
      | Sasha    | sasha@pussy.com |
      | Mary     | mary@dick.com   |
    When the staff member edits author named Sasha to attrs
      | attribute | type   | value                        |
      | username  | String | Sasha                        |
      | email     | String | new_email_of_sasha@pussy.com |
    Then the response is successive result of editing
