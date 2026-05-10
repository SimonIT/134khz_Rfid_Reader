# 134.2 kHz RFID Reader (EM4095 + ESP32)

A low-frequency RFID reader designed and built to explore the fundamentals of LF RFID communication systems at 134.2 kHz.

This project uses the EM4095 RFID analog front-end with an ESP32 for signal processing and data handling. A custom PCB with an integrated coil antenna was designed specifically for this implementation.

---

## Overview

The system operates at 134.2 kHz and detects compatible LF RFID tags through magnetic field coupling. The EM4095 handles signal amplification and demodulation, while the ESP32 processes the received data.

The project was developed as a practical hardware learning experience covering:
- RFID communication principles
- Analog front-end interfacing
- Coil antenna design
- PCB design and testing
- Embedded firmware development

---

## Features

- 134.2 kHz low-frequency RFID operation
- Custom-designed PCB
- Integrated PCB coil antenna
- EM4095 RFID analog front-end
- ESP32-based data processing
- Compact hardware design

---

## System Architecture

1. The PCB coil antenna generates a magnetic field at 134.2 kHz.
2. When an RFID tag enters the field, the tag modulates the carrier signal.
3. The EM4095 detects and demodulates the received signal.
4. The ESP32 reads and processes the decoded data.

---

## Project Images

### PCB Layout
![PCB Layout](images/Screenshot%202026-03-31%20210803.png)

### 3D View
![3D View](images/Screenshot%202026-03-31%20210818.png)

### Schematic
![Schematic](images/Screenshot%202026-03-31%20210833.png)

---

## Hardware Components

- EM4095 RFID IC
- ESP32
- Custom PCB coil antenna

---

## Repository Structure

```text
hardware/   -> PCB layout and schematic files
software/   -> ESP32 firmware
images/     -> Project images
