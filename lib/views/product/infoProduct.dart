
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class InfoProduct extends StatelessWidget {
  final String? title ;

  const InfoProduct({Key? key , this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: Text(title!),
          centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            )

        ),
        body: Column(
            children: [
              ImageSlideshow(

                width: double.infinity,

                height: 200,

                initialPage: 0,

                indicatorBackgroundColor: Colors.grey,

                children: [
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSs00_6MDIJ0A2YyDs4zoVLFEpSd6IY9V2wiw&usqp=CAU',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsJ5bIp5L8-U3J_9TtS9iHhbvkDuY7gSyzZg&usqp=CAU',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzUIfKer06aiEfqpxHugrZOr6ZxBsGtkX9yw&usqp=CAU',
                    fit: BoxFit.cover,
                  ),
                ],

                onPageChanged: (value) {
                  print('Page changed: $value');
                },

                autoPlayInterval: 5000,

                isLoop: true,
              ),
            ]
        )

    );


  }
}
