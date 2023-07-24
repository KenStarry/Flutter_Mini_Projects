import 'package:countries_graphql/queries/queries.dart';

class QueriesImpl implements Queries {
  @override
  String getContinentsQuery() => """
    query getContinent(\$code: ID!) {
      continent(code: \$code) {
        name 
        countries{
          name
          code
        }
      }
    }
  """;

  @override
  String getContinentsDetails() => """
    query getMyContinents(\$code: ID!) {
      continent(code: \$code) {
        name
        countries {
          capital
          currency
          emoji
          phone
          code
          name
        }
      }
    }
  """;

  @override
  String getCountryDetails() => """
    query getCountryDetails(\$code: ID!) {
      country(code: \$code) {
        awsRegion
        capital
        code
        continent {
          code
          name
        }
        currency
        name
        native
        phone
        phones
        states {
          code
          name
        }
        subdivisions {
          code
          emoji
          name
        }
      }
    }
  """;
}
