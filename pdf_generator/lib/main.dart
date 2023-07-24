import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf_generator/home_page.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> main() async {

  final pdf = pw.Document(
      title: "Hello PDF!!!"
  );

  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        //  describe the contents of your pdf
        return pw.Column(
            children: [
              pw.Text("Hello new PDF")
            ]
        );
      }
  ));


  final file = File('example.pdf');
  await file.writeAsBytes(await pdf.save());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

