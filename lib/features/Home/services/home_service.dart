import 'dart:convert';
import 'package:support__81/constant/colors.dart';
import 'package:support__81/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeServices {
  Future<ProductModel> fetchProducts({
    required int? pageNo,
    required double? shopNo,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String authToken = prefs.getString('x-auth-token') ?? '';
      final response = await http.get(
        Uri.parse('$url/allProducts?page=$pageNo&shopId=$shopNo'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken'
        },
      );
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return ProductModel.fromJson(data);
      } else {
        return ProductModel.fromJson(data);
      }
    } catch (e) {
      throw Exception("Null value get");
    }
  }
}

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  // List<ProductModel>? productList;
  HomeServices homeServices = HomeServices();

  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<ProductModel>(
            future:
                HomeServices().fetchProducts(pageNo: currentPage, shopNo: 2),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.products!.data!.length,
                        itemBuilder: (context, index) {
                          //print(snapshot.data!.products!.lastPage);
                          return Column(
                            children: [
                              SizedBox(height: 30),
                              Text(
                                snapshot
                                    .data!.products!.data![index].productName
                                    .toString(),
                              ),
                              SizedBox(height: 10),
                              Image.network(
                                snapshot.data!.products!.data![index].images![0]
                                    .toString(),
                                scale: 10,
                              )
                            ],
                          );
                        }),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (snapshot.data!.products!.currentPage! <=
                            snapshot.data!.products!.lastPage!.toInt())
                          InkWell(
                            onTap: () {
                              setState(() {
                                currentPage++;
                              });
                              print(currentPage);
                            },
                            child: Container(
                              width: 100,
                              height: 30,
                              color: Colors.red,
                              child: Center(
                                child: Text(
                                  "Next",
                                ),
                              ),
                            ),
                          ),
                        if (snapshot.data!.products!.currentPage! < 1)
                          InkWell(
                            child: Container(
                              width: 100,
                              height: 30,
                              color: Colors.black,
                              child: Center(
                                child: Text("Next"),
                              ),
                            ),
                          ),
                      ],
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}


//   Future<List<ProductModel>> fetchProducts({
//     required BuildContext context,
//     required double pageNo,
//     required double shopNo,
//   }) async {
//     List<ProductModel> productList = [];
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String authToken = prefs.getString('x-auth-token') ?? '';
//     Map<String, String> headers = {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $authToken'
//     };
//     try {
//       final response = await http.get(
//         Uri.parse('$url/api/allProducts?page=$pageNo&shopId=$shopNo'),
//         headers: headers,
//       );
//       var data = jsonDecode(response.body.toString());
//       httpErrorHandle(
//         response: response,
//         context: context,
//         onSuccess: () {
//           for (Map i in data) {
//             productList.add(
//               ProductModel.fromJson(data[i]),
//             );
//           }
//         },
//       );
//     } catch (e) {
//       showSnakeBar(context, e.toString());
//     }
//     print(productList);
//     return productList;
//   }