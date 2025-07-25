// register.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/auth_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('สมัครสมาชิก'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: authController.registerFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              
              // Icon
              const Icon(
                Icons.person_add_outlined,
                size: 80,
                color: Colors.blue,
              ),
              
              const SizedBox(height: 20),
              
              const Text(
                'สร้างบัญชีใหม่',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              
              const SizedBox(height: 8),
              
              const Text(
                'กรอกข้อมูลเพื่อสร้างบัญชีของคุณ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Name TextField
              TextFormField(
                controller: authController.registerNameController,
                validator: authController.validateName,
                decoration: const InputDecoration(
                  labelText: 'ชื่อ-นามสกุล',
                  prefixIcon: Icon(Icons.person_outlined),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Email TextField
              TextFormField(
                controller: authController.registerEmailController,
                keyboardType: TextInputType.emailAddress,
                validator: authController.validateEmail,
                decoration: const InputDecoration(
                  labelText: 'อีเมล',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Phone TextField
              TextFormField(
                controller: authController.registerPhoneController,
                keyboardType: TextInputType.phone,
                validator: authController.validatePhone,
                decoration: const InputDecoration(
                  labelText: 'เบอร์โทรศัพท์',
                  prefixIcon: Icon(Icons.phone_outlined),
                  hintText: '0812345678',
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Password TextField
              Obx(() => TextFormField(
                controller: authController.registerPasswordController,
                obscureText: !authController.isRegisterPasswordVisible.value,
                validator: authController.validatePassword,
                decoration: InputDecoration(
                  labelText: 'รหัสผ่าน',
                  prefixIcon: const Icon(Icons.lock_outlined),
                  suffixIcon: IconButton(
                    icon: Icon(
                      authController.isRegisterPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: authController.toggleRegisterPasswordVisibility,
                  ),
                  helperText: 'รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร',
                ),
              )),
              
              const SizedBox(height: 20),
              
              // Confirm Password TextField
              Obx(() => TextFormField(
                controller: authController.registerConfirmPasswordController,
                obscureText: !authController.isConfirmPasswordVisible.value,
                validator: authController.validateConfirmPassword,
                decoration: InputDecoration(
                  labelText: 'ยืนยันรหัสผ่าน',
                  prefixIcon: const Icon(Icons.lock_outlined),
                  suffixIcon: IconButton(
                    icon: Icon(
                      authController.isConfirmPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: authController.toggleConfirmPasswordVisibility,
                  ),
                ),
              )),
              
              const SizedBox(height: 30),
              
              // Terms and Conditions
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.info_outline,
                    size: 20,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          height: 1.4,
                        ),
                        children: [
                          TextSpan(text: 'การสมัครสมาชิกหมายความว่าคุณยอมรับ '),
                          TextSpan(
                            text: 'เงื่อนไขการใช้งาน',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(text: ' และ '),
                          TextSpan(
                            text: 'นโยบายความเป็นส่วนตัว',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(text: ' ของเรา'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // Register Button
              Obx(() => SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: authController.isRegisterLoading.value 
                      ? null 
                      : authController.register,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 56),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                  child: authController.isRegisterLoading.value
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                            SizedBox(width: 12),
                            Text('กำลังสมัครสมาชิก...'),
                          ],
                        )
                      : const Text('สมัครสมาชิก'),
                ),
              )),
              
              const SizedBox(height: 20),
              
              // Back to Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'มีบัญชีอยู่แล้ว? ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      'เข้าสู่ระบบ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}