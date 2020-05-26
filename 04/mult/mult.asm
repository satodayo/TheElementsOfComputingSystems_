// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

    @R2
    M=0 //R2レジスタの値=0,初期化
    @i  //カウント用のレジスタ
    M=1 //iレジスタの値=1
(LOOP)
    @i
    D=M //D = i
    @R1
    D=D-M   //D=D-(R1レジスタの値)//カウント数とR1の値の比較
    @END
    D;JGT // カウント数がR1よりも大きくなったら終了
    @R0
    D=M //D=R0
    @R2
    M=D+M //R2=R0+R2　//結果のレジスタに直接足してく
    @i
    M=M+1 //カウントアップ
    @LOOP
    0;JMP   //GOTO JUMP(強制)
(END)
    @END
    0;JMP   //無限ループ