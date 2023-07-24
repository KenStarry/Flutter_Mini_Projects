class DataModel {
  final String title;
  final String imageName;
  final String price;

  DataModel(
      {required this.title, required this.imageName, required this.price});
}

List<DataModel> dataList = [
  DataModel(
      title: "Short Dress",
      imageName: "assets/images/lady2.jpg",
      price: "Ksh. 500"),
  DataModel(
      title: "Short Dress",
      imageName: "assets/images/lady3.jpg",
      price: "Ksh. 1500"),
  DataModel(
      title: "Short Dress",
      imageName: "assets/images/lady4.jpg",
      price: "Ksh. 200"),
  DataModel(
      title: "Short Dress",
      imageName: "assets/images/lady5.jpg",
      price: "Ksh. 350"),
  DataModel(
      title: "Short Dress",
      imageName: "assets/images/lady6.jpg",
      price: "Ksh. 750"),
];
