part of '../screens.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  UnitsContImp unitsContImp = Get.put(UnitsContImp());

  @override
  Widget build(BuildContext context) {
    Get.put(MainHomeContImp());
    Get.put(UnitsContImp());
    return GetBuilder<MainHomeContImp>(builder: (logic) {
      return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: RefreshIndicator(
          onRefresh: () async {
            await unitsContImp.getUnits();
          },
          backgroundColor: white,
          color: primaryColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const MainSearchInput(),
                const MainHomeTitle(
                  sectionTitle: "Featured..",
                ),
                GetBuilder<UnitsContImp>(builder: (fcont) {
                  if (fcont.requestStatus == RequestStatus.loading) {
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
                  } else if (fcont.requestStatus == RequestStatus.success) {
                    return SizedBox(
                      width: 100.w,
                      height: 46.h,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 3.w,
                                    ),
                                    width: 100.w,
                                    height: 45.h,
                                    child: NestedScrollView(
                                      headerSliverBuilder: (_, ch) {
                                        return [];
                                      },
                                      body: GridView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: fcont.fUnits.length,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 5.w,
                                          childAspectRatio: 1.2,
                                        ),
                                        itemBuilder: (_, i) {
                                          return GestureDetector(
                                            onTap: () {
                                              Get.to(()=>ViewUnitScreen(id: fcont.fUnits[i]['id']));
                                            },
                                            child: Container(
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                              ),
                                              child: Stack(
                                                alignment: Alignment
                                                    .bottomCenter,
                                                children: [
                                                  SizedBox(
                                                    child: CachedNetworkImage(
                                                      imageUrl: "${fcont
                                                          .fUnits[i]['images'][0]}",
                                                      height: 100.h,
                                                      width: 100.w,
                                                      fit: BoxFit.fill,
                                                      errorWidget: (_, i, e) {
                                                        return Container(
                                                            color: black,
                                                            height: 100.h,
                                                            child: Image.asset(
                                                              "assets/images/blank.png",
                                                            )
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
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(1.w),
                                                    ),
                                                    padding: EdgeInsets.only(
                                                        left: 5.w,
                                                        right: 5.w,
                                                        bottom: 2.h
                                                    ),
                                                    alignment: Alignment
                                                        .bottomLeft,
                                                    width: 100.w,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .start,
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .end,
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: const BorderRadius
                                                                .only(
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight: Radius
                                                                  .circular(15),
                                                            ),
                                                            color: white
                                                                .withOpacity(
                                                                .4),
                                                          ),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            horizontal: 3.w,
                                                            vertical: .6.h,
                                                          ),
                                                          width: 100.w,
                                                          child: Text(
                                                            "${fcont
                                                                .fUnits[i]['title']}",
                                                            maxLines: 1,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: Theme
                                                                .of(context)
                                                                .textTheme
                                                                .bodyLarge,
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 100.w,
                                                          color: white
                                                              .withOpacity(.4),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            horizontal: 3.w,
                                                            vertical: .6.h,
                                                          ),
                                                          child: Text(
                                                            "${fcont
                                                                .fUnits[i]['address']}",
                                                            maxLines: 1,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: Theme
                                                                .of(context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: const BorderRadius
                                                                .only(
                                                              bottomLeft: Radius
                                                                  .circular(15),
                                                              bottomRight: Radius
                                                                  .circular(15),
                                                            ),
                                                            color: white
                                                                .withOpacity(
                                                                .4),
                                                          ),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            horizontal: 3.w,
                                                            vertical: 1.h,
                                                          ),
                                                          width: 100.w,
                                                          child: Text(
                                                            "\$${fcont
                                                                .fUnits[i]['price']} / night",
                                                            maxLines: 1,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: Theme
                                                                .of(context)
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                fontSize: 18.sp,
                                                                color: darkBlue,
                                                                fontWeight: FontWeight
                                                                    .bold
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment
                                                        .topRight,
                                                    padding: EdgeInsets.only(
                                                      right: 3.w,
                                                      top: 3.w,
                                                    ),
                                                    width: 100.w,
                                                    height: 100.h,
                                                    // color: black.withOpacity(.5),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        fcont.likeUnit(fcont
                                                            .fUnits[i]['id']);
                                                      },
                                                      child: Container(
                                                        decoration: const BoxDecoration(
                                                          color: backgroundColor,
                                                          borderRadius: BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  20)),
                                                        ),
                                                        width: 15.w,
                                                        height: 4.5.h,
                                                        alignment: Alignment
                                                            .center,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            Text(
                                                              "${fcont
                                                                  .fUnits[i]['likes']}",
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .titleLarge!
                                                                  .copyWith(
                                                                fontSize: 16.sp,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width: 1.w),
                                                            Icon(
                                                              fcont
                                                                  .fUnits[i]['is_like'] ==
                                                                  1
                                                                  ? Icons
                                                                  .favorite
                                                                  : Icons
                                                                  .favorite_border,
                                                              color: red,
                                                              size: 22.sp,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
                }),
                const MainHomeTitle(
                  sectionTitle: "Our Recommendation..",
                ),
                SizedBox(height: 1.h),
                GetBuilder<UnitsContImp>(builder: (bcont) {
                  return SizedBox(
                    width: 100.w,
                    height: 6.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.w,
                      ),
                      children: [
                        SizedBox(
                          height: 7.h,
                          child: ElevatedButton(
                            onPressed: () {
                              bcont.currentPage = 0;
                              bcont.filterUnits(0);
                              bcont.update();
                            },
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(const BorderSide(
                                  color: primaryColor,
                                  width: 2,
                                  style: BorderStyle.solid),
                              ),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                    horizontal: 4.w,
                                  )),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  bcont.currentPage == 0
                                      ? primaryColor
                                      : white
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  )
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.select_all, size: 20.sp,
                                    color: bcont.currentPage == 0
                                        ? white
                                        : primaryColor),
                                SizedBox(width: 1.w),
                                SizedBox(width: 0.6.w),
                                Text(
                                  "All",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                      color: bcont.currentPage == 0
                                          ? white
                                          : primaryColor, fontSize: 19),
                                ),
                              ],
                            ),
                          ),
                        ),  // 0
                        SizedBox(width: 2.w),
                        SizedBox(
                          height: 7.h,
                          child: ElevatedButton(
                            onPressed: () {
                              bcont.currentPage = 1;
                              bcont.filterUnits(1);
                              bcont.update();
                            },
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(const BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                  style: BorderStyle.solid),
                              ),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                    horizontal: 4.w,
                                  )),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  bcont.currentPage == 1
                                      ? primaryColor
                                      : white
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  )
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.apartment_rounded, size: 20.sp,
                                    color: bcont.currentPage == 1
                                        ? white
                                        : primaryColor),
                                SizedBox(width: 1.w),
                                SizedBox(width: 0.6.w),
                                Text(
                                  "Apartment",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                      color: bcont.currentPage == 1
                                          ? white
                                          : primaryColor, fontSize: 19),
                                ),
                              ],
                            ),
                          ),
                      ),  // 1
                        SizedBox(width: 2.w),
                        SizedBox(
                          height: 7.h,
                          child: ElevatedButton(
                            onPressed: () {
                              bcont.currentPage = 2;
                              bcont.filterUnits(2);
                              bcont.update();
                            },
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(const BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                  style: BorderStyle.solid),
                              ),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                    horizontal: 4.w,
                                  )),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  bcont.currentPage == 2
                                      ? primaryColor
                                      : white
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  )
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.villa_rounded, size: 20.sp,
                                    color: bcont.currentPage == 2
                                        ? white
                                        : primaryColor),
                                SizedBox(width: 1.w),
                                SizedBox(width: 0.6.w),
                                Text(
                                  "Villa",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                      color: bcont.currentPage == 2
                                          ? white
                                          : primaryColor, fontSize: 19),
                                ),
                              ],
                            ),
                          ),
                        ),  // 2
                        SizedBox(width: 2.w),
                        SizedBox(
                          height: 7.h,
                          child: ElevatedButton(
                            onPressed: () {
                              bcont.currentPage = 3;
                              bcont.filterUnits(3);
                              bcont.update();
                            },
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(const BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                  style: BorderStyle.solid),
                              ),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                    horizontal: 4.w,
                                  )),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  bcont.currentPage == 3
                                      ? primaryColor
                                      : white
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  )
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.house_rounded, size: 20.sp,
                                    color: bcont.currentPage == 3
                                        ? white
                                        : primaryColor),
                                SizedBox(width: 1.w),
                                SizedBox(width: 0.6.w),
                                Text(
                                  "House",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                      color: bcont.currentPage == 3
                                          ? white
                                          : primaryColor, fontSize: 19),
                                ),
                              ],
                            ),
                          ),
                        ),  // 3
                        SizedBox(width: 2.w),
                        SizedBox(
                          height: 7.h,
                          child: ElevatedButton(
                            onPressed: () {
                              bcont.currentPage = 4;
                              bcont.filterUnits(4);
                              bcont.update();
                            },
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(const BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                  style: BorderStyle.solid),
                              ),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                    horizontal: 4.w,
                                  )),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  bcont.currentPage == 4
                                      ? primaryColor
                                      : white
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  )
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.house_siding_rounded, size: 20.sp,
                                    color: bcont.currentPage == 4
                                        ? white
                                        : primaryColor),
                                SizedBox(width: 1.w),
                                SizedBox(width: 0.6.w),
                                Text(
                                  "Farm House",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                      color: bcont.currentPage == 4
                                          ? white
                                          : primaryColor, fontSize: 19),
                                ),
                              ],
                            ),
                          ),
                        ),  // 4
                        SizedBox(width: 2.w),
                      ],
                    ),
                  );
                }),
                SizedBox(height: 3.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                  ),
                  width: 100.w,
                  height: 65.h,
                  margin: EdgeInsets.only(
                    bottom: 20.h,
                  ),
                  child: GetBuilder<UnitsContImp>(builder: (cont) {
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
                      return NestedScrollView(
                        headerSliverBuilder: (_, ch) {
                          return [];
                        },
                        body: GridView.builder(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemCount: cont.allUnits.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 5.w,
                            childAspectRatio: .63,
                          ),
                          itemBuilder: (_, i) {
                            return GestureDetector(
                              onTap: () {

                              },
                              child: Container(
                                height: 55.h,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    color: lightGrey.withOpacity(.3),
                                    border: Border.all(
                                        width: 1,
                                        color: lightGrey
                                    )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 20.h,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: lightGrey
                                      ),
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          SizedBox(
                                            child: CachedNetworkImage(
                                              imageUrl: "${cont
                                                  .allUnits[i]['images'][0]}",
                                              height: 100.h,
                                              width: 100.w,
                                              fit: BoxFit.fill,
                                              errorWidget: (_, i, e) {
                                                return Container(
                                                    color: black,
                                                    height: 100.h,
                                                    child: Image.asset(
                                                      "assets/images/blank.png",
                                                    )
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
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(
                                                  1.w),
                                            ),
                                            padding: EdgeInsets.only(
                                              left: 5.w,
                                              right: 5.w,
                                              bottom: 2.h,
                                            ),
                                            alignment: Alignment.bottomLeft,
                                            width: 100.w,
                                          ),
                                          Container(
                                            alignment: Alignment.topRight,
                                            padding: EdgeInsets.only(
                                              right: 3.w,
                                              top: 3.w,
                                            ),
                                            width: 100.w,
                                            height: 100.h,
                                            // color: black.withOpacity(.5),
                                            child: GestureDetector(
                                              onTap: () {

                                              },
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: backgroundColor,
                                                  borderRadius: BorderRadius
                                                      .all(
                                                      Radius.circular(20)),
                                                ),
                                                width: 13.w,
                                                height: 4.h,
                                                alignment: Alignment.center,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    Text(
                                                      "${cont
                                                          .allUnits[i]['likes']}",
                                                      style: Theme
                                                          .of(context)
                                                          .textTheme
                                                          .titleLarge!
                                                          .copyWith(
                                                        fontSize: 16.sp,
                                                      ),
                                                    ),
                                                    SizedBox(width: 1.w),
                                                    Icon(
                                                      Icons.favorite,
                                                      color: red,
                                                      size: 18.sp,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    Text(
                                      "${cont.allUnits[i]['title']}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    SizedBox(height: .5.h),
                                    Text(
                                      "${cont.allUnits[i]['address']}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                        color: darkGrey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.sp,
                                      ),
                                    ),
                                    SizedBox(height: .5.h),
                                    Text(
                                      "\$${cont.allUnits[i]['price']} / night",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                        fontSize: 18.sp,
                                        color: darkBlue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
                  }),
                ),
                SizedBox(height: 3.h),

              ],
            ),
          ),
        ),
      );
    });
  }
}

