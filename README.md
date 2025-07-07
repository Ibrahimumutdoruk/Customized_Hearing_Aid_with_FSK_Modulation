# Customized_Hearing_Aid_with_FSK_Modulation
---
This repository contains the full implementation of a personalized hearing aid system that leverages FSK modulation and digital signal processing techniques. The system is developed using **MATLAB**, **LabVIEW**, and **NI USRP-2900**. It is designed to test individual hearing thresholds and transmit personalized gain values wirelessly, which are then applied through a real-time audio filtering process using a filter bank structure.
![Workflow](https://github.com/user-attachments/assets/84c26c86-1c8f-40a9-bcb4-0b0fd8284f44) 
---

##  Requirements

- MATLAB R2021b or later
- NI LabVIEW Communication Design Suite 2.0
- NI USRP-2900 hardware
- LabVIEW-MATLAB Interface
- Sound output (speakers/headphones)
- MATLAB App Designer support

---


##  How to Run the Project ?

### 1. Run the Transmitter in LabVIEW

- Navigate to the `LabVIEW/` folder.
- Open and run `Transmitter.vi`.
- Ensure the correct USRP device is selected and active.
- This block begins sending the hearing test tones via GFSK modulation.

---

### 2. Launch the MATLAB Hearing Test App

- Go to the `MATLAB/` folder.
- Open and run `HearingTestApp.mlapp`.
- This app will present test tones at various frequencies.

 ![image](https://github.com/user-attachments/assets/3d7be009-ec2c-4ab2-a32d-ace12a74acf9)
  

- Click `StartTestButton` to begin.
- Respond with `HearButton` or `NotHearButton` based on perception.
- After the test ends, click `StartAudio` to transmit gain profile to LabVIEW.

---

### 3. Run the Receiver in LabVIEW

- Open `Receiver.vi` from the `LabVIEW/` folder.
- Run it to start receiving modulated signals via USRP.
- Gain data will be decoded and mapped in real-time.

---

### 4. Audio Synchronization and Output

- Click the `Audio Sync` button on the receiver panel.
- The audio will begin playing through the output system with a minimal delay.
- The filter bank will dynamically apply gains based on received thresholds, shaping the sound in real time.

---

##  System Flow Summary

1. **LabVIEW Transmitter** plays test tones.
2. **MATLAB App** determines per-band hearing threshold.
3. Gain values encoded as FSK symbols.
4. **LabVIEW Receiver** demodulates and decodes gain data.
5. Filter bank applies gain for each band dynamically.
6. User hears adapted audio output.

---
##  Contributors

You can access the full project paper by contacting us directly or by visiting our LinkedIn profiles listed above.

**Emirhan Garip** – [LinkedIn](https://www.linkedin.com/in/emirhan-garip-776146215/)) – [emirhan.garip@agu.edu.tr](mailto:emirhan.garip@agu.edu.tr)
**İbrahim Umut Doruk** – [LinkedIn](https://www.linkedin.com/in/ibrahim-umut-doruk-9b1860217/)) – [i.umut98@hotmail.com](mailto:i.umut98@hotmail.com)


