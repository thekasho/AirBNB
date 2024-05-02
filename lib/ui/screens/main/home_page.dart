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
                MainHomeTitle(
                  sectionTitle: "Featured..",
                  onTap: () async {
                    Get.toNamed(screenPopularUnits);
                  },
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
                                          return FeaturedUnitItem(
                                            address: fcont.fUnits[i]['address'],
                                            imageLink: fcont.fUnits[i]['images'][0],
                                            isLike: fcont.fUnits[i]['is_like'],
                                            likes: fcont.fUnits[i]['likes'],
                                            price: fcont.fUnits[i]['price'],
                                            title: fcont.fUnits[i]['title'],
                                            onTap: () => Get.to( () => ViewUnitScreen(id: fcont.fUnits[i]['id']) ),
                                            likeOnTap: () {
                                              fcont.fUnits[i]['is_like'] == 1 ? fcont.fUnits[i]['is_like'] = 0 : fcont.fUnits[i]['is_like'] = 1;
                                              fcont.fUnits[i]['is_like'] == 1
                                                  ? fcont.fUnits[i]['likes'] = fcont.fUnits[i]['likes'] +1
                                                  : fcont.fUnits[i]['likes'] = fcont.fUnits[i]['likes'] -1;
                                              fcont.update();
                                              fcont.likeUnit(fcont.fUnits[i]['id']);
                                            },
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
                MainHomeTitle(
                  sectionTitle: "Our Recommendation..",
                  onTap: () {
                    Get.toNamed(screenRecommendedUnits);
                  },
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
                        FilterButton(
                          title: "All",
                          currentPage: bcont.currentPage,
                          current: 0,
                          onPressed: (){
                            bcont.currentPage = 0;
                            bcont.filterUnits(0);
                            bcont.update();
                          },
                          icon: Icons.select_all,
                        ),
                        SizedBox(width: 2.w),
                        FilterButton(
                          title: "Apartment",
                          currentPage: bcont.currentPage,
                          current: 1,
                          onPressed: (){
                            bcont.currentPage = 1;
                            bcont.filterUnits(1);
                            bcont.update();
                          },
                          icon: Icons.apartment_rounded,
                        ),
                        SizedBox(width: 2.w),
                        FilterButton(
                          title: "Villa",
                          currentPage: bcont.currentPage,
                          current: 2,
                          onPressed: (){
                            bcont.currentPage = 2;
                            bcont.filterUnits(2);
                            bcont.update();
                          },
                          icon: Icons.villa_rounded,
                        ),
                        SizedBox(width: 2.w),
                        FilterButton(
                          title: "House",
                          currentPage: bcont.currentPage,
                          current: 3,
                          onPressed: (){
                            bcont.currentPage = 3;
                            bcont.filterUnits(3);
                            bcont.update();
                          },
                          icon: Icons.house_rounded,
                        ),
                        SizedBox(width: 2.w),
                        FilterButton(
                          title: "Farm House",
                          currentPage: bcont.currentPage,
                          current: 4,
                          onPressed: (){
                            bcont.currentPage = 4;
                            bcont.filterUnits(4);
                            bcont.update();
                          },
                          icon: Icons.house_siding_rounded,
                        ),
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
                          shrinkWrap: true,
                          itemCount: cont.allUnits.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 5.w,
                            childAspectRatio: .63,
                          ),
                          itemBuilder: (_, i) {
                            return HomeUnitsItem(
                              title: cont.allUnits[i]['title'],
                              price: cont.allUnits[i]['price'],
                              likes: cont.allUnits[i]['likes'],
                              isLike: cont.allUnits[i]['is_like'],
                              imageLink: cont.allUnits[i]['images'][0],
                              address: cont.allUnits[i]['address'],
                              onTap: () => Get.to( () => ViewUnitScreen(id: cont.allUnits[i]['id']) ),
                              onLikeTap: (){
                                cont.allUnits[i]['is_like'] == 1 ? cont.allUnits[i]['is_like'] = 0 : cont.allUnits[i]['is_like'] = 1;
                                cont.allUnits[i]['is_like'] == 1
                                    ? cont.allUnits[i]['likes'] = cont.allUnits[i]['likes'] +1
                                    : cont.allUnits[i]['likes'] = cont.allUnits[i]['likes'] -1;
                                cont.update();
                                cont.likeUnit(cont.allUnits[i]['id']);
                              },
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
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      );
    });
  }
}

