@graphql
Feature: graphql query
  send graphql query

  Background:
    * dir: features/graphql
    * base uri: http://localhost:10081/graphql

  Scenario: basic query without specify operation name
    * graphql:
    """
    query bookById($id: String){
      book(id: $id) {
        title
        isbn
        author {
          name
        }
      }
    }
    """

    * variables:
    """
    {
      "id": "1"
    }
    """
    * send
    * verify: '$.data.book.title'='CSS Designer Guide'
    * verify: '$.data.book.isbn'='ISBN01123'
    * verify: '$.data.book.author.name'='someone'