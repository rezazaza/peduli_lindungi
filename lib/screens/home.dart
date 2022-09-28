import 'package:clone_peduli_lindungi/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            Card(
              elevation: 0,
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
                          Spacer(),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('data'),
                              Text('data'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text('data'),
                      Text('data'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
