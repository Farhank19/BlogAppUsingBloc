import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: const Color(0xfffefefe),
          centerTitle: true,
          title: Column(
            children: [
              Text(
                'CITIZEN FEMME',
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'The Stylish Guide for the female Traveller',
                style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xff9b93a4),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        drawer: const SidebarWidget(),
        body: ListView(
          padding: EdgeInsets.all(12),
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                var items = [
                  {
                    'title': 'Travel',
                    'image':
                        'https://citizen-femme.com/wp-content/uploads/2024/11/GranCanaria-North-Natual-Pools-Caleton-de-los-Cangrejos-Galdar-766x494.jpg'
                  },
                  {
                    'title': 'Style',
                    'image':
                        'https://citizen-femme.com/wp-content/uploads/2024/09/TB_SS25_SHOW_CF_92-1-e1726138484324-766x494.jpg'
                  },
                  {
                    'title': 'Fashion',
                    'image':
                        'https://citizen-femme.com/wp-content/uploads/2024/09/ST.-CLAIR-SS24-Daisy-darling-heart-landscape-766x494.jpg'
                  },
                  {
                    'title': 'Culture',
                    'image':
                        'https://citizen-femme.com/wp-content/uploads/2024/11/The-Protector-Of-Humanity-e1731932890281-766x494.jpg'
                  }
                ];
                return GridCardWidget(
                  title: items[index]['title']!,
                  url: items[index]['image']!,
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Latest Product",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 260,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  var items = [
                    {
                      'title':
                          'How To Start A Safe And Effective Fitness Routine This Winter',
                      'image':
                          'https://citizen-femme.com/wp-content/uploads/2024/07/Screenshot-2024-07-29-at-12.01.55-556x354.png'
                    },
                    {
                      'title':
                          'Fireside Fragrances: The Perfume Trend Perfect For All Your Festive Soirées',
                      'image':
                          'https://citizen-femme.com/wp-content/uploads/2024/11/pexels-zeyneb-alishova-190703179-11383178-766x494.jpg'
                    },
                    {
                      'title':
                          'A Beauty Insider Guide To Vancouver with Sasha Plavsic from Ilia Beauty',
                      'image':
                          'https://citizen-femme.com/wp-content/uploads/2024/10/IMG_5270-766x494.jpg'
                    },
                    {
                      'title':
                          'Spoil the beauty lover in your life – and add to your own wish list too.',
                      'image':
                          'https://citizen-femme.com/wp-content/uploads/2024/10/pavan-henna-3-766x494.png'
                    }
                  ];
                  return HorizontalCardWidget(
                    title: items[index]['title']!,
                    url: items[index]['image']!,
                  );
                },
              ),
            ),
            Image.network(
              "https://citizen-femme.com/wp-content/uploads/2024/11/beachside-spa-556x354.png",
              height: 150,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ));
  }
}

class GridCardWidget extends StatelessWidget {
  final String title;
  final String url;
  const GridCardWidget({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black, // Border color
              width: 3,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            // Use ClipRRect to round the image corners as well
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              url,
              width: double
                  .infinity, // Ensures the image takes the full width of the container
              height: 130, // Fixed height for the image
              fit: BoxFit
                  .cover, // Ensures the image fits well within the container
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class HorizontalCardWidget extends StatelessWidget {
  final String title;
  final String url;
  const HorizontalCardWidget(
      {super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      width: 0.48.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffd4d4d4), // Border color
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              // Use ClipRRect to round the image corners as well
              borderRadius: BorderRadius.circular(7),
              child: Image.network(
                url,
                width: double
                    .infinity, // Ensures the image takes the full width of the container
                height: 130, // Fixed height for the image
                fit: BoxFit
                    .cover, // Ensures the image fits well within the container
              ),
            ),
          ),
          Text(
            title.split('\n').take(3).join('\n'),
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
