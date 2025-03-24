# คำสั่ง Linux สำหรับโปรเจกต์ mesa-fpga-emulator

## 1. ติดตั้งเครื่องมือจำลอง GHDL + GTKWave
```bash
sudo apt update
sudo apt install ghdl gtkwave
```
> ใช้สำหรับรัน simulation และดู waveform จาก testbench

---

## 2. คอมไพล์ไฟล์ VHDL ด้วย GHDL
```bash
ghdl -a uart_top.vhd
ghdl -a sim/uart_tb.vhd
```
> คำสั่ง `-a` = analyze (ตรวจสอบและเตรียมไฟล์ให้พร้อม)

---

## 3. สร้าง executable จาก testbench
```bash
ghdl -e uart_tb
```
> คำสั่ง `-e` = elaborate (สร้าง executable เพื่อ run simulation)

---

## 4. รัน simulation และบันทึก waveform
```bash
ghdl -r uart_tb --vcd=uart_tb.vcd
```
> จะได้ไฟล์ `uart_tb.vcd` สำหรับเปิดดูใน GTKWave

---

## 5. เปิด waveform ด้วย GTKWave
```bash
gtkwave uart_tb.vcd
```
