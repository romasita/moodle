@core @core_message @javascript
Feature: Messaging preferences
  In order to be notified of messages
  As a user
  I need to be able to alter my message preferences

  Background:
    Given I log in as "admin"
    And I navigate to "Plugins > Message outputs > Manage message outputs" in site administration
    And I click on "//table[contains(@class, 'admintable')]/tbody/tr/td[contains(text(), 'Email')]/following-sibling::td[1]/a" "xpath_element"
    And the following config values are set as admin:
      | messaging | 1 |
      | messagingallusers | 1 |

  Scenario: Alter my message preferences
    Given I follow "Preferences" in the user menu
    And I click on "Message preferences" "link" in the "region-main" "region"
    And I should see "On" in the "[data-preference-key=message_provider_moodle_instantmessage] [data-state=loggedoff] .preference-state-status-container" "css_element"
    And I should not see "Off" in the "[data-preference-key=message_provider_moodle_instantmessage] [data-state=loggedoff] .preference-state-status-container" "css_element"
    And I click on "[data-preference-key=message_provider_moodle_instantmessage] [data-state=loggedoff] .preference-state-status-container" "css_element"
    And I reload the page
    Then I should see "Off" in the "[data-preference-key=message_provider_moodle_instantmessage] [data-state=loggedoff] .preference-state-status-container" "css_element"

  Scenario: Alter another users preferences
    Given the following "users" exist:
      | username | firstname | lastname | email            |
      | user1    | User      | 1        | user1@example.com    |
    And I navigate to "Users > Accounts > Browse list of users" in site administration
    And I click on "User 1" "link"
    And I click on "Preferences" "link" in the ".profile_tree" "css_element"
    And I click on "Message preferences" "link" in the "region-main" "region"
    And I should see "On" in the "[data-preference-key=message_provider_moodle_instantmessage] [data-state=loggedoff] .preference-state-status-container" "css_element"
    And I should not see "Off" in the "[data-preference-key=message_provider_moodle_instantmessage] [data-state=loggedoff] .preference-state-status-container" "css_element"
    And I click on "[data-preference-key=message_provider_moodle_instantmessage] [data-state=loggedoff] .preference-state-status-container" "css_element"
    And I reload the page
    Then I should see "Off" in the "[data-preference-key=message_provider_moodle_instantmessage] [data-state=loggedoff] .preference-state-status-container" "css_element"
