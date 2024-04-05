part of '../screens.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text("Reset Password Page"),
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
                      "Reset Password",
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
                        "Please enter your email address to request new password",
                        style: Theme.of(context).textTheme.titleSmall
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              AuthInputField(
                hinttext: "Your Email",
                iconData: Icons.email,
                isNumber: false,
                isPassword: false,
                labeltext: "Email",
                mycontroller: TextEditingController(),
                valid: (val) {
                  return validInput(val!, 5, 100, "email");
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
                        "Request OTP code",
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: white),
                      ),
                      onPressed: () {
                        Get.toNamed(screenOTPCode);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Already Have an account? ",
                      style: Theme.of(context).textTheme.titleSmall
                  ),
                  TextButton(
                    onPressed: (){
                      Get.back();
                      Get.toNamed(screenLogin);
                    },
                    child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: darkBlue)
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
