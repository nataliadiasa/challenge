@breeds
Feature: Test GET methods in Breeds

    Scenario: GET Breeds response 200
        Given I set GET breeds API endpoint
        When I send GET http request
        Then I receive HTTP status 200
        And I check "current_page" in response body is equal to 1
        And I check "data" in response body has 25 elements

    Scenario: GET Breeds limit 10
        Given I set GET breeds API endpoint
        And I set query param "limit" to 10
        When I send GET http request
        Then I receive HTTP status 200
        And I check "current_page" in response body is equal to 1
        And I check "data" in response body has 10 elements

    Scenario: GET Breeds page 2
        Given I set GET breeds API endpoint
        And I set query param "page" to 2
        When I send GET http request
        Then I receive HTTP status 200
        And I check "current_page" in response body is equal to 2
        And I check "data" in response body has 25 elements

    Scenario: GET Breeds limit -1
        Given I set GET breeds API endpoint
        And I set query param "limit" to -1
        When I send GET http request
        Then I receive HTTP status 404

    Scenario: GET Breeds limit letters
        Given I set GET breeds API endpoint
        And I set query param "limit" to "abcd"
        When I send GET http request
        Then I receive HTTP status 404