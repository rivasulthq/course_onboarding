

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: non_constant_identifier_names
Widget OnBoarding({
  required String image,
  required String title,
  required String subtitle,
}) =>  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(image),
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(title,
                    style:
                      const  TextStyle(
                          fontSize: 22,
                         fontWeight: FontWeight.bold),
                         ),
              ),
//subtitle
  const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(subtitle,
                    style:
                       const TextStyle(
                          color: Colors.grey,
      
                         ),
                         ),
              ),

            ],
          );