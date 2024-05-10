part of '../screens.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  MainHomeContImp mainHomeContImp = Get.put(MainHomeContImp());

  Future<bool> showExitPopup() async {
    return await showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            actionsPadding: const EdgeInsets.all(10),
            buttonPadding: const EdgeInsets.all(5),
            titlePadding: EdgeInsets.symmetric(
              vertical: 1.h,
              horizontal: 20,
            ),
            contentPadding: EdgeInsets.only(
              top: 2.h,
              bottom: 2.h,
              left: 5.w,
            ),
            actionsAlignment: MainAxisAlignment.center,
            title: Text(
              "Confirm Logout",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            content: Text(
              "Are You Sure?!",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18.sp,
                fontFamily: "Cairo",
              ),
            ),
            backgroundColor: white,
            actions: [
              MaterialButton(
                focusElevation: 10,
                color: Colors.grey.shade300,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                child: Text(
                  "No",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              SizedBox(width: 1.w),
              MaterialButton(
                focusElevation: 10,
                color: red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                child: Text(
                  "Yes",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(color: white),
                ),
                onPressed: () {
                  mainHomeContImp.logOut();
                },
              ),
            ],
          ),
    ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    Get.put(MainHomeContImp());
    return GetBuilder<MainHomeContImp>(builder: (cont) {
      return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                width: 30.w,
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
              Text(
                cont.username,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Divider(color: lightGrey.withOpacity(.5)),
              // GestureDetector(
              //   child: Container(
              //     width: 100.w,
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 2.w,
              //       vertical: 1.h,
              //     ),
              //     child: Row(
              //       children: [
              //         Icon(Icons.calendar_month, size: 25.sp, color: grey,),
              //         const Spacer(flex: 1),
              //         Text(
              //           "My Booking",
              //           style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 20.sp),
              //         ),
              //         const Spacer(flex: 15),
              //         Icon(FontAwesomeIcons.chevronRight, size: 20.sp, color: grey,),
              //       ],
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: () => Get.toNamed(screenProfileUpdate),
                child: Container(
                  width: 100.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 1.h,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.person, size: 25.sp, color: grey,),
                      const Spacer(flex: 1),
                      Text(
                        "Profile",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 20.sp),
                      ),
                      const Spacer(flex: 15),
                      Icon(FontAwesomeIcons.chevronRight, size: 20.sp, color: grey,),
                    ],
                  ),
                ),
              ),
              // GestureDetector(
              //   child: Container(
              //     width: 100.w,
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 2.w,
              //       vertical: 1.h,
              //     ),
              //     child: Row(
              //       children: [
              //         Icon(Icons.notifications_none_outlined, size: 25.sp, color: grey,),
              //         const Spacer(flex: 1),
              //         Text(
              //           "Notifications",
              //           style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 20.sp),
              //         ),
              //         const Spacer(flex: 15),
              //         Icon(FontAwesomeIcons.chevronRight, size: 20.sp, color: grey,),
              //       ],
              //     ),
              //   ),
              // ),
              // GestureDetector(
              //   child: Container(
              //     width: 100.w,
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 2.w,
              //       vertical: 1.h,
              //     ),
              //     child: Row(
              //       children: [
              //         Icon(Icons.language, size: 25.sp, color: grey,),
              //         const Spacer(flex: 1),
              //         Text(
              //           "Language",
              //           style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 20.sp),
              //         ),
              //         const Spacer(flex: 15),
              //         Icon(FontAwesomeIcons.chevronRight, size: 20.sp, color: grey,),
              //       ],
              //     ),
              //   ),
              // ),
              // GestureDetector(
              //   child: Container(
              //     width: 100.w,
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 2.w,
              //       vertical: 1.h,
              //     ),
              //     child: Row(
              //       children: [
              //         Icon(Icons.light_mode, size: 25.sp, color: grey,),
              //         const Spacer(flex: 1),
              //         Text(
              //           "APP Settings",
              //           style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 20.sp),
              //         ),
              //         const Spacer(flex: 15),
              //         Icon(FontAwesomeIcons.chevronRight, size: 20.sp, color: grey,),
              //       ],
              //     ),
              //   ),
              // ),
              // GestureDetector(
              //   child: Container(
              //     width: 100.w,
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 2.w,
              //       vertical: 1.h,
              //     ),
              //     child: Row(
              //       children: [
              //         Icon(Icons.policy, size: 25.sp, color: grey,),
              //         const Spacer(flex: 1),
              //         Text(
              //           "Privacy Policy",
              //           style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 20.sp),
              //         ),
              //         const Spacer(flex: 15),
              //         Icon(FontAwesomeIcons.chevronRight, size: 20.sp, color: grey,),
              //       ],
              //     ),
              //   ),
              // ),
              // GestureDetector(
              //   child: Container(
              //     width: 100.w,
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 2.w,
              //       vertical: 1.h,
              //     ),
              //     child: Row(
              //       children: [
              //         Icon(Icons.mail_outline, size: 25.sp, color: grey,),
              //         const Spacer(flex: 1),
              //         Text(
              //           "Contact Us",
              //           style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 20.sp),
              //         ),
              //         const Spacer(flex: 15),
              //         Icon(FontAwesomeIcons.chevronRight, size: 20.sp, color: grey,),
              //       ],
              //     ),
              //   ),
              // ),
              // GestureDetector(
              //   child: Container(
              //     width: 100.w,
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 2.w,
              //       vertical: 1.h,
              //     ),
              //     child: Row(
              //       children: [
              //         Icon(Icons.person_remove, size: 25.sp, color: grey,),
              //         const Spacer(flex: 1),
              //         Text(
              //           "Delete Account",
              //           style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 20.sp),
              //         ),
              //         const Spacer(flex: 15),
              //         Icon(FontAwesomeIcons.chevronRight, size: 20.sp, color: grey,),
              //       ],
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: () async {
                  await showExitPopup();
                  // cont.logOut();
                },
                child: Container(
                  width: 100.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 1.h,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.login_rounded, size: 25.sp, color: red,),
                      const Spacer(flex: 1),
                      Text(
                        "Logout",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 20.sp, color: red),
                      ),
                      const Spacer(flex: 15),
                      Icon(FontAwesomeIcons.chevronRight, size: 20.sp, color: red,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      );
    });
  }
}
