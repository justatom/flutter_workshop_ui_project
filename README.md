# flutter_workshop_ui_project

แอพ **Orange ส้ม** — Flutter workshop UI จาก Figma (E01–E06)

| ไฟล์ | Class | หน้าจอ | ไปหน้า |
|---|---|---|---|
| `lib/e01_page_ui.dart` | `E01PageUI` | Welcome — BERRY JUICE (หน้าแรก) | Explore Now → E02 |
| `lib/e02_page_ui.dart` | `E02PageUI` | Login (Welcome back) | Forgot Password? → E04, Create account → E03 |
| `lib/e03_page_ui.dart` | `E03PageUI` | Register | Sign Up / Log in → E02 |
| `lib/e04_page_ui.dart` | `E04PageUI` | Forgot your password? | Send code → E05, Create account → E03 |
| `lib/e05_page_ui.dart` | `E05PageUI` | OTP Verification (4 หลัก, นับถอยหลัง 30 วิ) | Verify → E06 |
| `lib/e06_page_ui.dart` | `E06PageUI` | Create New Password | Submit → E02 |

ไฟล์อื่น: `lib/main.dart` (MaterialApp, home = E01PageUI), `lib/app_theme.dart` (สี/รูป/theme),
`lib/widgets/common_widgets.dart` (ภาพหัวส้ม, เส้น OR, ปุ่ม social, ลิงก์ข้อความ)

## วิธีรัน

```powershell
cd D:\Flutter\flutter_workshop_ui_project
powershell -ExecutionPolicy Bypass -File .\setup_project.ps1   # flutter create + ตั้งชื่อแอพ "Orange ส้ม"
flutter run
```

ไอคอนแอพ (ไม่บังคับ): `dart run flutter_launcher_icons`

## ทดสอบขนาด iPhone 15 Pro Max (430 × 932)

- **Widget test** (รันบน Windows ได้): `flutter test` — เรนเดอร์ทุกหน้าที่ขนาด 1290×2796 @3x และเช็คว่าไม่มี overflow
- **iOS Simulator** (ต้องใช้ macOS + Xcode): `open -a Simulator` เลือก iPhone 15 Pro Max แล้ว `flutter run`
- **Chrome**: `flutter run -d chrome` → DevTools (F12) → Device toolbar → ตั้งขนาด 430 × 932
