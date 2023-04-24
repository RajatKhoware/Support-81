// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductCarsouleImgs extends StatefulWidget {
  final List images;
  const ProductCarsouleImgs({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  State<ProductCarsouleImgs> createState() => _ProductCarsouleImgsState();
}

class _ProductCarsouleImgsState extends State<ProductCarsouleImgs> {
  CarouselController _controller = CarouselController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
            items: widget.images
                .map(
                  (e) => Builder(
                    builder: (context) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(e),
                          // fit: BoxFit.cover,
                        ),
                        //color: Colors.black,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Positioned(
          bottom: 10.h,
          left: 160.w,
          child: Row(
            children: widget.images
                .asMap()
                .entries
                .map(
                  (e) => InkWell(
                    onTap: () {
                      _controller.animateToPage(e.key);
                    },
                    child: widget.images.length > 1
                        ? Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            width: _currentPage == e.key ? 25.w : 6.w,
                            height: _currentPage == e.key ? 6.h : 6.h,
                            decoration: BoxDecoration(
                              borderRadius: _currentPage == e.key
                                  ? BorderRadius.circular(20.r)
                                  : null,
                              shape: _currentPage == e.key
                                  ? BoxShape.rectangle
                                  : BoxShape.circle,
                              color: Colors.white.withOpacity(
                                _currentPage == e.key ? 0.9 : 0.4,
                              ),
                            ),
                          )
                        : SizedBox(),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
