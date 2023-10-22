# <ins>4-Bit_Calculator</ins>

## <ins>4-BIT CALCULATOR DESIGN, SIMULATION, and IMPLEMENTATION</ins>

### <ins>INTRODUCTION</ins>

>Figure 7.1 depicts the datapath for the calculator to be designed in this experiment. The wires in the vertical direction represent the data, while the labeled horizontal wires coming from the sides, including the ALU Carry-In (Cin) signal, are 
the control signals from the FSM used to facilitate various operations through the calculator. Depending on the Input_Select signal, various externally and internally generated data signals can be fed to the datapath from the top: Bitwise inverted and non-inverted input data (DIN), inverted and non-inverted register B (RB), arithmetic-right-shifted (ARS), logical-right-shifted (LRS), and logical-left-shifted (LLS), and non-shifted register A (RA). Both RA and RB are 4-bit wide. The 4-bit Arithmetic Logic Unit (ALU), ARS, LRS, LLS units are purely combinational, and do not contain any memory elements. The ALU unit in this calculator can only do one of eight operations based on the ALU_OP value, as shown in Table 7.1 below. Note the clock signal going to RA and RB are not shown in Figure 7.1.
>* Programming Language: Vhdl
>* IDE: Altera Quartus
>* Device: DEO Board with Cyclone III EP3C16F484C6 FPGA

![image](https://github.com/yavuzCodiin/4-Bit_Calculator/assets/82445309/0d59d79d-a487-4b06-91fd-521ab66b65ee)

### <ins>Finite State Machine</ins>

>FSM stands for Finite State Machine. It is a mathematical model used in computer science and engineering to design and describe the behavior of systems that can be in a finite number of states at any given time. FSMs are widely used in various applications, including digital circuit design, software engineering, natural language processing, and modeling real-world systems

#### <ins>FSM OUTPUT SEQUENCE PLANNING</ins>

![image](https://github.com/yavuzCodiin/4-Bit_Calculator/assets/82445309/223ef82e-3bb8-4d9c-9d64-ec211c49ec70)
![image](https://github.com/yavuzCodiin/4-Bit_Calculator/assets/82445309/22a6d918-acf3-49ed-9e99-98fc71c1850d)
![image](https://github.com/yavuzCodiin/4-Bit_Calculator/assets/82445309/d37067c7-ab9c-4be0-acf3-b5938ee254ee)
![image](https://github.com/yavuzCodiin/4-Bit_Calculator/assets/82445309/95ceb944-f68e-4718-a7fa-5578aa6df20a)

>We have 5 states with One-Hot Statement Let me briefly explain what this FSM vhdl code is doing. When Run input is 1 and clock is rising from 0 to 1(rising clock edge) we can change our states like s0,s1,s2, s3, s4, consecutively. It will stay at current state but when Run input becomes 0 then states return to s0. When we defined all micro-operations(MOP) we can 
control outputs with inputs(Load_A, Load_B, Reset, Cin, Aluop …).

![image](https://github.com/yavuzCodiin/4-Bit_Calculator/assets/82445309/d94701b0-30ce-47ca-96f6-30b968d19cbb)

>There are 3 inputs MOP, RUN, CLK and according to them output is changing. if we select 
0110, ADD21 micro-operation will do, or if we select 0111 ADD3 micro operation will do.

### <ins>Arithmetic Logic Unit</ins>

>Arithmetic Logic Unit (ALU) is a crucial component within a computer's central processing unit (CPU) that performs arithmetic and logic operations on data. It is responsible for carrying out various mathematical operations like addition, subtraction, multiplication, division, as well as logical operations such as AND, OR, NOT, and comparisons like greater than, less than, and equal to.

![image](https://github.com/yavuzCodiin/4-Bit_Calculator/assets/82445309/e1289714-df03-4f3b-af93-aeeefb3f405d)

>I tried to show you every ALU operation 0 to 7 you can select operation then with X and Y which is entered by user it will do operations like addition, and, xor, or etc. For example if you select ALU_OP=001, Cin=0 X =1010 and Y=0011 it will give result of ALU_OUT=1101 or if there is Cin=1 it will give result of ALU_OUT=1110

### <ins>Arithmetic Right Shift</ins>

>Arithmetic right shift is a bitwise operation that shifts the bits of a binary number to the right. In this operation, the most significant bit (the leftmost bit, often called the sign bit in signed number representations) is used as the fill bit. When you perform an arithmetic right shift, the sign bit is copied into the vacant bit positions that are created by the shift.

>Starting with most significant bit , ARS shifts every bit of 4 - bit output of the RA(RegisterA) to 
the right by 1,but most significant one stays what it is before.

![image](https://github.com/yavuzCodiin/4-Bit_Calculator/assets/82445309/5cbec547-95d5-4dd4-a67f-e970b8c55477)

>For example in this one first one is 1000 then with ARS it will become 1100 as you 
can see from waveform

### <ins>Logical Right Shift</ins>

>Logical Right Shift is a bitwise operation that shifts the bits of a binary number to the right. In a logical right shift, vacant positions created by the shift are filled with zeros. Unlike an arithmetic right shift where the sign bit is copied, in a logical right shift, zeros are always used to fill the empty positions. LRS shifts every bit of 4-bit output of the RA(RegisterA) starting with most significant one to right by 1 and most significant bit will be 0

![image](https://github.com/yavuzCodiin/4-Bit_Calculator/assets/82445309/ea30703a-78bf-48f5-a382-49de6c12423e)

>In this one for example if LRS_INPUT=1010 after LRS, LRS_OUTPUT will become 0100

### <ins>Logical Left Shift</ins>

>Logical Left Shift is a bitwise operation that shifts the bits of a binary number to the left. In a logical left shift, vacant positions created by the shift are filled with zeros. Each bit in the binary number is moved to the left by a specified number of positions, and zeros are filled in from the right.

>This one starts with least significant bit and every bit of 4 bit output of RA(registerA) 
are shifted by LLS to left by 1 and least significant bit will be 0

![image](https://github.com/yavuzCodiin/4-Bit_Calculator/assets/82445309/4f005f31-5058-4b91-8537-58b58015a4ae)

>As you can see in this one for example if input is 0011 after LLS output will become 0110

### <ins>8 to 1 Multiplexer</ins>

>8-to-1 multiplexer (often abbreviated as 8x1 MUX) is a combinational circuit that selects one of the 8 input data lines and directs it to a single output line. The selection of the input line to be routed to the output line is controlled by 3 selection lines (A, B, and C in this case) that provide 3 bits of control.
>Here's how it works:
>* Inputs: The multiplexer has 8 input lines (usually labeled D0 to D7), each carrying a binary signal (0 or 1).
>* Selection Lines: The 3 selection lines (A, B, and C) determine which input line is selected. These lines can represent any binary number from 000 to 111, where each combination of A, B, and C represents a unique selection.
>* Output: The selected input line's value is transferred to the output line (often labeled Y).

>The truth table for an 8-to-1 multiplexer is as follows:
![image](https://github.com/yavuzCodiin/4-Bit_Calculator/assets/82445309/1a464bc3-4995-4f99-8d00-7da97d59f0f1)
>
>In this truth table, D0 to D7 represent the input data lines. The combination of A, B, and C selects one of these lines, and the value on the selected input line is transmitted to the output Y.

>8to1 multiplexer is based on 8 inputs each selection input is 3bit. 100 is the fourth 
input or 010 is second input etc.

![image](https://github.com/yavuzCodiin/4-Bit_Calculator/assets/82445309/119b21fb-bd78-4668-bf48-7409c2473806)

>In this one for example if I select ınput select as 100 then output will RB directly and 
RB is [13] => output = [13] || or if I select ınput select as 001(LLS) output will be [7] 

### <ins>Register</ins>

>In digital electronics, a register is a group of flip-flops (binary storage elements) that store binary data as individual bits. Registers are fundamental building blocks used in various parts of a computer system, including processors, memory units, and input/output interfaces. They are crucial for data manipulation, storage, and transfer within a digital system.
>
>Here are the key aspects of registers:
>
>1. Storage of Data: Registers store binary data, which can represent numbers, instructions, addresses, or any other digital information. Each bit within a register can store either 0 or 1.
>
>2. Size: Registers can vary in size, commonly coming in sizes such as 8-bit, 16-bit, 32-bit, or 64-bit, indicating the number of bits they can store. For example, a 32-bit register can store 32 binary digits (bits).
>
>3. Data Manipulation: Registers are used for various arithmetic and logic operations. Processors use registers to perform computations, comparisons, and other operations, making them essential for the central processing unit (CPU) functionality.
>
>4. Data Transfer: Data is transferred between registers and other parts of the computer system, such as memory or input/output devices. Registers act as temporary storage during these transfers.
>
>5. Data Buffering: Registers are used as buffers to hold data temporarily when transferring data between different parts of a system operating at different speeds.
>
>6. Types of Registers:
>
>* Data Registers: Used to store data temporarily during operations.
>* Address Registers: Store memory addresses for read and write operations.
>* Program Counter (PC): Holds the memory address of the next instruction to be executed.
>* Instruction Register (IR): Stores the current instruction being executed.
>* Status Register/Flags Register: Holds status flags (e.g., zero, carry, overflow) indicating the outcome of operations.
>* Index Registers: Used for indexing in memory operations.
>
>Whenever clock is on rising edge and if input of load is 1 register takes new Data and stores it however if load=0 it continues to stores same data or if reset is 1 it reset the data which is stored

![image](https://github.com/yavuzCodiin/4-Bit_Calculator/assets/82445309/85b242d8-32b6-4e18-bd4a-cdaf6f89d3d1)

>My first input is [3] until clock is on rising edge, load is 1 and rst is 0 output stays as a [0] when this condition happens my input [3] appears on output. After this when clock is again rising and load is 1 my output should be [3] but there is another factor reset is also 1 when clock is on rising edge so my output appears as [0] which means it resets.

## <ins>DATAPATH PART OF CALCULATOR</ins>

### <ins>WAVEFORM</ins>

![image](https://github.com/yavuzCodiin/4-Bit_Calculator/assets/82445309/9066e6ec-b415-40ed-bad7-e59f24918cf5)

>We can see “010” ALU operation which is ADD3 mıcro operation in this waveform which is (cin+loadA+LoadB)

### <ins>Block Diagram Schematic Of DATAPATH Of Calculator</ins>

![image](https://github.com/yavuzCodiin/4-Bit_Calculator/assets/82445309/875f3db9-447a-4c47-9ca7-ec74c08a39a6)

### <ins>Functional Simulation of Calculator</ins>

![image](https://github.com/yavuzCodiin/4-Bit_Calculator/assets/82445309/f7e75c47-c603-4004-bb1c-088d2882dead)

### <ins>Timing Simulation of Calculator</ins>

![image](https://github.com/yavuzCodiin/4-Bit_Calculator/assets/82445309/d218287c-0df2-41e1-9ce0-3cfbb8ac9fce)

>Fmax can be found from 1/T, T is worst case delay and 1/(4.5*10^-9) =0.22x10^9

## <ins>Conclusion</ins>

>Now we can run whole 4-bit calculator with all operations we set up for calculator. It have some main parts which are FSM(Finite State Machine) which has MOP(Micro-operations). Datapath that includes calculator's brain which is ALU(Arithmetic Logic Unit), multiplexers and hexadecimal decoder. This project was very important for me because after all logic design related knowledge I learned, now I can see bigger picture after I combine everything I learned. Now I can see that theory turns into practice with my 4-bit FPGA calculator.


