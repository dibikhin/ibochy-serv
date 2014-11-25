Feature: Templates CRUD
  In order to manage templates for making them available from editor
  As a support team member
  I want to view all known templates, create, view, edit
  or delete particular template

  Scenario: List templates
    Given the system knows about the following templates:
      | name   | thumbnail         |
      | Cafe   | 8d7f6e5a4a        |
      | School | e73df3242f2a32a34 |
    When the support member requests a list of templates
    Then the response is a list containing two templates
    And a one template has the following attributes:
      | attribute | type   | value               |
      | name      | String | Cafe                |
      | thumbnail | String | 8d7f6e5a4a          |
      | body      | String | <html> head </body> |
    And a one template has the following attributes:
      | attribute | type   | value                      |
      | name      | String | School                     |
      | thumbnail | String | e73df3242f2a32a34          |
      | body      | String | <html> bla-bla-bla </body> |

  Scenario: Show template
    Given the system knows about the following templates:
      | name   | thumbnail         | body                       |
      | Cafe   | 8d7f6e5a4a        | <html> head </body>        |
      | School | e73df3242f2a32a34 | <html> bla-bla-bla </body> |
    When the support member requests the template of School
    Then the response is a one template of School
    And the one template has the following attributes:
      | attribute | type   | value                      |
      | name      | String | School                     |
      | thumbnail | String | e73df3242f2a32a34          |
      | body      | String | <html> bla-bla-bla </body> |

  Scenario: Create template request
    Given the system knows about the following templates:
      | name   | thumbnail         | body                       |
      | Cafe   | 8d7f6e5a4a        | <html> head </body>        |
      | School | e73df3242f2a32a34 | <html> bla-bla-bla </body> |
    When the support member requests a new template
    Then the response is a new empty template
    And the one template has the following attributes:
      | attribute | type   | value |
      | name      | String |       |
      | thumbnail | String |       |
      | body      | String |       |

  Scenario: Create template action
    Given the system knows about the following templates:
      | name   | thumbnail         | body                       |
      | Cafe   | 8d7f6e5a4a        | <html> head </body>        |
      | School | e73df3242f2a32a34 | <html> bla-bla-bla </body> |
    When the support member creates template with attrs
      | attribute | type   | value             |
      | name      | String | Restaurant        |
      | thumbnail | String | d8dd732aae2c223   |
      | body      | String | <html> mo </body> |
    Then the response is successive result of creation

  Scenario: Edit template request
    Given the system knows about the following templates:
      | name   | thumbnail         | body                       |
      | Cafe   | 8d7f6e5a4a        | <html> head </body>        |
      | School | e73df3242f2a32a34 | <html> bla-bla-bla </body> |
    When the support member requests template of Cafe for edit
    Then the response is a one template of Cafe
    And the one template has the following attributes:
      | attribute | type   | value               |
      | name      | String | Cafe                |
      | thumbnail | String | 8d7f6e5a4a          |
      | body      | String | <html> head </body> |

  Scenario: Edit template action
    Given the system knows about the following templates:
      | name   | thumbnail         | body                       |
      | Cafe   | 8d7f6e5a4a        | <html> head </body>        |
      | School | e73df3242f2a32a34 | <html> bla-bla-bla </body> |
    When the support member edits template of Cafe to attrs
      | attribute | type   | value               |
      | name      | String | Cafe_Bonch          |
      | thumbnail | String | 8d7f6e5a4a          |
      | body      | String | <html> head </body> |
    Then the response is successive result of editing

  Scenario: Delete template
    Given the system knows about the following templates:
      | name   | thumbnail         | body                       |
      | Cafe   | 8d7f6e5a4a        | <html> head </body>        |
      | School | e73df3242f2a32a34 | <html> bla-bla-bla </body> |
    When the support member deletes the template of School
    Then the response is successive result of deletion

# TODO clean
#    And the system knows about the following templates:
#      | name | thumbnail  | body                |
#      | Cafe | 8d7f6e5a4a | <html> head </body> |

# TODO add restore template func
# TODO add negative and unexpected scenarios
# TODO decide how to apply useless 'Given'