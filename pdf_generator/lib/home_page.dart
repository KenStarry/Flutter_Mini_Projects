import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:open_document/my_files/init.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () async{
            var myPdf = await createPdf();
            savePdf("myPdf", myPdf);
          },
          child: Text("Generate PDF"),
        ),
      ),
    );
  }
}

Future<Uint8List> createPdf() async {
  var pdf = pw.Document();

  pdf.addPage(pw.Page(
    build: (pwContext) {
      return pw.Center(
        child: pw.Text("Hello World")
      );
    }
  ));

  return pdf.save();
}

Future<void> savePdf(String fileName, Uint8List byteList) async {

  final output = await getTemporaryDirectory();
  var filePath = "${output.path}/$fileName.pdf";
  var file = File(filePath);

  //  writing to our pdf
  await file.writeAsBytes(byteList);
  //  open our pdf
  await OpenDocument.openDocument(filePath: filePath);
}



















