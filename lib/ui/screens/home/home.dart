part of '../screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


final List<Widget> imageSliders = imgList.map((item) =>
    ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: Stack(
        children: <Widget>[
          Image.network(
            item,
            fit: BoxFit.cover,
          ),
        ],
      ),
    ),).toList();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(LandingControllerImp());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<LandingControllerImp>(builder: (cont) {
          if(cont.requestStatus == RequestStatus.loading){
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
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 2.h),
                Container(
                  alignment: Alignment.center,
                  width: 100.w,
                  height: 5.h,
                  child: Text(
                    "Welcome to BNB APP",
                    style: Theme
                        .of(context)
                        .textTheme
                        .displayLarge,
                  ),
                ),
                SizedBox(
                  width: 100.w,
                  height: 38.h,
                  child: CarouselSlider(
                    items: imageSliders,
                    // carouselController: _controller,
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      aspectRatio: 16 / 9,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  alignment: Alignment.center,
                  width: 100.w,
                  height: 5.h,
                  child: Text(
                    "The Perfect Choice fir our future",
                    style: Theme
                        .of(context)
                        .textTheme
                        .displaySmall,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80.w,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              primaryColor),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(
                                vertical: 2.h
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.mail, size: 25, color: white),
                            SizedBox(width: 1.w),
                            Text(
                              "Login to your account",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(color: white),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Get.toNamed(screenLogin);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Container(
                  alignment: Alignment.center,
                  width: 100.w,
                  height: 5.h,
                  child: Text(
                    "OR",
                    style: Theme
                        .of(context)
                        .textTheme
                        .displaySmall,
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80.w,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              backgroundColor),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(
                                vertical: 2.h
                            ),
                          ),
                        ),
                        child: Text(
                          "Continue as Guest",
                          style: Theme
                              .of(context)
                              .textTheme
                              .headlineMedium,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Don`t Have an account? ",
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(screenRegister);
                      },
                      child: Text(
                          "Sign Up",
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: darkBlue)
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
