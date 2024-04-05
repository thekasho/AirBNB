part of '../screens.dart';

class OTPCodeScreen extends StatefulWidget {
  const OTPCodeScreen({super.key});

  @override
  State<OTPCodeScreen> createState() => _OTPCodeScreenState();
}

class _OTPCodeScreenState extends State<OTPCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text("Verification Page"),
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
                      "Verification Code",
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
                        "We have sent the verification code to your email.",
                        style: Theme.of(context).textTheme.titleSmall
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              OtpTextField(
                fieldWidth: 50.0,
                borderRadius: BorderRadius.circular(10.0),
                numberOfFields: 6,
                borderColor: const Color(0xFF512DA8),
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {

                }, // end onSubmit
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Didn`t receive the code?! ",
                      style: Theme.of(context).textTheme.titleSmall
                  ),
                  TextButton(
                    onPressed: (){
                      Get.back();
                      Get.toNamed(screenResetPassword);
                    },
                    child: Text(
                        "Request new code",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: darkBlue)
                    ),
                  )
                ],
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
                        "Verify",
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: white),
                      ),
                      onPressed: () {
                        Get.back();
                        Get.toNamed(screenNewPassword);
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
