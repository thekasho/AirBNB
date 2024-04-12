part of '../screens.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  MainHomeContImp mainHomeContImp = Get.put(MainHomeContImp());
  @override
  Widget build(BuildContext context) {
    Get.put(MainHomeContImp());
    Get.put(ProfileContImp());
    return GetBuilder<ProfileContImp>(builder: (cont) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          toolbarHeight: 8.h,
          title: Text(
              "Profile",
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium
          ),
          leading: Icon(
            Icons.navigate_before,
            color: black,
            size: 30.sp,
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 2.h),
                Container(
                  width: 35.w,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle
                  ),
                  child: CachedNetworkImage(
                    imageUrl: mainHomeContImp.avatar,
                    errorWidget: (_, i, e) {
                      return Icon(
                        FontAwesomeIcons.image,
                        size: 13.sp,
                        color: Colors.white,
                      );
                    },
                  ),
                ),
                Form(
                  key: cont.formstate,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: Column(
                      children: [
                        SizedBox(height: 4.h),
                        AuthInput(
                          controller: cont.username,
                          hintText: "Username",
                          isNumber: false,
                          isPassword: false,
                          suffixIcon: const Icon(Icons.person_outline),
                          valid: (val) {
                            return validInput(val!, 5, 100, "username");
                          },
                        ),
                        SizedBox(height: 3.h),
                        AuthInput(
                          controller: cont.email,
                          hintText: "Email",
                          isNumber: false,
                          isPassword: false,
                          suffixIcon: const Icon(Icons.email_outlined),
                          valid: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                        ),
                        SizedBox(height: 3.h),
                        AuthInput(
                          controller: cont.mobile,
                          hintText: "Mobile",
                          isNumber: false,
                          isPassword: false,
                          suffixIcon: const Icon(Icons.phone_android),
                          valid: (val) {
                            return validInput(val!, 5, 100, "phone");
                          },
                        ),
                        SizedBox(height: 3.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 90.w,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                                      vertical: 2.h,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Update",
                                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: white),
                                ),
                                onPressed: () {

                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
