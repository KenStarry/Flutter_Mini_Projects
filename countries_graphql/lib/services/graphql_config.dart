import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

ValueNotifier<GraphQLClient> GraphQlConfigClient() {

  //  setting url endpoint
  HttpLink httpLink = HttpLink("https://countries.trevorblades.com/");

  //  notifies listeners upon changing a value
  final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(

      ),
      defaultPolicies: DefaultPolicies()
    )
  );

  return client;
}