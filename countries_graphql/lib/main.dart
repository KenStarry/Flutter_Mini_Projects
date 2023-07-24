import 'package:countries_graphql/mainscreen.dart';
import 'package:countries_graphql/services/graphql_config.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() => runApp(GraphQLProvider(
      client: GraphQlConfigClient(),
      child: const MaterialApp(
        home: MainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ));
