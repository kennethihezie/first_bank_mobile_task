/**
 * Created by collins ihezie on 19/04/23
 */

class Api{
  static Map<String, dynamic> errorResponse = {
    "statusCode" : 400,
    "message": "An error occurred",
    "errors": [
      {
        "errorCode": "UNABLE_TO_READ",
        "message": "The table entry 'salary' does not exist"
      }
    ],
    "data": {}
  };

  static Map<String, dynamic> successResponse = {
    "statusCode" : 200,
    "message": "Successful!",
    "errors": null,
    "data": [
      {
        "customerId": 23399922,
        "firstName" : "Jonathan",
        "lastName": "Strange",
        "customerDob": "01-02-2014",
        "bvnMatch": "Y",
        "delinquentLoans": "N"
      },
      {
        "customerId": 23919191,
        "firstName" : "David",
        "lastName": "White",
        "customerDob": "01-01-1992",
        "bvnMatch": "N",
        "delinquentLoans": "N"
      },
      {
        "customerId": 23399233,
        "firstName" : "Jessica",
        "lastName": "Brown",
        "customerDob": "01-01-1991",
        "bvnMatch": "Y",
        "delinquentLoans": "Y"
      },
      {
        "customerId": 23292929,
        "firstName" : "Esther",
        "lastName": "Woods",
        "customerDob": "01-01-1990",
        "bvnMatch": "Y",
        "delinquentLoans": "N"
      },
    ]
  };
}