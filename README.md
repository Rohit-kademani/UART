## TEAM 3 : Fpga implementation of Universal Asynchronous Receiver And Transmitter [UART].<br>

UART Stands for Universal Asynchronous Receiver And Transmitter.<br>
It sends data bits one by one, from the least significant to the most significant bits so that precise timing is handled by the communication channel.<br>

#### Modules used for building uart are : <br>
* Advanced Peripheral Bus[APB Slave].
* Baud Generator.
* Transmit Buffer.
* Transmit State Machine.
* Receive State Machine.
* Receive Buffer.<br>

#### Specification : <br>

* Input Data : 8 bit.<br>
* Output Data : 8 bit.<br>
* Baud Rate : 9600.<br>
* Frequency : 30Mhz.<br>

#### Control Bits : <br>

* PWRITE : <br>
0-To do read operation.<br>
1-To do write operation.<br>

* PSEL<br>
* PENABLE<br>
* PRESETN<br>
* PADDR<br>











