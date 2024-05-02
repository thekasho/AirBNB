part of '../screens.dart';

class CarRentHomePageScreen extends StatefulWidget {
  const CarRentHomePageScreen({super.key});

  @override
  State<CarRentHomePageScreen> createState() => _CarRentHomePageScreenState();
}

class _CarRentHomePageScreenState extends State<CarRentHomePageScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(MainHomeContImp());
    Get.put(CarContImp());
    return GetBuilder<CarContImp>(builder: (cont) {
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
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: RefreshIndicator(
            onRefresh: () async {
              await cont.getCars();
            },
            backgroundColor: white,
            color: primaryColor,
            child: SizedBox(
              width: 100.w,
              height: 100.h,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CarsTitle(
                      sectionTitle: "All Cars..",
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: cont.allCars.length,
                      physics: const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int i) {
                        return GestureDetector(
                          onTap: (){},
                          child: Container(
                            width: 95.w,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 2,
                                  color: lightGrey
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 16.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                            ),
                                            clipBehavior: Clip.antiAlias,
                                            height: 15.h,
                                            width: 35.w,
                                            child: CachedNetworkImage(
                                              imageUrl: "${cont.allCars[i]['images'][0]}",
                                              fit: BoxFit.fill,
                                              errorWidget: (_, i, e) {
                                                return Container(
                                                  color: black,
                                                  height: 100.h,
                                                  child: Image.asset(
                                                    "assets/images/blank.png",
                                                  ),
                                                );
                                              },
                                              placeholder: (_, i) {
                                                return const Center(
                                                  child: CircularProgressIndicator(
                                                    color: primaryColor,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 60.w,
                                        padding: const EdgeInsets.only(
                                          top: 10,
                                          left: 20,
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              width: 57.w,
                                              child: Text(
                                                "${cont.allCars[i]['title']} ${cont.allCars[i]['title']}",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .titleMedium,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "${cont.allCars[i]['city']}",
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                    color: darkGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.sp,
                                                  ),
                                                ),

                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  child: Text(
                                                    "EGP${cont.allCars[i]['price']} / Day",
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: Theme
                                                        .of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                      fontSize: 17.sp,
                                                      color: darkBlue,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 5.w),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    ),
                  ],
                ),
              ),
            ),
          ),
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
    });
  }
}
