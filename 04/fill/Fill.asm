// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

    //define screen

    @8192   //32*256
    D=A;
    @num_of_pixcel
    M=D

    @R0 //state of screen
    M=0 //screen empty
(LOOP)
    @KBD
    D=M;
    @KEY_NOT_PRESSED
    D;JEQ //入力が0である
    @KEY_PRESSED
    0;JMP
(KEY_NOT_PRESSED)
    @R1
    M=0
    @CHECK_STATE_CHANGED
    0;JMP
(KEY_PRESSED)
    @R1
    M=1
(CHECK_STATE_CHANGED)
    @R0 //state of screen
    D=M
    @R1 //selected state of screen
    D=D-M   //選択されたものと現在の状態が等しければ何もせずに最初に戻る
    @LOOP
    D;JEQ
    @i
    M=0
    @R1
    D=M
    @R0
    M=D
    @FILL_BLACK
    D;JGT
(FILL_WHITE)
    @i
    D=M
    @num_of_pixcel
    D=M-D   //8192 - 現在のピクセル番号
    @LOOP
    D;JLT   //塗り終わったので最初に戻る
    @SCREEN //スクリーンの最初のワード
    A=A+D   //塗るワードを指定
    M=0 //白で塗る
    @i
    M=M+1   //次のワード指定
    @FILL_WHITE
    0;JMP
(FILL_BLACK)
    @i
    D=M
    @num_of_pixcel
    D=M-D
    @LOOP
    D;JLT
    @SCREEN
    A=A+D
    M=-1 //2の補数
    @i
    M=M+1
    @FILL_BLACK
    0;JMP