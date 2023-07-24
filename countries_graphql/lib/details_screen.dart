import 'package:countries_graphql/queries/queries_impl.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DetailsScreen extends StatelessWidget {
  final String countryCode;

  const DetailsScreen({Key? key, required this.countryCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Query(
        options: QueryOptions(
            document: gql(QueriesImpl().getCountryDetails()),
            variables: <String, String>{"code": countryCode}),
        builder: (result, {fetchMore, refetch}) {
          //  if loading
          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.redAccent),
            );
          }

          //  if is null, show empty text
          if (result.data == null) {
            return const Center(child: Text("No Data Found!"));
          }

          //  else return the data
          return SafeArea(
              child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  result.data!["country"]["name"],
                  style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}
