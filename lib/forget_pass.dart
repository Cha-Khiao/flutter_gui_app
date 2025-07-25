// forget_pass.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/auth_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ลืมรหัสผ่าน'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: authController.forgetPasswordFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              
              // Icon
              const Icon(
                Icons.lock_reset_outlined,
                size: 80,
                color: Colors.blue,
              ),
              
              const SizedBox(height: 20),
              
              const Text(
                'รีเซ็ตรหัสผ่าน',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              
              const SizedBox(height: 16),
              
              const Text(
                'กรอกอีเมลของคุณ เราจะส่งลิงก์สำหรับรีเซ็ตรหัสผ่านไปให้',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Instructions Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue[100]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.blue[600],
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'วิธีการรีเซ็ตรหัสผ่าน',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '1. กรอกอีเมลที่ใช้สมัครสมาชิก\n'
                      '2. กดปุ่ม "ส่งลิงก์รีเซ็ตรหัสผ่าน"\n'
                      '3. ตรวจสอบอีเมลและคลิกลิงก์ที่ได้รับ\n'
                      '4. ตั้งรหัสผ่านใหม่ตามที่ต้องการ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Email TextField
              TextFormField(
                controller: authController.forgetPasswordEmailController,
                keyboardType: TextInputType.emailAddress,
                validator: authController.validateEmail,
                decoration: const InputDecoration(
                  labelText: 'อีเมลที่ใช้สมัครสมาชิก',
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: 'example@email.com',
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Send Reset Email Button
              Obx(() => SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: authController.isForgetPasswordLoading.value 
                      ? null 
                      : authController.sendResetPasswordEmail,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 56),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                  child: authController.isForgetPasswordLoading.value
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
                            Text('กำลังส่งอีเมล...'),
                          ],
                        )
                      : const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.send_outlined),
                            SizedBox(width: 8),
                            Text('ส่งลิงก์รีเซ็ตรหัสผ่าน'),
                          ],
                        ),
                ),
              )),
              
              const SizedBox(height: 30),
              
              // Warning Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange[200]!),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.warning_amber_outlined,
                      color: Colors.orange[600],
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ข้อควรระวัง',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange[700],
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            '• ตรวจสอบโฟลเดอร์ Spam หากไม่พบอีเมล\n'
                            '• ลิงก์จะมีอายุการใช้งาน 24 ชั่วโมง\n'
                            '• หากไม่ได้รับอีเมล กรุณาตรวจสอบที่อยู่อีเมลให้ถูกต้อง',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Divider
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'หรือ',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              
              const SizedBox(height: 20),
              
              // Back to Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'จำรหัสผ่านได้แล้ว? ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      authController.clearForgetPasswordForm();
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
              
              // Contact Support
              Center(
                child: TextButton.icon(
                  onPressed: () {
                    // เพิ่ม logic สำหรับติดต่อฝ่ายสนับสนุน
                    Get.snackbar(
                      'ติดต่อฝ่ายสนับสนุน',
                      'กรุณาส่งอีเมลไปที่ support@example.com',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.blue[400],
                      colorText: Colors.white,
                      duration: const Duration(seconds: 3),
                    );
                  },
                  icon: const Icon(
                    Icons.support_agent_outlined,
                    color: Colors.grey,
                  ),
                  label: const Text(
                    'ติดต่อฝ่ายสนับสนุน',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}