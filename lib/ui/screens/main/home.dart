part of '../screens.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(MainHomeContImp());
    return GetBuilder<MainHomeContImp>(builder: (cont) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          leadingWidth: 100.w,
          toolbarHeight: 8.h,
          leading: Row(
            children: [
              SizedBox(width: 4.w),
              Container(
                width: 15.w,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle
                ),
                child: CachedNetworkImage(
                  imageUrl: cont.avatar,
                  errorWidget: (_, i, e) {
                    return Icon(
                      FontAwesomeIcons.image,
                      size: 13.sp,
                      color: Colors.white,
                    );
                  },
                ),
              ),
              SizedBox(width: 4.w),
              SizedBox(
                width: 55.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex: 2),
                    Text(
                      "Hello Welcome ..",
                      style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: darkGrey,
                      ),
                    ),
                    const Spacer(),
                    Text(
                        cont.username,
                        style: Theme
                            .of(context)
                            .textTheme
                            .displayMedium,
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              InkWell(
                onTap: () {},
                child: Icon(Icons.circle_notifications, size: 12.w, color: primaryColor),
              ),
              const Spacer(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: (){},
          child: Icon(Icons.add, color: white, size: 25.sp),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomAppBar(),
        body: cont.pagesList.elementAt(cont.currentPage),
      );
    });
  }
}
