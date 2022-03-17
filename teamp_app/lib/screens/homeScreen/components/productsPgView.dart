import 'package:flutter/material.dart';
import 'package:teamp_app/sizeConfig.dart';

class ProductPageView extends StatefulWidget {
  const ProductPageView({Key? key}) : super(key: key);

  @override
  State<ProductPageView> createState() => _ProductPageViewState();
}

class _ProductPageViewState extends State<ProductPageView> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currentPageIndex = 0.0;
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!;
      });
    });
  }
  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenHeight(200),
      child: PageView.builder(
          controller: pageController,
          //itemCount: 5,
          itemBuilder: (context, position) {
            return buildPageItem(position);
          }),
    );
  }

  Widget buildPageItem(int index) {
    return Stack(
      children: [
        Container(
            height: getScreenHeight(200),
            margin: EdgeInsets.symmetric(horizontal: getScreenWidth(4)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(200, 153, 156, 156).withOpacity(0.8))),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: getScreenHeight(60),
            width: getScreenWidth(400),
            margin: EdgeInsets.only(left: getScreenWidth(3), right: getScreenWidth(60), bottom: getScreenHeight(8)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: getScreenWidth(15), vertical: getScreenHeight(2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Title", style: TextStyle(fontWeight: FontWeight.bold, fontSize: getScreenWidth(17), color: Colors.white),),
                  Text("more details about this product coming soon vhnvnsndvcndsncedncvdvcndsacnn", style: TextStyle(fontSize: getScreenWidth(12), color: const Color.fromARGB(255, 104, 103, 103)),)
                ]
              ),
            ),
          ),
        ),
      ],
    );
  }
}
