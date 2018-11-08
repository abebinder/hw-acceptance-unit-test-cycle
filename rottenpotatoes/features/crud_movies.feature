Feature: Creating, Updating, and Deleting Movies
    As a movie enthusiast
    So that I can update the rotten potatoes data base
    I want to have the abillity to create and destroy movie in the databse

Background: movies in database
  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Alien                   | R      | 1979-05-25   |
  | Chicken Run             | G      | 21-Jun-2000  |

  And I am on the RottenPotatoes home page

Scenario: Adding a single movie
  Given I am on the homepage
  And I follow "Add new movie"
  And I fill in "Title" with "Fantastic Mr. Fox"
  And I press "Save Changes"
  Then I should see "Fantastic Mr. Fox"

Scenario: Adding a single movie
  Given I am on the details page for "The Incredibles"
  And I press "Delete"
  Then I should be on the homepage
  And I should see "Movie 'The Incredibles' deleted."
  And I should not see /td='The Incredibles'/
