// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';

import '../components and constants/middleInRow.dart';


class SubjectsScreen extends StatelessWidget {
  SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              middle(
                alignment: MainAxisAlignment.start,
                element: Text('Choose Subject',
                    style:TextStyle(color: AppColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 27) ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 7,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) => subjectButton(index),
                  itemCount: subjectText.length,
                ),
              )
            ],
          ),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'images/head.png',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.darkBlue,
                  size: 30,
                )),
          ),
        ],
      ),
    );
  }

  Widget subjectButton(int index) => Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(subjectText[index],
                  style:TextStyle(color: AppColors.darkBlue, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 180,
                width: 180,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 65, 104, 123),
                        blurRadius: 7,
                        spreadRadius: 2,
                        blurStyle: BlurStyle.outer,
                      ),
                    ]),
                child: MaterialButton(
                  //color: Colors.white,
                  onPressed: () {},
                  child: Image.asset(
                    subjectImage[index],
                    height: 150,
                    width: 150,
                  ),
                ),
              )
            ],
          ),
        ],
      );

  List<String> subjectText = [
    'Math',
    'Science',
    'Physics',
    'Chemistry',
    'Social Studies',
    'Arabic',
    'English',
    'French',
    'Religion',
    'Art',
    'Sport',
    'Technology',
    'Music',
    'Culture',
    'Philosophy',
  ];
  List<String> subjectImage = [
    'images/math.png',
    'images/science.png',
    'images/physics.png',
    'images/chemistry.png',
    'images/social.png',
    'images/arabic.png',
    'images/english.png',
    'images/french.png',
    'images/religion.png',
    'images/art.png',
    'images/sport.png',
    'images/tech.png',
    'images/music.png',
    'images/culture.png',
    'images/philosophy.png',
  ];
}
