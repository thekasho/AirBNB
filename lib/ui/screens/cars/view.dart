part of '../screens.dart';

class ViewCarScreen extends StatefulWidget {
  const ViewCarScreen({Key? key, required this.id}) : super(key: key);
  final dynamic id;

  @override
  State<ViewCarScreen> createState() => _ViewCarScreenState();
}

class _ViewCarScreenState extends State<ViewCarScreen> {
  CarContImp carContImp = Get.put(CarContImp());
  List car = [];
  List<IntroductionSliderItem> imgList = [];

  Future<void> getCarInfo() async {
    if (widget.id >= 1) {
      car = [];
      car = carContImp.allCars.where((c) => c['id'] == widget.id).toList();
    }
    print(car);
  }

  @override
  void initState() {
    getCarInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(CarContImp());
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: GetBuilder<CarContImp>(builder: (cont) {
          imgList = [];
          for (int i = 0; i < car[0]['images'].length; i++) {
            imgList.add(
              IntroductionSliderItem(
                backgroundImageDecoration: BackgroundImageDecoration(
                  image: NetworkImage(car[0]['images'][i]),
                  fit: BoxFit.cover,
                  opacity: 1.0,
                ),
              ),
            );
          }
          if (cont.requestStatus == RequestStatus.loading) {
            return SizedBox(
              height: 85.h,
              width: 100.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  const CircularProgressIndicator(
                    color: black,
                  ),
                ],
              ),
            );
          } else if (cont.requestStatus == RequestStatus.success) {
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
                              dotIndicator: const DotIndicator(
                                  selectedColor: black),
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
                              car[0]['title'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyLarge,
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
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(15)),
                            ),
                            child: Text(
                              "${car[0]['type'][0]
                                  .toUpperCase()}${car[0]['type'].substring(
                                  1).toLowerCase()}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: primaryColor),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 5.w
                            ),
                            child: Icon(
                              Icons.favorite, color: red, size: 22.sp,),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 1.w,
                            ),
                            child: Text(
                              "${car[0]['likes']}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(color: grey),
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
                              top: 2.h,
                              bottom: 1.h,
                            ),
                            width: 100.w,
                            child: Text(
                              "Unit By",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headlineMedium,
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
                              imageUrl: car[0]['userInfo']['avatar'] ??
                                  "https://mustafamahmoud.site/bnb/images/avatar.png",
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
                                  car[0]['userInfo']['username'],
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                Text(
                                  car[0]['userInfo']['typeName'],
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: Icon(
                              Icons.call, color: primaryColor, size: 25.sp,),
                            onPressed: () {},
                            color: Colors.transparent,
                          ),
                          SizedBox(width: 2.w),
                          IconButton(
                            icon: Icon(Icons.message, color: primaryColor,
                              size: 25.sp,),
                            onPressed: () {},
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
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headlineMedium,
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
                              "${car[0]['desc']}",
                              trimMode: TrimMode.Line,
                              trimLines: 3,
                              colorClickableText: red,
                              annotations: [
                                Annotation(
                                  regExp: RegExp(r'#([a-zA-Z0-9_]+)'),
                                  spanBuilder: (
                                      {required String text, TextStyle? textStyle}) =>
                                      TextSpan(
                                        text: text,
                                        style: textStyle?.copyWith(
                                            color: Colors.blue),
                                      ),
                                ),
                                Annotation(
                                  regExp: RegExp(r'<@(\d+)>'),
                                  spanBuilder: (
                                      {required String text, TextStyle? textStyle}) =>
                                      TextSpan(
                                        text: 'User123',
                                        style: textStyle?.copyWith(
                                            color: Colors.green),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Handle tap, e.g., navigate to a user profile
                                          },
                                      ),
                                ),
                              ],
                              moreStyle: TextStyle(fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor),
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
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(color: grey),
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              "\$${car[0]['price']} / Day",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
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
                              backgroundColor: MaterialStateProperty.all<
                                  Color>(
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
                              "Contact",
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: white),
                            ),
                            onPressed: () {
                              cont.reserve(widget.id ?? 0);
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
          }
          return SizedBox(
            height: 85.h,
            width: 100.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                const CircularProgressIndicator(
                  color: black,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
