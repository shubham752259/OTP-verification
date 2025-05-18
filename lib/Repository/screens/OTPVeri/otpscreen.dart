import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:machine_project_2/Repository/screens/registrationscreen/regiscreen.dart';

class Otpscreen extends StatefulWidget {
  final String verificationid;
  final String phoneNumber;
  final int? resendToken;

  const Otpscreen({
    super.key,
    required this.verificationid,
    required this.phoneNumber,
    this.resendToken,
  });

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  TextEditingController otpController = TextEditingController();
  bool isResending = false;

  void _resendCode() async {
    setState(() => isResending = true);

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      forceResendingToken: widget.resendToken,
      verificationCompleted: (_) {},
      verificationFailed: (FirebaseAuthException ex) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Resend failed: ${ex.message}")),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("OTP resent successfully")),
        );
        setState(() => isResending = false);
      },
      codeAutoRetrievalTimeout: (_) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter the OTP",
                suffixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                String otp = otpController.text.trim();

                if (otp.length != 6) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please enter a valid 6-digit OTP")),
                  );
                  return;
                }

                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationid,
                    smsCode: otp,
                  );

                  await FirebaseAuth.instance
                      .signInWithCredential(credential)
                      .then((value) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const regiscreen()),
                    );
                  });
                } catch (ex) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error: ${ex.toString()}")),
                  );
                }
              },
              child: const Text("Verify OTP"),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: isResending ? null : _resendCode,
              child: isResending
                  ? const CircularProgressIndicator()
                  : const Text("Resend Code"),
            ),
          ],
        ),
      ),
    );
  }
}
