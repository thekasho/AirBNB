part of '../screens.dart';

class ViewUnitScreen extends StatefulWidget {
  const ViewUnitScreen({Key? key, required this.id}) : super(key: key);
  final dynamic id;

  @override
  State<ViewUnitScreen> createState() => _ViewUnitScreenState();
}

class _ViewUnitScreenState extends State<ViewUnitScreen> {
  UnitsContImp unitsContImp = Get.put(UnitsContImp());
  List unit = [];
  List<IntroductionSliderItem> imgList = [];

  Future<void> getUnitInfo() async {
    if (widget.id >= 1) {
      unit = unitsContImp.mainUnits.where((c) => c['id'] == widget.id).toList();
    }
  }
  @override
  void initState() {
    getUnitInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(MainHomeContImp());
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: GetBuilder<UnitsContImp>(builder: (cont) {
          imgList = [];
          for (int i = 0; i < unit[0]['images'].length; i++) {
            imgList.add(
              IntroductionSliderItem(
                backgroundImageDecoration: BackgroundImageDecoration(
                  image: NetworkImage(unit[0]['images'][i]),
                  fit: BoxFit.cover,
                  opacity: 1.0,
                ),
              ),
            );
          }
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: black.withOpacity(.6),
                      width: 100.w,
                      height: 50.h,
                      alignment: Alignment.topCenter,
                      child: Stack(
                        children: [
                          IntroductionSlider(
                            showStatusBar: true,
                            items: imgList,
                            dotIndicator: const DotIndicator(selectedColor: black),
                            done: const Done(
                              child: SizedBox(),
                              home: SizedBox(),
                            ),
                          ),
                          SafeArea(
                            child: Container(
                              alignment: Alignment.topRight,
                              width: 100.w,
                              padding: EdgeInsets.only(right: 3.w),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    child: Icon(
                                      Icons.navigate_before,
                                      color: primaryColor,
                                      size: 30.sp,
                                    ),
                                    onTap: () => Get.back(),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    child: unit[0]['is_like'] == 1
                                      ? Icon(
                                          Icons.favorite,
                                          color: primaryColor,
                                          size: 25.sp,
                                        )
                                      : Icon(
                                          Icons.favorite_border,
                                          color: primaryColor,
                                          size: 25.sp,
                                        ),
                                    onTap: () {
                                      cont.likeUnit(widget.id ?? 0);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 5.w,
                            right: 5.w,
                            top: 3.h,
                            bottom: 1.h,
                          ),
                          width: 100.w,
                          child: Text(
                            unit[0]['title'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 5.w
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(.3),
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Text(
                            "${unit[0]['type'][0].toUpperCase()}${unit[0]['type'].substring(1).toLowerCase()}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: primaryColor),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 5.w
                          ),
                          child: Icon(Icons.favorite, color: red, size: 22.sp,),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 1.w,
                          ),
                          child: Text(
                            "${unit[0]['likes']}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: grey),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 100.w,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 5.w, top: 2.h),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(.3),
                                borderRadius: const BorderRadius.all(Radius.circular(15)),
                              ),
                              child: const Icon(Icons.bed, color: primaryColor,),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 3.w, top: 2.h),
                              child: Text(
                                "${unit[0]['beds']} Beds",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: grey),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 3.w, top: 2.h),
                              child: Text(
                                "-",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: grey),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5.w, top: 2.h),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(.3),
                                borderRadius: const BorderRadius.all(Radius.circular(15)),
                              ),
                              child: const Icon(Icons.bathtub, color: primaryColor,),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 3.w, top: 2.h),
                              child: Text(
                                "${unit[0]['bath']} Bath",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: grey),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 3.w, top: 2.h),
                              child: Text(
                                "-",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: grey),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5.w, top: 2.h),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(.3),
                                borderRadius: const BorderRadius.all(Radius.circular(15)),
                              ),
                              child: const Icon(Icons.reduce_capacity_rounded, color: primaryColor,),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 3.w, top: 2.h),
                              child: Text(
                                "${unit[0]['bath']} Bath",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: grey),
                              ),
                            ),
                            SizedBox(width: 20.w),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 5.w,
                            right: 5.w,
                            top: 2.h,
                            bottom: 1.h,
                          ),
                          width: 100.w,
                          child: Text(
                            "Unit By",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 5.w,
                          ),
                          width: 15.w,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle
                          ),
                          child: CachedNetworkImage(
                            imageUrl: unit[0]['userInfo']['avatar'] ?? "https://mustafamahmoud.site/bnb/images/avatar.png",
                            errorWidget: (_, i, e) {
                              return Icon(
                                FontAwesomeIcons.image,
                                size: 13.sp,
                                color: Colors.white,
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 5.w
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                unit[0]['userInfo']['username'],
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              Text(
                                unit[0]['userInfo']['typeName'],
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(Icons.call, color: primaryColor, size: 25.sp,),
                          onPressed: (){},
                          color: Colors.transparent,
                        ),
                        SizedBox(width: 2.w),
                        IconButton(
                          icon: Icon(Icons.message, color: primaryColor, size: 25.sp,),
                          onPressed: (){},
                          color: Colors.transparent,
                        ),
                        SizedBox(width: 5.w),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 5.w,
                            right: 5.w,
                            top: 3.h,
                            bottom: 1.h,
                          ),
                          width: 100.w,
                          child: Text(
                            "Unit Description",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                          ),
                          child: ReadMoreText(
                            "${unit[0]['desc']}",
                            trimMode: TrimMode.Line,
                            trimLines: 3,
                            colorClickableText: red,
                            annotations: [
                              Annotation(
                                regExp: RegExp(r'#([a-zA-Z0-9_]+)'),
                                spanBuilder: ({required String text, TextStyle? textStyle}) => TextSpan(
                                  text: text,
                                  style: textStyle?.copyWith(color: Colors.blue),
                                ),
                              ),
                              Annotation(
                                regExp: RegExp(r'<@(\d+)>'),
                                spanBuilder: ({required String text, TextStyle? textStyle}) => TextSpan(
                                  text: 'User123',
                                  style: textStyle?.copyWith(color: Colors.green),
                                  recognizer: TapGestureRecognizer()..onTap = () {
                                    // Handle tap, e.g., navigate to a user profile
                                  },
                                ),
                              ),
                            ],
                            moreStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 5.w,
                            right: 5.w,
                            top: 3.h,
                            bottom: 1.h,
                          ),
                          width: 100.w,
                          child: Text(
                            "What this Price Offers ${unit[0]['has_wifi']}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 100.w,
                      margin: EdgeInsets.only(top: 2.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w
                      ),
                      child: Wrap(
                        spacing: 5.w,
                        runSpacing: 2.h,
                        alignment: WrapAlignment.spaceAround,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: unit[0]['has_washer'] == 1 ? primaryColor.withOpacity(.3) : red.withOpacity(.3),
                                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Icon(FontAwesomeIcons.soap, color: unit[0]['has_washer'] == 1 ? primaryColor : red, size: 25.sp,),
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                "Washing Machine",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: unit[0]['has_washer'] == 1 ? primaryColor : red),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: unit[0]['has_parking'] == 1 ? primaryColor.withOpacity(.3) : red.withOpacity(.3),
                                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Icon(Icons.local_parking, color: unit[0]['has_parking'] == 1 ? primaryColor : red, size: 25.sp,),
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                "Car Parking",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: unit[0]['has_parking'] == 1 ? primaryColor : red),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: unit[0]['has_coffemaker'] == 1 ? primaryColor.withOpacity(.3) : red.withOpacity(.3),
                                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Icon(Icons.emoji_food_beverage_rounded, color: unit[0]['has_coffemaker'] == 1 ? primaryColor : red, size: 25.sp,),
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                "Coffe Maker",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: unit[0]['has_coffemaker'] == 1 ? primaryColor : red),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: unit[0]['has_tv'] == 1 ? primaryColor.withOpacity(.3) : red.withOpacity(.3),
                                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Icon(Icons.tv, color: unit[0]['has_tv'] == 1 ? primaryColor : red, size: 25.sp,),
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                "TV",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: unit[0]['has_tv'] == 1 ? primaryColor : red),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: unit[0]['has_wifi'] == 1 ? primaryColor.withOpacity(.3) : red.withOpacity(.3),
                                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Icon(Icons.wifi, color: unit[0]['has_wifi'] == 1 ? primaryColor : red, size: 25.sp,),
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                "WIFI",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: unit[0]['has_wifi'] == 1 ? primaryColor : red),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 5.w,
                            right: 5.w,
                            top: 3.h,
                            bottom: 1.h,
                          ),
                          width: 100.w,
                          child: Text(
                            "Unit Address",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 5.w),
                        Icon(FontAwesomeIcons.locationDot, color: primaryColor, size: 20.sp),
                        SizedBox(width: 2.w),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${unit[0]['address']}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: grey),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
              Container(
                height: 100.h,
                width: 100.w,
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 10.h,
                  color: backgroundColor,
                  child: Row(
                    children: [
                      SizedBox(width: 5.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Price",
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: grey),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            "\$${unit[0]['price']} / night",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 18.sp,
                            color: darkBlue,
                            fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 50.w,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                primaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  vertical: 2.h
                              ),
                            ),
                          ),
                          child: Text(
                            "Book",
                            style: Theme
                                .of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: white),
                          ),
                          onPressed: () {

                          },
                        ),
                      ),
                      SizedBox(width: 5.w),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
