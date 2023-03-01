// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:support__81/features/Home/services/home_service.dart';
import 'package:flutter/material.dart';
import 'package:support__81/features/Offers%20&%20Deals/widget/product_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGridView extends StatefulWidget {
  final bool isOfferProducts;
  const CustomGridView({
    Key? key,
    this.isOfferProducts = false,
  }) : super(key: key);

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  HomeServices homeServices = HomeServices();
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HomeServices().fetchProducts(
        pageNo: _currentPage,
        shopNo: 2,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final productsInfo = snapshot.data!.products!;
          // if(productsInfo != null && productsInfo.data!.isNotEmpty){ }
          return Column(
            children: [
              Expanded(
                // Showing Products
                child: GridView.builder(
                  padding: EdgeInsets.only(left: 10.w, bottom: 10.h),
                  itemCount: productsInfo.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width > 383
                        ? 1 / 1.65
                        : 1 / 1.40,
                  ),
                  itemBuilder: (context, index) {
                    final product = productsInfo.data![index];
                    return ProductsTile(
                      isOfferProducts: widget.isOfferProducts,
                      productImg: product.images![0],
                      productName: product.productName!.toString(),
                      productPrice: product.price!.toString(),
                      productId: product.id!.toDouble(),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              // Pagination
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Pervious page Button
                  if (snapshot.data!.products!.currentPage! < 1)
                    InkWell(
                      onTap: () {
                        setState(() {
                          _currentPage--;
                        });
                      },
                      child: Container(
                        width: 100,
                        height: 30,
                        color: Colors.red,
                        child: Center(
                          child: Text("Per"),
                        ),
                      ),
                    ),
                  SizedBox(width: 15.w),
                  // Next Page Button
                  if (snapshot.data!.products!.currentPage! <
                      snapshot.data!.products!.lastPage!.toInt())
                    InkWell(
                      onTap: () {
                        setState(() {
                          _currentPage++;
                        });
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
                ],
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
