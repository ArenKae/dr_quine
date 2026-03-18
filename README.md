# Dr_Quine

<p align="center">
  <img src="https://github.com/ArenKae/ArenKae/blob/main/42%20badges/dr_quine.png" alt="dr-quine badge"/>
</p>

## An introduction to self-replicating programs
A quine is a computer program that takes no input and produces a copy of its own source code as its only output. Writing a quine confronts the programmer with the principle of self-reproduction and the problems that derive from it (see Kleene's recursion theorem). While they have little purpose in the real world, they often serve as an introduction to more complex replication problems, particularly malwares.

For this project, we'll work on 3 different quine variations, implemented in C, x86-64 assembly, and Python for the bonus part. Since this is my first assembly project, you will also find some notes providing detailed comments about the exercises and explaining essential notions and syntax to understand this language. The notes are written in french in the 'Cours assembleur' directory.

### 💻 This project was developed and tested on Ubuntu 24.04.2 LTS.

## Status
✅ Completed on: 16/03/2026
</br>
🏆 Grade: 125/100

## Usage and testing
Clone this repository and navigate to the directory with the name of the desired language. Use ```make``` to compile, then run one of the three program.

### Colleen
```bash
./Colleen > tmp_Colleen && diff Colleen.c tmp_Colleen
```
You should see no result, indicating the generated file and source file are identical.

### Grace
```bash
./Grace && diff Grace.c Grace_kid.c
```
There should be no difference between the source file and the generated Grace_kid.c.

### Sully
Run ```./Sully``` to launch the program and generate files. You can then compare them with ```diff Sully.c Sully_X.c```. Starting from X = 4, the only difference should be the value of the integer i used to decrement the files after each iteration.

> [!NOTE]
For assembly, the steps are the same—just replace the file names with the corresponding .s equivalent.

> [!NOTE]
For Python, no compilation is required. Simply run ```python3 file_name``` to launch the program, then test with diff as usual.
