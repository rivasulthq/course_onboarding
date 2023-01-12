import 'package:course_onboarding/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/onboarding.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
 //Keeps Track on which page we are on
  PageController _controller = PageController();

  //Keep Track if we are on the last Page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),

        child: Stack(
          children: [

         PageView(
           controller: _controller,
           onPageChanged: (index) {
             setState(() {
               onLastPage =index ==3;

             });
           },
          children: [
          OnBoarding(
            image: 'assets/img/product design.svg',
            title: 'Learn UI/UX Design',
            subtitle: 'The UI/UX Design Specialisation brings a design-centric approach to user interface and user experience design, and offers practical.'
            
            ),

             OnBoarding(
            image: 'assets/img/web development.svg',
            title: 'Learn Web Development',
            subtitle: ' Rivasult is a free scholarship programme enabling African youth with tech up-skilling & jobs. Africa & African youth are poised to transform the digital landscape of the world.'
            
            ),
             OnBoarding(
            image: 'assets/img/graphics design.svg',
            title: 'Learn Graphics Design ',
            subtitle: 'Master all aspects of graphic design by enrolling in courses that will train you in typography, Learn in-demand skills with over 185,000 video courses.',
            
            ),

             OnBoarding(
            image: 'assets/img/Mobile Development.svg',
            title: 'Learn Mobile App Development ',
            subtitle: ' Take online app development courses from top schools and institutions. Learn app development skills to advance your education and career with Rivasult.',
            ),
           
          ],
        ), 
          Container(
            //Between 1 and -1
            alignment: Alignment(0, 0.9),
            child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SmoothPageIndicator(
                  controller: _controller,
                  count:4,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.blue.shade400,
                  ),
                  onDotClicked:  (index) => _controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  ),
                  ),
              ],
            )
          ),
          Container(
            alignment: Alignment.topRight,

           padding: const EdgeInsets.only(right: 25, top: 35),
            child: TextButton(
              child: Text('SKIP'),
              onPressed: () => _controller.jumpToPage(3),
              ),
          )

        ],
        ),
      ),
      bottomSheet: 

      onLastPage ? TextButton(
        style:  TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),

          ),
          primary: Colors.white,
          backgroundColor: Colors.blue.shade700,
          minimumSize: const Size.fromHeight(80),
          ),
        child:const  Text('Get Started', 
        style: TextStyle(
          fontSize: 24,
        ),),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),)
            );

        },
        )
      
       :Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: 
              const EdgeInsets.symmetric(horizontal: 55),
              primary:  Colors.grey.shade300,
              onPrimary: Colors.grey,
            ),
            child: Text('Back'),
            onPressed: () {
              _controller.previousPage(
                duration: const Duration(milliseconds: 500),

                curve: Curves.easeIn,
                 );

            },
            ),

            ElevatedButton(
               style: ElevatedButton.styleFrom(
              padding: 
              const EdgeInsets.symmetric(horizontal: 55),
              // primary:  Colors.blue,
              //  onPrimary: Colors.bl,
            ),
            child: Text('Next'),
            onPressed: () {
              _controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                 );

            },
            ),
          

        ],
        ),
      ),
    );
  }
}
