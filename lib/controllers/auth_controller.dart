// controllers/auth_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Observable variables สำหรับ loading states
  var isLoginLoading = false.obs;
  var isRegisterLoading = false.obs;
  var isForgetPasswordLoading = false.obs;
  var isLoggedIn = false.obs;

  // Observable สำหรับ password visibility
  var isLoginPasswordVisible = false.obs;
  var isRegisterPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  // Text controllers สำหรับ Login
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  // Text controllers สำหรับ Register
  final registerNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerConfirmPasswordController = TextEditingController();
  final registerPhoneController = TextEditingController();

  // Text controllers สำหรับ Forget Password
  final forgetPasswordEmailController = TextEditingController();

  // Form keys สำหรับ validation
  final loginFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();
  final forgetPasswordFormKey = GlobalKey<FormState>();

  // =========== LOGIN METHODS ===========
  void toggleLoginPasswordVisibility() {
    isLoginPasswordVisible.value = !isLoginPasswordVisible.value;
  }

  Future<void> login() async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }

    isLoginLoading.value = true;
    
    try {
      // จำลอง API call - แทนที่ด้วย API จริงของคุณ
      await Future.delayed(const Duration(seconds: 2));
      
      String email = loginEmailController.text.trim();
      String password = loginPasswordController.text.trim();

      // ตรวจสอบข้อมูล (ตัวอย่าง - ควรตรวจสอบกับ API จริง)
      if (email == "test@example.com" && password == "123456") {
        isLoggedIn.value = true;
        Get.snackbar(
          'สำเร็จ',
          'เข้าสู่ระบบสำเร็จ',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green[400],
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );
        
        // นำทางไปหน้า Home หรือหน้าหลัก
        // Get.offAllNamed('/home');
        
      } else {
        Get.snackbar(
          'ผิดพลาด',
          'อีเมลหรือรหัสผ่านไม่ถูกต้อง',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red[400],
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      }
      
    } catch (e) {
      Get.snackbar(
        'เกิดข้อผิดพลาด',
        'ไม่สามารถเข้าสู่ระบบได้ กรุณาลองใหม่อีกครั้ง',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red[400],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoginLoading.value = false;
    }
  }

  void clearLoginForm() {
    loginEmailController.clear();
    loginPasswordController.clear();
  }

  // =========== REGISTER METHODS ===========
  void toggleRegisterPasswordVisibility() {
    isRegisterPasswordVisible.value = !isRegisterPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  Future<void> register() async {
    if (!registerFormKey.currentState!.validate()) {
      return;
    }

    // ตรวจสอบรหัสผ่านตรงกันหรือไม่
    if (registerPasswordController.text != registerConfirmPasswordController.text) {
      Get.snackbar(
        'ผิดพลาด',
        'รหัสผ่านไม่ตรงกัน',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red[400],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
      return;
    }

    isRegisterLoading.value = true;
    
    try {
      // จำลอง API call
      await Future.delayed(const Duration(seconds: 2));
      
      // ตัวอย่างการสมัครสมาชิก
      Get.snackbar(
        'สำเร็จ',
        'สมัครสมาชิกสำเร็จ กรุณาเข้าสู่ระบบ',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green[400],
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
      
      // กลับไปหน้า Login
      clearRegisterForm();
      Get.back();
      
    } catch (e) {
      Get.snackbar(
        'เกิดข้อผิดพลาด',
        'ไม่สามารถสมัครสมาชิกได้ กรุณาลองใหม่อีกครั้ง',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red[400],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isRegisterLoading.value = false;
    }
  }

  void clearRegisterForm() {
    registerNameController.clear();
    registerEmailController.clear();
    registerPasswordController.clear();
    registerConfirmPasswordController.clear();
    registerPhoneController.clear();
  }

  // =========== FORGET PASSWORD METHODS ===========
  Future<void> sendResetPasswordEmail() async {
    if (!forgetPasswordFormKey.currentState!.validate()) {
      return;
    }

    isForgetPasswordLoading.value = true;
    
    try {
      // จำลอง API call
      await Future.delayed(const Duration(seconds: 2));
      
      String email = forgetPasswordEmailController.text.trim();
      
      Get.snackbar(
        'สำเร็จ',
        'ส่งลิงก์รีเซ็ตรหัสผ่านไปยัง $email แล้ว',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green[400],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
      
      // กลับไปหน้า Login
      clearForgetPasswordForm();
      Get.back();
      
    } catch (e) {
      Get.snackbar(
        'เกิดข้อผิดพลาด',
        'ไม่สามารถส่งอีเมลรีเซ็ตรหัสผ่านได้',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red[400],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isForgetPasswordLoading.value = false;
    }
  }

  void clearForgetPasswordForm() {
    forgetPasswordEmailController.clear();
  }

  // =========== LOGOUT METHOD ===========
  void logout() {
    isLoggedIn.value = false;
    clearLoginForm();
    Get.snackbar(
      'ออกจากระบบ',
      'ออกจากระบบสำเร็จ',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blue[400],
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
    // Get.offAllNamed('/login');
  }

  // =========== VALIDATION METHODS ===========
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอกอีเมล';
    }
    
    // ตรวจสอบรูปแบบอีเมล
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    
    if (!regex.hasMatch(value)) {
      return 'รูปแบบอีเมลไม่ถูกต้อง';
    }
    
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอกรหัสผ่าน';
    }
    
    if (value.length < 6) {
      return 'รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร';
    }
    
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอกชื่อ';
    }
    
    if (value.length < 2) {
      return 'ชื่อต้องมีอย่างน้อย 2 ตัวอักษร';
    }
    
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอกเบอร์โทรศัพท์';
    }
    
    // ตรวจสอบรูปแบบเบอร์โทรศัพท์ไทย
    String pattern = r'^[0-9]{10}$';
    RegExp regex = RegExp(pattern);
    
    if (!regex.hasMatch(value)) {
      return 'รูปแบบเบอร์โทรศัพท์ไม่ถูกต้อง (10 หลัก)';
    }
    
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอกยืนยันรหัสผ่าน';
    }
    
    if (value != registerPasswordController.text) {
      return 'รหัสผ่านไม่ตรงกัน';
    }
    
    return null;
  }

  // =========== DISPOSE CONTROLLERS ===========
  @override
  void onClose() {
    // Login controllers
    loginEmailController.dispose();
    loginPasswordController.dispose();
    
    // Register controllers
    registerNameController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    registerConfirmPasswordController.dispose();
    registerPhoneController.dispose();
    
    // Forget password controller
    forgetPasswordEmailController.dispose();
    
    super.onClose();
  }
}