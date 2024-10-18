import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

final kHeight = SizedBox(
  height: 10,
);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> adUrls = [
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: ListView(
        children: [
          kHeight,
          BannerWidgets(),
          kHeight,
          HeadLineWidgets(
            text: 'Our Brands',
          ),
          SizedBox(
            height: 152,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ImageSize(
                  image: 'Assets/row/639x837_1 1.png',
                  child: Image.asset(""),
                ),
                ImageSize(
                  image: 'Assets/row/TWIN-CAPSULE 1.png',
                ),
                ImageSize(
                  image: 'Assets/row/639x837_1 1.png',
                ),
                ImageSize(
                  image: 'Assets/row/639x837_1 1.png',
                ),
                ImageSize(
                  image: 'Assets/row/TWIN-CAPSULE 1.png',
                ),
                ImageSize(
                  image: 'Assets/row/639x837_1 1.png',
                ),
              ],
            ),
          ),
          HeadLineWidgets(
            text: 'Suggested For You',
          ),
          SizedBox(
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ImageSize2(
                  image: 'Assets/row/639x837_1 1.png',
                  child: Image.asset(""),
                ),
                ImageSize2(
                  image: 'Assets/row/TWIN-CAPSULE 1.png',
                ),
                ImageSize2(
                  image: 'Assets/row/639x837_1 1.png',
                ),
                ImageSize2(
                  image: 'Assets/row/639x837_1 1.png',
                ),
                ImageSize2(
                  image: 'Assets/row/TWIN-CAPSULE 1.png',
                ),
                ImageSize2(
                  image: 'Assets/row/639x837_1 1.png',
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
                height: size.width,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.cyan,
                ),
                child: AdCarousel(
                  adUrls: adUrls,
                )),
          ),
          HeadLineWidgets(
            text: 'BestSellers',
          ),
          SizedBox(
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ImageSize2(
                  image: 'Assets/row/639x837_1 1.png',
                  child: Image.asset(""),
                ),
                ImageSize2(
                  image: 'Assets/row/TWIN-CAPSULE 1.png',
                ),
                ImageSize2(
                  image: 'Assets/row/639x837_1 1.png',
                ),
                ImageSize2(
                  image: 'Assets/row/639x837_1 1.png',
                ),
                ImageSize2(
                  image: 'Assets/row/TWIN-CAPSULE 1.png',
                ),
                ImageSize2(
                  image: 'Assets/row/639x837_1 1.png',
                ),
              ],
            ),
          ),
          HeadLineWidgets(
            text: 'Trending Categories',
          ),
        ],
      ),
    );
  }
}

class HeadLineWidgets extends StatelessWidget {
  const HeadLineWidgets({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        width: 20,
      ),
      Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      Spacer(),
      Text(
        "View All",
        style: TextStyle(),
      ),
      SizedBox(
        width: 20,
      ),
    ]);
  }
}

class ImageSize extends StatelessWidget {
  const ImageSize({
    super.key,
    this.child,
    this.text,
    required this.image,
  });
  final Widget? child;
  final String? text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: Container(
        height: 150,
        width: 114,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        child: child,
      ),
    );
  }
}

class ImageSize2 extends StatelessWidget {
  const ImageSize2({
    super.key,
    this.child,
    this.text,
    required this.image,
  });
  final Widget? child;
  final String? text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 161,
        width: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: child,
      ),
      kHeight,
      Text("data"),
Text("\$75.00")
    ]);
  }
}

class BannerWidgets extends StatelessWidget {
  const BannerWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 390,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/img_2.png'), fit: BoxFit.cover)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(50, 10),
          side: BorderSide(color: Colors.white),
          alignment: Alignment.bottomRight,
        ),
        onPressed: () {},
        child: Text(
          'Shop Now',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class AdCarousel extends StatefulWidget {
  const AdCarousel({super.key, required this.adUrls});
  final List<String> adUrls;
  @override
  _AdCarouselState createState() => _AdCarouselState();
}

class _AdCarouselState extends State<AdCarousel> {
  int _currentIndex = 0;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentIndex < widget.adUrls.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          itemCount: widget.adUrls.length,
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print("object");
              },
              child: CachedNetworkImage(
                width: double.infinity,
                height: 200,
                imageUrl: widget.adUrls[index],
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                )),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  size: 130,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildIndicators(),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildIndicators() {
    return List.generate(
      widget.adUrls.length,
      (index) => Container(
        width: 8,
        height: 8,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentIndex == index ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
