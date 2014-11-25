Feature: Layout CRUD
  In order to make possible site editing
  As an editor
  I want to create, read, edit and delete layouts

  Scenario: Read layout
    Given the system knows about the following layouts:
      | name      |
      | Cafe345   |
      | School654 |
    When the editor requests the layout of School654
    Then the response is a one layout of School654
    And the one layout has the following attributes:
      | attribute | type   | value     |
      | name      | String | School654 |

  Scenario: Create layout action
    Given the system knows about the following layouts:
      | name      |
      | Cafe345   |
      | School654 |
    When the editor creates layout with attrs
      | attribute | type   | value     |
      | name      | String | School999 |
    Then the response is successive result of creation

  Scenario: Edit layout action
    Given the system knows about the following layouts:
      | name      |
      | Cafe345   |
      | School654 |
    When the editor edits layout of Cafe345 to attrs
      | attribute | type   | value      |
      | name      | String | Cafe_Bonch |
    Then the response is successive result of editing

#  Scenario: Delete template - who should delete tons of layouts?
# TODO add author name