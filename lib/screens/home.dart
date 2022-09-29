import 'dart:developer';

import 'package:clone_peduli_lindungi/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _hideButtonController = ScrollController();
  var _isVisible;

  @override
  void initState() {
    super.initState();
    _isVisible = true;
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible == true) {
          /* only set when the previous state is false
             * Less widget rebuilds 
             */
          log("**** $_isVisible up"); //Move IO away from setState
          setState(() {
            _isVisible = false;
          });
        }
      } else {
        if (_hideButtonController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (_isVisible == false) {
            /* only set when the previous state is false
               * Less widget rebuilds 
               */
            log("**** $_isVisible down"); //Move IO away from setState
            setState(() {
              _isVisible = true;
            });
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Hi, User',
          style: TextStyle(
              color: primaryBlack,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold),
        ),
        leading: Icon(
          Icons.person_outline_outlined,
          color: primaryBlack,
          size: 40.r,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_rounded,
              color: primaryBlack,
              size: 40.r,
            ),
          )
        ],
      ),
      floatingActionButton: Visibility(
        visible: _isVisible,
        child: FloatingActionButton(
          child: Icon(
            Icons.help_outline_rounded,
            size: 32.r,
            color: primaryBlue,
          ),
          onPressed: () {},
          backgroundColor: Colors.white,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20.r),
        child: ListView(
          controller: _hideButtonController,
          children: [
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.r)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: primaryBlue,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Entering a public space?',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'Stay alert to stay safe',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28.sp,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.info_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 120.r,
                                width: 120.r,
                                child: SvgPicture.asset(
                                  scanPath,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.r),
                    child: Row(
                      children: [
                        Transform.rotate(
                            angle: 90 * math.pi / 180,
                            child: const Icon(Icons.chevron_right_rounded)),
                        Text(
                          'Check-in Preference',
                          style: TextStyle(
                            color: primaryBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.sp,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.all(20.r),
                          decoration: BoxDecoration(
                              color: primaryBlueLight,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.qr_code_scanner_rounded,
                                color: primaryBlue,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'Check-in',
                                style: TextStyle(
                                  color: primaryBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.sp,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Divider(
                thickness: 16.h,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.r),
              child: Wrap(
                spacing: 40.r,
                runSpacing: 40.r,
                children: [
                  itemGrid(
                      color: Colors.amber,
                      iconAsset: bookAppointmentsPath,
                      text: 'Vaccine and Immunization'),
                  itemGrid(
                      color: Colors.redAccent,
                      iconAsset: vaccineStatistics,
                      text: 'Covid-19 Test Result'),
                  itemGrid(
                      color: Colors.greenAccent,
                      iconAsset: kkriPath,
                      isImg: true,
                      text: 'EHAC'),
                  itemGrid(
                      color: Colors.green,
                      iconAsset: travelPath,
                      text: 'Travel Regulations'),
                  itemGrid(
                      color: Colors.amber,
                      iconAsset: vaccinePath,
                      text: 'Telemedicine'),
                  itemGrid(
                      color: Colors.green,
                      iconAsset: hospitalPath,
                      text: 'Healthcare Facility'),
                  itemGrid(
                      color: Colors.redAccent,
                      iconAsset: staticsPath,
                      text: 'Covid-19 Static'),
                  itemGrid(
                      color: Colors.amberAccent,
                      iconAsset: bedPath,
                      text: 'Find Hospital Bed'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget itemGrid(
      {required String iconAsset,
      required Color color,
      required String text,
      bool isImg = false}) {
    return SizedBox(
      width: 210.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 200.r,
            width: 200.r,
            padding: EdgeInsets.all(40.r),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(24.r)),
            child: isImg
                ? Image.asset(iconAsset)
                : SvgPicture.asset(
                    iconAsset,
                  ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              // color: primaryBlue,
              // fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
