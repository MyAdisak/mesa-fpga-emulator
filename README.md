# mesa-fpga-emulator

โปรเจกต์นี้คือการจำลองการทำงานของระบบ **MESA computer architecture** ลงบนชิป **FPGA** (รุ่นที่ใช้: Xilinx Spartan) เพื่อศึกษาวิธีการทำงานระดับ hardware โดยไม่ต้องใช้อุปกรณ์ MESA ดั้งเดิม

## เป้าหมายของโปรเจกต์

- [x] สร้าง UART communication module
- [x] สร้าง emulator logic สำหรับ MESA CPU core
- [ ] เชื่อมต่อกับ memory/IO interface เพิ่มเติมในอนาคต
- [ ] ออกแบบให้สามารถ debug ได้ผ่าน simulation

## โครงสร้างไฟล์โปรเจกต์
