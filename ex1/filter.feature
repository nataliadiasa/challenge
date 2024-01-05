@filter
Feature: User Filter 

    Scenario: Existent Natural Person
      Given I visit get user
      When I click the "Person Type"
      And I select "PF" in the option "Person Type"
      And I click the "Name"
      And I write "Monkey D Luffy" in element "Name"
      And I click the "Email"
      And I write "monkeydluffy@qa.com.br" in element "Email"
      And I click the "Filter Button"
      And I can see user with name "Monkey D Luffy" and email "monkeydluffy@qa.com.br" and person type "PF" in get users list

    Scenario: Existent Legal Person
      Given I visit get user
      When I click the "Person Type"
      And I can see element "Person Type"
      And I select "PJ" in the option "Person Type"
      And I click the "Email"
      And I write "vinsmokesanji@cooker.com.br" in element "Email"
      And I click the "Filter Button"
      And I can see user with name "Vinsmoke Sanji" and email "vinsmokesanji@cooker.com.br" and person type "PJ" in get users list


    Scenario: Existent Person Type Name Filter
      Given I visit get user
      When I click the "Person Type"
      And I can see element "Person Type"
      And I select "PF" in the option "Person Type"
      And I click the "Name"
      And I write "Roronoa Zoro" in element "Name"
      And I click the "Filter Button"
      And I can see user with name "Roronoa Zoro" and email "roronoazoro@ronin.com.br" and person type "PF" in get users list

    Scenario: Check Clean Filter
      Given I visit get user
      When I click the "Person Type"
      And I can see element "Person Type"
      And I select "PF" in the option "Person Type"
      And I click the "Name"
      And I write "Roronoa Zoro" in element "Name"
      And I click the "Clean Filter"
      And I check element "Name" is empty
      And I check element "Person Type" is empty
      And I check element "Email" is empty

    Scenario: Non Existent User Email
      Given I visit get user
      When I set email field to invalid-email@invalid-domain.com
      And I click the "Filter Button"
      Then We check error message "Email doesn't exist"

    Scenario: Non Existent User Name
      Given I visit get user
      When I click the "Person Type"
      And I can see element "Person Type"
      And I select "PF" in the option "Person Type"
      And I click the "Name"
      And I write "***%%%" in element "Name"
      And I click the "Filter Button"
      Then We check error message "Don't use special character"