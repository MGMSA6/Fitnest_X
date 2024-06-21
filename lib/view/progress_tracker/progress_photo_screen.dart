import 'package:fitnest_x/res/colors.dart';
import 'package:fitnest_x/utils/routes/route_names.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/gallery.dart';
import '../../model/gallery_set.dart';

class ProgressPhoto extends StatefulWidget {
  const ProgressPhoto({super.key});

  @override
  State<ProgressPhoto> createState() => _ProgressPhotoState();
}

class _ProgressPhotoState extends State<ProgressPhoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFF7F8F8),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_rounded,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Progress Photo',
                          style: TextStyle(
                            color: Color(0xFF1D1517),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xFFF7F8F8),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {},
                              child: Icon(Icons.more_horiz),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.maxFinite,
                      height: 90,
                      decoration: BoxDecoration(
                          color: AppColor.reminderBg,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: OvalBorder(),
                            ),
                            child: Center(
                                child: SvgPicture.asset(
                              "assets/images/clock_cal.svg",
                              height: 38,
                              width: 34,
                            )),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Reminder!',
                                style: TextStyle(
                                  color: Color(0xFFFF0000),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Next Photos Fall On July 08',
                                style: TextStyle(
                                  color: Color(0xFF1D1517),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SvgPicture.asset(
                                "assets/images/x_icon.svg",
                                height: 20,
                                width: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.maxFinite,
                      height: 137,
                      decoration: BoxDecoration(
                          gradient: AppColor.blueBg,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Track Your Progress Each\nMonth With ',
                                      style: TextStyle(
                                        color: Color(0xFF1D1517),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Photo',
                                      style: TextStyle(
                                        color: Color(0xFF92A3FD),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 95,
                                height: 35,
                                decoration: ShapeDecoration(
                                  gradient: AppColor.buttonColors,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(55),
                                    onTap: () {},
                                    child: const Center(
                                      child: Text(
                                        'Learn More',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SvgPicture.asset(
                            "assets/images/group.svg",
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      height: 57,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: AppColor.blueBg),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Compare my Photo',
                              style: TextStyle(
                                color: Color(0xFF1D1517),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              width: 88,
                              height: 28,
                              decoration: ShapeDecoration(
                                gradient: AppColor.buttonColors,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(55),
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RouteNames.comparison);
                                  },
                                  child: const Center(
                                    child: Text(
                                      'Compare',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Gallery',
                          style: TextStyle(
                            color: Color(0xFF1D1517),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'See more',
                          style: TextStyle(
                            color: Color(0xFFACA3A5),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: GallerySet.getGallerySetData().length,
                    itemBuilder: (BuildContext context, int index) {
                      GallerySet gallerySet =
                          GallerySet.getGallerySetData()[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              gallerySet.date,
                              style: TextStyle(
                                color: Color(0xFF7B6F72),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 100,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: gallerySet.gallery.length,
                              itemBuilder:
                                  (BuildContext context, int galleryIndex) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: galleryIndex == 0 ? 20 : 0,
                                    right: galleryIndex ==
                                            gallerySet.gallery.length - 1
                                        ? 20
                                        : 0,
                                  ),
                                  child: Image.asset(
                                    gallerySet.gallery[galleryIndex].imgPath,
                                    width: 100.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      if (kDebugMode) {
                                        print('Error loading image: $error');
                                      }
                                      return Text('Error loading image');
                                    },
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int galleryIndex) {
                                return SizedBox(
                                  width: 10,
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  gradient: AppColor.unitGradient,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x4CC58BF2),
                      blurRadius: 22,
                      offset: Offset(0, 10),
                      spreadRadius: 0,
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: SvgPicture.asset(
                          "assets/images/camera_white.svg",
                        ),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
