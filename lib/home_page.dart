import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grabber_app/colors.dart';
import 'package:grabber_app/models/category_model.dart';
import 'package:grabber_app/models/product_model.dart';
import 'package:grabber_app/widgets/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> items = [
    'assets/banners/slide 1.png',
    'assets/banners/slide 2.png',
    'assets/banners/slide 3.png',
  ];

  List<CategoryModel> categories = [
    CategoryModel(name: 'Fruit', image: 'assets/category/fruits.png'),
    CategoryModel(name: 'Vegetables', image: 'assets/category/Vegetables.png'),
    CategoryModel(name: 'Dairy', image: 'assets/category/dairy.png'),
    CategoryModel(name: 'Beverages', image: 'assets/category/Beverages.png'),
    CategoryModel(name: 'Laundry', image: 'assets/category/Laundry.png'),
  ];

  List<ProductModel> products = [
    ProductModel(
        name: "Banana",
        image: 'assets/fruits/Banana.png',
        price: '3.99',
        rate: '4',
        rateCount: '287'),
    ProductModel(
        name: "Orange",
        image: 'assets/fruits/Orange.png',
        price: '3.52',
        rate: '3.8',
        rateCount: '252'),
    ProductModel(
        name: "Pepper",
        image: 'assets/fruits/Pepper.png',
        price: '4.99',
        rate: '3.5',
        rateCount: '196'),
    ProductModel(
        name: "Egg",
        image: 'assets/fruits/egg.png',
        price: '3.99',
        rate: '4',
        rateCount: '287'),
  ];

  List basketList = [];

  void toggleSelection(ProductModel product) {
    setState(() {
      if (basketList.contains(product)) {
        basketList.remove(product);
      } else {
        basketList.add(product);
      }
    });
  }

  bool isSelected(ProductModel product) => basketList.contains(product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        leadingWidth: 0,
        title: Row(
          children: [
            const Icon(Icons.delivery_dining_outlined),
            const SizedBox(width: 10),
            const Text(
              '61 Hopper street..',
              style: TextStyle(fontSize: 19),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 30,
            ),
            const Spacer(flex: 1),
            SvgPicture.asset('assets/icons/Vector.svg'),
          ],
        ),
      ),
      body: Column(
        children: [
          // banner
          CarouselSlider.builder(
            itemCount: items.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Image.asset(items[itemIndex]),
            options: CarouselOptions(
              height: 200,
              aspectRatio: 1,
              viewportFraction: 0.75,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              enlargeCenterPage: true,
            ),
          ),
          const SizedBox(height: 10),

          // category
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categories.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(.0),
                          child: Image.asset(
                            categories[index].image,
                            width: 60,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        categories[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Fruits',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                  Text('see all',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: kColor))
                ]),
          ),
          const SizedBox(height: 12),

          //Products
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                  children: List.generate(products.length, (index) {
                return ProductItem(
                  icon: isSelected(products[index])
                      ? Icon(Icons.close)
                      : Icon(Icons.add),
                  product: products[index],
                  onTap: () => toggleSelection(products[index]),
                );
              })),
            ),
          )

          // cart widget
          ,
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Container(
              width: double.infinity,
              height: 77,
              decoration: BoxDecoration(
                color: kColor,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 217,
                      child: ListView.builder(
                        itemCount: basketList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(
                                  'assets/fruits/${basketList[index].name[0].toLowerCase()}${basketList[index].name.substring(1)}.png',
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 2,
                      height: 40,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'View Basket',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    SizedBox(width: 10),
                    Badge(
                      backgroundColor: Colors.red,
                      label: Text(
                        '${basketList.length}',
                        style: TextStyle(fontSize: 12),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/Vector.svg',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
