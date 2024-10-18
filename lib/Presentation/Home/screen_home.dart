import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> adUrls = [
      'https://firebasestorage.googleapis.com/v0/b/sos-app-5aad3.appspot.com/o/basicResponder%2FDollarphotoclub_64852647-1024x682.jpg?alt=media&token=45332cbc-e1da-4f66-8ebc-529d4807297f',
      'https://firebasestorage.googleapis.com/v0/b/sos-app-5aad3.appspot.com/o/basicResponder%2FAccident.jpg?alt=media&token=942beab2-cec1-4393-b786-613bbe7068b2',
      'https://firebasestorage.googleapis.com/v0/b/sos-app-5aad3.appspot.com/o/basicResponder%2Fv4-460px-Do-a-Two-Person-Arm-Carry-Step-1-Version-2.jpg?alt=media&token=ccc1dc18-ccef-46b1-b011-c9d8b74543ab',
    ];
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('Assets/img_3.png', height: 40),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/Home');
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/Home');
            },
          ),
          IconButton(
            icon: const Icon(Icons.leave_bags_at_home_sharp),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/Home');
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          BannerWidgets(),

          SizedBox(
            height: 152,
            child: PageView(
              children: [
                ImageSize(
                  image: 'Assets/row/639x837_1 1.png',
                  child: Image.asset(""),
                ),
                ImageSize(
                  image: 'Assets/row/TWIN-CAPSULE 1.png',
                ),
              
                ImageSize(image: 'Assets/row/639x837_1 1.png',),
                 ImageSize(
                  image: 'Assets/row/639x837_1 1.png',
                ),
                ImageSize(
                  image: 'Assets/row/TWIN-CAPSULE 1.png',
                ),
              
                ImageSize(image: 'Assets/row/639x837_1 1.png',),
                
                
              ],
            ),
          ),
          SizedBox(
            height: 230,
            child: PageView(
              children: [
                ImageSize2(
                  image: 'Assets/row/639x837_1 1.png',
                  child: Image.asset(""),
                ),
                ImageSize2(
                  image: 'Assets/row/TWIN-CAPSULE 1.png',
                ),

                ImageSize2(image: 'Assets/row/639x837_1 1.png',),
                 ImageSize2(
                  image: 'Assets/row/639x837_1 1.png',
                ),
                ImageSize2(
                  image: 'Assets/row/TWIN-CAPSULE 1.png',
                ),

                ImageSize2(image: 'Assets/row/639x837_1 1.png',),


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
                  color:Colors.cyan,
                ),
                child: AdCarousel(
                  adUrls: adUrls,
                )),
          ),
        ],
      ),
    );
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
    return Container(
      height: 150,
      width: 114,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover)),
      child: child,
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
    return Container(
      height: 161,
      width: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover),),
      child: child,
    );
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
          image: DecorationImage(image: AssetImage('Assets/img_2.png'))),
      child: Container(
        height: 10,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black)),
        alignment: Alignment.bottomRight,
        child: TextButton(
          onPressed: () {},
          child: Text('Shop Now'),
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
                placeholder: (context, url) =>Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    )),
                errorWidget: (context, url, error) =>  Icon(
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