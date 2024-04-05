part of '../screens.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text("Forgot Password"),
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            color: Colors.black,
            size: 22.sp,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 100.w,
                    height: 5.h,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Text(
                      "New Password",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Text(
                        "Create your new password",
                        style: Theme.of(context).textTheme.titleSmall
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              AuthInputField(
                hinttext: "",
                iconData: Icons.visibility_off_outlined,
                isNumber: false,
                isPassword: true,
                labeltext: "Password",
                mycontroller: TextEditingController(),
                valid: (val) {
                  return validInput(val!, 5, 100, "password");
                },
                onTapIcon: (){
                  print(1);
                },
              ),
              SizedBox(height: 3.h),
              AuthInputField(
                hinttext: "",
                iconData: Icons.visibility_off_outlined,
                isNumber: false,
                isPassword: true,
                labeltext: "Confirm Password",
                mycontroller: TextEditingController(),
                valid: (val) {
                  return validInput(val!, 5, 100, "password");
                },
                onTapIcon: (){
                  print(1);
                },
              ),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
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
                        "Continue",
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: white),
                      ),
                      onPressed: () {
                        Get.toNamed(screenOTPCode);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
