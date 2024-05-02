part of '../screens.dart';

class RecommendedUnitsScreen extends StatefulWidget {
  const RecommendedUnitsScreen({super.key});

  @override
  State<RecommendedUnitsScreen> createState() => _RecommendedUnitsScreenState();
}

class _RecommendedUnitsScreenState extends State<RecommendedUnitsScreen> {
  UnitsContImp unitsContImp = Get.put(UnitsContImp());
  @override
  Widget build(BuildContext context) {
    Get.put(UnitsContImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          "Recommended Units",
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(
            Icons.navigate_before,
            color: black,
            size: 25.sp,
          ),
          onTap: () => Get.back(),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: RefreshIndicator(
          onRefresh: () async {
            await unitsContImp.getUnits();
          },
          child: SizedBox(
            width: 100.w,
            height: 100.h,
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
                return SingleChildScrollView(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cont.allUnits.length,
                      physics: const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int i) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(()=>ViewUnitScreen(id: cont.allUnits[i]['id']));
                          },
                          child: Container(
                            width: 95.w,
                            padding: const EdgeInsets.all(10),
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
                                              color: lightGrey,
                                            ),
                                            clipBehavior: Clip.antiAlias,
                                            height: 15.h,
                                            width: 35.w,
                                            child: CachedNetworkImage(
                                              imageUrl: "${cont.allUnits[i]['images'][0]}",
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
                                                "${cont.allUnits[i]['title']} ${cont.allUnits[i]['title']}",
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
                                                  "${cont.allUnits[i]['address']}",
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
                                                    "\$${cont.allUnits[i]['price']} / night",
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
        ),
      ),
    );
  }
}
