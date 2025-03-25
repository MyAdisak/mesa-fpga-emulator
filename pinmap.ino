# Project: mesa-fpga-emulator
# File: pinmap_draft.md

## Arduino MEGA2560 Pin Mapping (Manual Console Interface)

### Joystick (Industrial Quadrature Encoder)
**X Axis:**
- Orange  (5V)       -> VCC
- Blue    (GND)      -> GND
- Brown   (CH2 - X)  -> Pin 2 (interrupt)
- Yellow  (CH1 - X)  -> Pin 3 (interrupt)

**Y Axis:**
- Orange  (5V)       -> VCC
- Blue    (GND)      -> GND
- Brown   (CH2 - Y)  -> Pin 18 (interrupt)
- Yellow  (CH1 - Y)  -> Pin 19 (interrupt)

> NOTE: ใช้ Pin ที่รองรับ external interrupt โดยตรงสำหรับ encoder เพื่อความแม่นยำสูงสุด

### Keypad (26-pin flat cable)
- Uses digital pins: 22 to 47 (26 pins)
- Will be scanned as 8x8 matrix (5 inputs / 5 outputs + ground + VCC)
- TBD: Logic level detection via pull-up/pull-down (จะเพิ่ม schema เร็วๆ นี้)

---

### Reserved Future Use:
- Z/A Axis encoder inputs
- FPGA SPI / UART debug signals
- HAL handshake lines to LinuxCNC

---

## สายสีที่มี:
- Orange = +5V
- Blue   = GND
- Brown  = CH2 (Encoder B)
- Yellow = CH1 (Encoder A)

---

**Next:**
- [ ] เขียน sketch ทดสอบ encoder X/Y แบบ serial debug
- [ ] ทดสอบสแกน keypad matrix
- [ ] วางไดอะแกรม + schematic + wiring table
- [ ] เชื่อม LinuxCNC HAL driver ผ่าน LPT หรือ Serial

> สู้ไปด้วยกัน เราจะทำให้มันเจ๋งกว่า Mesa ได้แน่นอน!
