import 'package:countries_graphql/details_screen.dart';
import 'package:countries_graphql/queries/queries_impl.dart';
import 'package:countries_graphql/services/graphql_config.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Graph QL Tutorial"),
      ),
      body: Query(
        options: QueryOptions(
            document: gql(QueriesImpl().getContinentsDetails()),
            variables: const <String, dynamic>{
              "code": "EU"
            } // query variables are sent to the query widget
        ),

        //It is called when the Query widget make the request to server
        //  It is called with the data from the query
        // and is used to fetchmore for pagination and refetch the data
        builder: (result, {fetchMore, refetch}) {
          //  check if loading
          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (result.data == null) {
            return const Center(child: Text("Data not found"));
          }

          return ListView.builder(
              itemCount: result.data!["continent"]["countries"].length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    //  open details screen and display country code
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>
                            DetailsScreen(countryCode: result
                                .data!["continent"]["countries"][index]["code"]))
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    margin: const EdgeInsets.only(bottom: 24),
                    color: Colors.redAccent,
                    child: Column(
                      children: [
                        Text(result.data!["continent"]["countries"][index]
                        ["name"]),
                        Text(
                            "Phone Number -> ${result
                                .data!["continent"]["countries"][index]["phone"]}"),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
