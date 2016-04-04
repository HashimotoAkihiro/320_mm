
320mm:     file format elf32-littlemips


Disassembly of section .startup:

00000000 <_start>:
   0:	00000000 	nop
   4:	00000821 	move	$1,$0
   8:	00001021 	move	$2,$0
   c:	00001821 	move	$3,$0
  10:	00002021 	move	$4,$0
  14:	00002821 	move	$5,$0
  18:	00003021 	move	$6,$0
  1c:	00003821 	move	$7,$0
  20:	00004021 	move	$8,$0
  24:	00004821 	move	$9,$0
  28:	00005021 	move	$10,$0
  2c:	00005821 	move	$11,$0
  30:	00006021 	move	$12,$0
  34:	00006821 	move	$13,$0
  38:	00007021 	move	$14,$0
  3c:	00007821 	move	$15,$0
  40:	00008021 	move	$16,$0
  44:	00008821 	move	$17,$0
  48:	00009021 	move	$18,$0
  4c:	00009821 	move	$19,$0
  50:	0000a021 	move	$20,$0
  54:	0000a821 	move	$21,$0
  58:	0000b021 	move	$22,$0
  5c:	0000b821 	move	$23,$0
  60:	0000c021 	move	$24,$0
  64:	0000c821 	move	$25,$0
  68:	0000d021 	move	$26,$0
  6c:	0000d821 	move	$27,$0
  70:	0000f021 	move	$30,$0
  74:	0000f821 	move	$31,$0
  78:	3c1c0002 	lui	$28,0x2
  7c:	279c8000 	addiu	$28,$28,-32768
  80:	3c1d07ff 	lui	$29,0x7ff
  84:	37bdff00 	ori	$29,$29,0xff00
  88:	080001fc 	j	7f0 <main>
  8c:	00000000 	nop

Disassembly of section .text:

00000200 <mylib_wait>:
 200:	27bdfff8 	addiu	$29,$29,-8
 204:	00001021 	move	$2,$0
 208:	afa00000 	sw	$0,0($29)
 20c:	24040050 	li	$4,80
 210:	8fa30000 	lw	$3,0($29)
 214:	00000000 	nop
 218:	00621821 	addu	$3,$3,$2
 21c:	24420001 	addiu	$2,$2,1
 220:	1444fffb 	bne	$2,$4,210 <mylib_wait+0x10>
 224:	afa30000 	sw	$3,0($29)
 228:	03e00008 	jr	$31
 22c:	27bd0008 	addiu	$29,$29,8

00000230 <mylib_display_dec>:
 230:	04800068 	bltz	$4,3d4 <mylib_display_dec+0x1a4>
 234:	27bdfbf8 	addiu	$29,$29,-1032
 238:	1080005e 	beqz	$4,3b4 <mylib_display_dec+0x184>
 23c:	24020030 	li	$2,48
 240:	00003021 	move	$6,$0
 244:	3c076666 	lui	$7,0x6666
 248:	24e76667 	addiu	$7,$7,26215
 24c:	00870018 	mult	$4,$7
 250:	000447c3 	sra	$8,$4,0x1f
 254:	03a02821 	move	$5,$29
 258:	00001821 	move	$3,$0
 25c:	240f0001 	li	$15,1
 260:	240e0002 	li	$14,2
 264:	240d0003 	li	$13,3
 268:	240c0004 	li	$12,4
 26c:	240b0005 	li	$11,5
 270:	240a0006 	li	$10,6
 274:	00001010 	mfhi	$2
 278:	00021083 	sra	$2,$2,0x2
 27c:	00481023 	subu	$2,$2,$8
 280:	0002c040 	sll	$24,$2,0x1
 284:	000210c0 	sll	$2,$2,0x3
 288:	03021021 	addu	$2,$24,$2
 28c:	00821023 	subu	$2,$4,$2
 290:	10400042 	beqz	$2,39c <mylib_display_dec+0x16c>
 294:	24090007 	li	$9,7
 298:	104f0044 	beq	$2,$15,3ac <mylib_display_dec+0x17c>
 29c:	00000000 	nop
 2a0:	104e004a 	beq	$2,$14,3cc <mylib_display_dec+0x19c>
 2a4:	00000000 	nop
 2a8:	104d0046 	beq	$2,$13,3c4 <mylib_display_dec+0x194>
 2ac:	00000000 	nop
 2b0:	104c0051 	beq	$2,$12,3f8 <mylib_display_dec+0x1c8>
 2b4:	00000000 	nop
 2b8:	104b004d 	beq	$2,$11,3f0 <mylib_display_dec+0x1c0>
 2bc:	00000000 	nop
 2c0:	104a0049 	beq	$2,$10,3e8 <mylib_display_dec+0x1b8>
 2c4:	00000000 	nop
 2c8:	10490045 	beq	$2,$9,3e0 <mylib_display_dec+0x1b0>
 2cc:	00000000 	nop
 2d0:	38420008 	xori	$2,$2,0x8
 2d4:	0002102b 	sltu	$2,$0,$2
 2d8:	24420038 	addiu	$2,$2,56
 2dc:	00870018 	mult	$4,$7
 2e0:	aca20000 	sw	$2,0($5)
 2e4:	24620001 	addiu	$2,$3,1
 2e8:	00002010 	mfhi	$4
 2ec:	00042083 	sra	$4,$4,0x2
 2f0:	00882023 	subu	$4,$4,$8
 2f4:	1480001d 	bnez	$4,36c <mylib_display_dec+0x13c>
 2f8:	24a50004 	addiu	$5,$5,4
 2fc:	10c00005 	beqz	$6,314 <mylib_display_dec+0xe4>
 300:	2404002d 	li	$4,45
 304:	00021080 	sll	$2,$2,0x2
 308:	03a21021 	addu	$2,$29,$2
 30c:	ac440000 	sw	$4,0($2)
 310:	24620002 	addiu	$2,$3,2
 314:	2442ffff 	addiu	$2,$2,-1
 318:	00021880 	sll	$3,$2,0x2
 31c:	03a31821 	addu	$3,$29,$3
 320:	8c660000 	lw	$6,0($3)
 324:	2442ffff 	addiu	$2,$2,-1
 328:	00022880 	sll	$5,$2,0x2
 32c:	03a52821 	addu	$5,$29,$5
 330:	27a7fffc 	addiu	$7,$29,-4
 334:	24040050 	li	$4,80
 338:	afa00400 	sw	$0,1024($29)
 33c:	00001021 	move	$2,$0
 340:	8fa30400 	lw	$3,1024($29)
 344:	00000000 	nop
 348:	00621821 	addu	$3,$3,$2
 34c:	24420001 	addiu	$2,$2,1
 350:	1444fffb 	bne	$2,$4,340 <mylib_display_dec+0x110>
 354:	afa30400 	sw	$3,1024($29)
 358:	10a70012 	beq	$5,$7,3a4 <mylib_display_dec+0x174>
 35c:	ac060000 	sw	$6,0($0)
 360:	8ca60000 	lw	$6,0($5)
 364:	080000ce 	j	338 <mylib_display_dec+0x108>
 368:	24a5fffc 	addiu	$5,$5,-4
 36c:	00870018 	mult	$4,$7
 370:	00401821 	move	$3,$2
 374:	000447c3 	sra	$8,$4,0x1f
 378:	00001010 	mfhi	$2
 37c:	00021083 	sra	$2,$2,0x2
 380:	00481023 	subu	$2,$2,$8
 384:	0002c040 	sll	$24,$2,0x1
 388:	000210c0 	sll	$2,$2,0x3
 38c:	03021021 	addu	$2,$24,$2
 390:	00821023 	subu	$2,$4,$2
 394:	1440ffc0 	bnez	$2,298 <mylib_display_dec+0x68>
 398:	00000000 	nop
 39c:	080000b7 	j	2dc <mylib_display_dec+0xac>
 3a0:	24020030 	li	$2,48
 3a4:	03e00008 	jr	$31
 3a8:	27bd0408 	addiu	$29,$29,1032
 3ac:	080000b7 	j	2dc <mylib_display_dec+0xac>
 3b0:	24020031 	li	$2,49
 3b4:	afa20000 	sw	$2,0($29)
 3b8:	24060030 	li	$6,48
 3bc:	080000c9 	j	324 <mylib_display_dec+0xf4>
 3c0:	00001021 	move	$2,$0
 3c4:	080000b7 	j	2dc <mylib_display_dec+0xac>
 3c8:	24020033 	li	$2,51
 3cc:	080000b7 	j	2dc <mylib_display_dec+0xac>
 3d0:	24020032 	li	$2,50
 3d4:	00042023 	negu	$4,$4
 3d8:	08000091 	j	244 <mylib_display_dec+0x14>
 3dc:	24060001 	li	$6,1
 3e0:	080000b7 	j	2dc <mylib_display_dec+0xac>
 3e4:	24020037 	li	$2,55
 3e8:	080000b7 	j	2dc <mylib_display_dec+0xac>
 3ec:	24020036 	li	$2,54
 3f0:	080000b7 	j	2dc <mylib_display_dec+0xac>
 3f4:	24020035 	li	$2,53
 3f8:	080000b7 	j	2dc <mylib_display_dec+0xac>
 3fc:	24020034 	li	$2,52

00000400 <mylib_display_hex>:
 400:	27bdffd0 	addiu	$29,$29,-48
 404:	03a01021 	move	$2,$29
 408:	afb0002c 	sw	$16,44($29)
 40c:	27a50020 	addiu	$5,$29,32
 410:	24060001 	li	$6,1
 414:	24070002 	li	$7,2
 418:	24080003 	li	$8,3
 41c:	24090004 	li	$9,4
 420:	24100005 	li	$16,5
 424:	24190006 	li	$25,6
 428:	24180007 	li	$24,7
 42c:	240f0008 	li	$15,8
 430:	240e0009 	li	$14,9
 434:	240d000a 	li	$13,10
 438:	240c000b 	li	$12,11
 43c:	240b000c 	li	$11,12
 440:	240a000d 	li	$10,13
 444:	3083000f 	andi	$3,$4,0xf
 448:	10600034 	beqz	$3,51c <mylib_display_hex+0x11c>
 44c:	00000000 	nop
 450:	1066003b 	beq	$3,$6,540 <mylib_display_hex+0x140>
 454:	00000000 	nop
 458:	1067003b 	beq	$3,$7,548 <mylib_display_hex+0x148>
 45c:	00000000 	nop
 460:	1068003b 	beq	$3,$8,550 <mylib_display_hex+0x150>
 464:	00000000 	nop
 468:	1069003d 	beq	$3,$9,560 <mylib_display_hex+0x160>
 46c:	00000000 	nop
 470:	1070003d 	beq	$3,$16,568 <mylib_display_hex+0x168>
 474:	00000000 	nop
 478:	1079003d 	beq	$3,$25,570 <mylib_display_hex+0x170>
 47c:	00000000 	nop
 480:	10780035 	beq	$3,$24,558 <mylib_display_hex+0x158>
 484:	00000000 	nop
 488:	106f003d 	beq	$3,$15,580 <mylib_display_hex+0x180>
 48c:	00000000 	nop
 490:	106e003d 	beq	$3,$14,588 <mylib_display_hex+0x188>
 494:	00000000 	nop
 498:	106d0037 	beq	$3,$13,578 <mylib_display_hex+0x178>
 49c:	00000000 	nop
 4a0:	106c003d 	beq	$3,$12,598 <mylib_display_hex+0x198>
 4a4:	00000000 	nop
 4a8:	106b0039 	beq	$3,$11,590 <mylib_display_hex+0x190>
 4ac:	00000000 	nop
 4b0:	106a003b 	beq	$3,$10,5a0 <mylib_display_hex+0x1a0>
 4b4:	00000000 	nop
 4b8:	3863000e 	xori	$3,$3,0xe
 4bc:	0003182b 	sltu	$3,$0,$3
 4c0:	24630065 	addiu	$3,$3,101
 4c4:	ac430000 	sw	$3,0($2)
 4c8:	24420004 	addiu	$2,$2,4
 4cc:	1445ffdd 	bne	$2,$5,444 <mylib_display_hex+0x44>
 4d0:	00042103 	sra	$4,$4,0x4
 4d4:	27a5001c 	addiu	$5,$29,28
 4d8:	27a6fffc 	addiu	$6,$29,-4
 4dc:	24040050 	li	$4,80
 4e0:	afa00020 	sw	$0,32($29)
 4e4:	00001021 	move	$2,$0
 4e8:	8fa30020 	lw	$3,32($29)
 4ec:	00000000 	nop
 4f0:	00621821 	addu	$3,$3,$2
 4f4:	24420001 	addiu	$2,$2,1
 4f8:	1444fffb 	bne	$2,$4,4e8 <mylib_display_hex+0xe8>
 4fc:	afa30020 	sw	$3,32($29)
 500:	8ca20000 	lw	$2,0($5)
 504:	24a5fffc 	addiu	$5,$5,-4
 508:	14a6fff5 	bne	$5,$6,4e0 <mylib_display_hex+0xe0>
 50c:	ac020000 	sw	$2,0($0)
 510:	8fb0002c 	lw	$16,44($29)
 514:	03e00008 	jr	$31
 518:	27bd0030 	addiu	$29,$29,48
 51c:	24030030 	li	$3,48
 520:	ac430000 	sw	$3,0($2)
 524:	24420004 	addiu	$2,$2,4
 528:	1445ffc6 	bne	$2,$5,444 <mylib_display_hex+0x44>
 52c:	00042103 	sra	$4,$4,0x4
 530:	27a5001c 	addiu	$5,$29,28
 534:	27a6fffc 	addiu	$6,$29,-4
 538:	08000138 	j	4e0 <mylib_display_hex+0xe0>
 53c:	24040050 	li	$4,80
 540:	08000148 	j	520 <mylib_display_hex+0x120>
 544:	24030031 	li	$3,49
 548:	08000148 	j	520 <mylib_display_hex+0x120>
 54c:	24030032 	li	$3,50
 550:	08000148 	j	520 <mylib_display_hex+0x120>
 554:	24030033 	li	$3,51
 558:	08000148 	j	520 <mylib_display_hex+0x120>
 55c:	24030037 	li	$3,55
 560:	08000148 	j	520 <mylib_display_hex+0x120>
 564:	24030034 	li	$3,52
 568:	08000148 	j	520 <mylib_display_hex+0x120>
 56c:	24030035 	li	$3,53
 570:	08000148 	j	520 <mylib_display_hex+0x120>
 574:	24030036 	li	$3,54
 578:	08000148 	j	520 <mylib_display_hex+0x120>
 57c:	24030061 	li	$3,97
 580:	08000148 	j	520 <mylib_display_hex+0x120>
 584:	24030038 	li	$3,56
 588:	08000148 	j	520 <mylib_display_hex+0x120>
 58c:	24030039 	li	$3,57
 590:	08000148 	j	520 <mylib_display_hex+0x120>
 594:	24030063 	li	$3,99
 598:	08000148 	j	520 <mylib_display_hex+0x120>
 59c:	24030062 	li	$3,98
 5a0:	08000148 	j	520 <mylib_display_hex+0x120>
 5a4:	24030064 	li	$3,100

000005a8 <mylib_display_char>:
 5a8:	27bdfff8 	addiu	$29,$29,-8
 5ac:	00001021 	move	$2,$0
 5b0:	afa00000 	sw	$0,0($29)
 5b4:	24050050 	li	$5,80
 5b8:	8fa30000 	lw	$3,0($29)
 5bc:	00000000 	nop
 5c0:	00621821 	addu	$3,$3,$2
 5c4:	24420001 	addiu	$2,$2,1
 5c8:	1445fffb 	bne	$2,$5,5b8 <mylib_display_char+0x10>
 5cc:	afa30000 	sw	$3,0($29)
 5d0:	ac040000 	sw	$4,0($0)
 5d4:	03e00008 	jr	$31
 5d8:	27bd0008 	addiu	$29,$29,8

000005dc <mylib_display_newline>:
 5dc:	27bdfff8 	addiu	$29,$29,-8
 5e0:	00001021 	move	$2,$0
 5e4:	afa00004 	sw	$0,4($29)
 5e8:	24040050 	li	$4,80
 5ec:	8fa30004 	lw	$3,4($29)
 5f0:	00000000 	nop
 5f4:	00621821 	addu	$3,$3,$2
 5f8:	24420001 	addiu	$2,$2,1
 5fc:	1444fffb 	bne	$2,$4,5ec <mylib_display_newline+0x10>
 600:	afa30004 	sw	$3,4($29)
 604:	2402000a 	li	$2,10
 608:	ac020000 	sw	$2,0($0)
 60c:	24040050 	li	$4,80
 610:	00001021 	move	$2,$0
 614:	afa00000 	sw	$0,0($29)
 618:	8fa30000 	lw	$3,0($29)
 61c:	00000000 	nop
 620:	00621821 	addu	$3,$3,$2
 624:	24420001 	addiu	$2,$2,1
 628:	1444fffb 	bne	$2,$4,618 <mylib_display_newline+0x3c>
 62c:	afa30000 	sw	$3,0($29)
 630:	2402000d 	li	$2,13
 634:	ac020000 	sw	$2,0($0)
 638:	03e00008 	jr	$31
 63c:	27bd0008 	addiu	$29,$29,8

00000640 <mylib_flush>:
 640:	24050800 	li	$5,2048
 644:	24040050 	li	$4,80
 648:	2406005f 	li	$6,95
 64c:	27bdfff8 	addiu	$29,$29,-8
 650:	afa00000 	sw	$0,0($29)
 654:	00001021 	move	$2,$0
 658:	8fa30000 	lw	$3,0($29)
 65c:	00000000 	nop
 660:	00621821 	addu	$3,$3,$2
 664:	24420001 	addiu	$2,$2,1
 668:	1444fffb 	bne	$2,$4,658 <mylib_flush+0x18>
 66c:	afa30000 	sw	$3,0($29)
 670:	24a5ffff 	addiu	$5,$5,-1
 674:	14a0fff6 	bnez	$5,650 <mylib_flush+0x10>
 678:	ac060000 	sw	$6,0($0)
 67c:	03e00008 	jr	$31
 680:	27bd0008 	addiu	$29,$29,8

00000684 <mylib_finalize>:
 684:	27bdffd8 	addiu	$29,$29,-40
 688:	afbf0024 	sw	$31,36($29)
 68c:	0c000177 	jal	5dc <mylib_display_newline>
 690:	00000000 	nop
 694:	afa0001c 	sw	$0,28($29)
 698:	00001021 	move	$2,$0
 69c:	24040050 	li	$4,80
 6a0:	8fa3001c 	lw	$3,28($29)
 6a4:	00000000 	nop
 6a8:	00621821 	addu	$3,$3,$2
 6ac:	24420001 	addiu	$2,$2,1
 6b0:	1444fffb 	bne	$2,$4,6a0 <mylib_finalize+0x1c>
 6b4:	afa3001c 	sw	$3,28($29)
 6b8:	24020045 	li	$2,69
 6bc:	ac020000 	sw	$2,0($0)
 6c0:	24040050 	li	$4,80
 6c4:	00001021 	move	$2,$0
 6c8:	afa00018 	sw	$0,24($29)
 6cc:	8fa30018 	lw	$3,24($29)
 6d0:	00000000 	nop
 6d4:	00621821 	addu	$3,$3,$2
 6d8:	24420001 	addiu	$2,$2,1
 6dc:	1444fffb 	bne	$2,$4,6cc <mylib_finalize+0x48>
 6e0:	afa30018 	sw	$3,24($29)
 6e4:	2402004e 	li	$2,78
 6e8:	ac020000 	sw	$2,0($0)
 6ec:	24040050 	li	$4,80
 6f0:	00001021 	move	$2,$0
 6f4:	afa00014 	sw	$0,20($29)
 6f8:	8fa30014 	lw	$3,20($29)
 6fc:	00000000 	nop
 700:	00621821 	addu	$3,$3,$2
 704:	24420001 	addiu	$2,$2,1
 708:	1444fffb 	bne	$2,$4,6f8 <mylib_finalize+0x74>
 70c:	afa30014 	sw	$3,20($29)
 710:	24020044 	li	$2,68
 714:	0c000177 	jal	5dc <mylib_display_newline>
 718:	ac020000 	sw	$2,0($0)
 71c:	24050800 	li	$5,2048
 720:	24040050 	li	$4,80
 724:	2406005f 	li	$6,95
 728:	afa00010 	sw	$0,16($29)
 72c:	00001021 	move	$2,$0
 730:	8fa30010 	lw	$3,16($29)
 734:	00000000 	nop
 738:	00621821 	addu	$3,$3,$2
 73c:	24420001 	addiu	$2,$2,1
 740:	1444fffb 	bne	$2,$4,730 <mylib_finalize+0xac>
 744:	afa30010 	sw	$3,16($29)
 748:	24a5ffff 	addiu	$5,$5,-1
 74c:	14a0fff6 	bnez	$5,728 <mylib_finalize+0xa4>
 750:	ac060000 	sw	$6,0($0)
 754:	080001d5 	j	754 <mylib_finalize+0xd0>
 758:	00000000 	nop

0000075c <make_crc32_table>:
 75c:	3c07edb8 	lui	$7,0xedb8
 760:	00004021 	move	$8,$0
 764:	34e78320 	ori	$7,$7,0x8320
 768:	24090100 	li	$9,256
 76c:	01001021 	move	$2,$8
 770:	080001e1 	j	784 <make_crc32_table+0x28>
 774:	24030008 	li	$3,8
 778:	2463ffff 	addiu	$3,$3,-1
 77c:	10600007 	beqz	$3,79c <make_crc32_table+0x40>
 780:	00c71026 	xor	$2,$6,$7
 784:	30450001 	andi	$5,$2,0x1
 788:	14a0fffb 	bnez	$5,778 <make_crc32_table+0x1c>
 78c:	00023042 	srl	$6,$2,0x1
 790:	2463ffff 	addiu	$3,$3,-1
 794:	1460fffb 	bnez	$3,784 <make_crc32_table+0x28>
 798:	00021042 	srl	$2,$2,0x1
 79c:	25080001 	addiu	$8,$8,1
 7a0:	ac820000 	sw	$2,0($4)
 7a4:	1509fff1 	bne	$8,$9,76c <make_crc32_table+0x10>
 7a8:	24840004 	addiu	$4,$4,4
 7ac:	03e00008 	jr	$31
 7b0:	00000000 	nop

000007b4 <update_crc32>:
 7b4:	00041027 	nor	$2,$0,$4
 7b8:	00001821 	move	$3,$0
 7bc:	24070020 	li	$7,32
 7c0:	00652006 	srlv	$4,$5,$3
 7c4:	00442026 	xor	$4,$2,$4
 7c8:	308400ff 	andi	$4,$4,0xff
 7cc:	00042080 	sll	$4,$4,0x2
 7d0:	00c42021 	addu	$4,$6,$4
 7d4:	8c840000 	lw	$4,0($4)
 7d8:	00021202 	srl	$2,$2,0x8
 7dc:	24630008 	addiu	$3,$3,8
 7e0:	1467fff7 	bne	$3,$7,7c0 <update_crc32+0xc>
 7e4:	00821026 	xor	$2,$4,$2
 7e8:	03e00008 	jr	$31
 7ec:	00021027 	nor	$2,$0,$2

000007f0 <main>:
 7f0:	8f838000 	lw	$3,-32768($28)
 7f4:	3c020000 	lui	$2,0x0
 7f8:	27bdfb98 	addiu	$29,$29,-1128
 7fc:	24420cb4 	addiu	$2,$2,3252
 800:	afb00440 	sw	$16,1088($29)
 804:	afbf0464 	sw	$31,1124($29)
 808:	8c700000 	lw	$16,0($3)
 80c:	afbe0460 	sw	$30,1120($29)
 810:	afb7045c 	sw	$23,1116($29)
 814:	afb60458 	sw	$22,1112($29)
 818:	afb50454 	sw	$21,1108($29)
 81c:	afb40450 	sw	$20,1104($29)
 820:	afb3044c 	sw	$19,1100($29)
 824:	afb20448 	sw	$18,1096($29)
 828:	afb10444 	sw	$17,1092($29)
 82c:	27a30010 	addiu	$3,$29,16
 830:	24440400 	addiu	$4,$2,1024
 834:	8c480000 	lw	$8,0($2)
 838:	8c470004 	lw	$7,4($2)
 83c:	8c460008 	lw	$6,8($2)
 840:	8c45000c 	lw	$5,12($2)
 844:	24420010 	addiu	$2,$2,16
 848:	ac680000 	sw	$8,0($3)
 84c:	ac670004 	sw	$7,4($3)
 850:	ac660008 	sw	$6,8($3)
 854:	ac65000c 	sw	$5,12($3)
 858:	1444fff6 	bne	$2,$4,834 <main+0x44>
 85c:	24630010 	addiu	$3,$3,16
 860:	70000048 	psubw	$0,$0,$0
 864:	02100018 	mult	$16,$16
 868:	00001012 	mflo	$2
 86c:	1840002c 	blez	$2,920 <main+0x130>
 870:	2442ffff 	addiu	$2,$2,-1
 874:	00027082 	srl	$14,$2,0x2
 878:	3c020003 	lui	$2,0x3
 87c:	24420001 	addiu	$2,$2,1
 880:	8f8f8004 	lw	$15,-32764($28)
 884:	01c27021 	addu	$14,$14,$2
 888:	000e7100 	sll	$14,$14,0x4
 88c:	3c020030 	lui	$2,0x30
 890:	00001821 	move	$3,$0
 894:	3c0dffe0 	lui	$13,0xffe0
 898:	3c0cfff0 	lui	$12,0xfff0
 89c:	00032080 	sll	$4,$3,0x2
 8a0:	01e42021 	addu	$4,$15,$4
 8a4:	78810000 	lq	$1,0($4)
 8a8:	78820010 	lq	$2,16($4)
 8ac:	00000000 	nop
 8b0:	7020203d 	pextw	$4,$1,0x0
 8b4:	7020287d 	pextw	$5,$1,0x1
 8b8:	702030bd 	pextw	$6,$1,0x2
 8bc:	702038fd 	pextw	$7,$1,0x3
 8c0:	7040403d 	pextw	$8,$2,0x0
 8c4:	7040487d 	pextw	$9,$2,0x1
 8c8:	704050bd 	pextw	$10,$2,0x2
 8cc:	704058fd 	pextw	$11,$2,0x3
 8d0:	70041835 	pinsw	$3,$0,$4,0x0
 8d4:	70052035 	pinsw	$4,$0,$5,0x0
 8d8:	00000000 	nop
 8dc:	70661875 	pinsw	$3,$3,$6,0x1
 8e0:	70872075 	pinsw	$4,$4,$7,0x1
 8e4:	00000000 	nop
 8e8:	706818b5 	pinsw	$3,$3,$8,0x2
 8ec:	708920b5 	pinsw	$4,$4,$9,0x2
 8f0:	00000000 	nop
 8f4:	706a18f5 	pinsw	$3,$3,$10,0x3
 8f8:	708b20f5 	pinsw	$4,$4,$11,0x3
 8fc:	004d2021 	addu	$4,$2,$13
 900:	004c2821 	addu	$5,$2,$12
 904:	7c400000 	sq	$0,0($2)
 908:	7c830000 	sq	$3,0($4)
 90c:	7ca40000 	sq	$4,0($5)
 910:	24630008 	addiu	$3,$3,8
 914:	24420010 	addiu	$2,$2,16
 918:	144effe0 	bne	$2,$14,89c <main+0xac>
 91c:	3063ffff 	andi	$3,$3,0xffff
 920:	1a00004a 	blez	$16,a4c <main+0x25c>
 924:	0010f080 	sll	$30,$16,0x2
 928:	03dec023 	subu	$24,$30,$30
 92c:	0010b900 	sll	$23,$16,0x4
 930:	03c0a021 	move	$20,$30
 934:	0018c080 	sll	$24,$24,0x2
 938:	03c04821 	move	$9,$30
 93c:	3c0f0010 	lui	$15,0x10
 940:	0000b021 	move	$22,$0
 944:	3c150010 	lui	$21,0x10
 948:	029e9021 	addu	$18,$20,$30
 94c:	025e8821 	addu	$17,$18,$30
 950:	013e5021 	addu	$10,$9,$30
 954:	01fe6021 	addu	$12,$15,$30
 958:	015e5821 	addu	$11,$10,$30
 95c:	3c0d0020 	lui	$13,0x20
 960:	00007021 	move	$14,$0
 964:	02959821 	addu	$19,$20,$21
 968:	02559021 	addu	$18,$18,$21
 96c:	02358821 	addu	$17,$17,$21
 970:	70000848 	psubw	$1,$0,$0
 974:	70001048 	psubw	$2,$0,$0
 978:	70001848 	psubw	$3,$0,$0
 97c:	70002048 	psubw	$4,$0,$0
 980:	01e01021 	move	$2,$15
 984:	01a01821 	move	$3,$13
 988:	78650000 	lq	$5,0($3)
 98c:	00492821 	addu	$5,$2,$9
 990:	004a3021 	addu	$6,$2,$10
 994:	004b4021 	addu	$8,$2,$11
 998:	8c440000 	lw	$4,0($2)
 99c:	8ca50000 	lw	$5,0($5)
 9a0:	8cc60000 	lw	$6,0($6)
 9a4:	8d080000 	lw	$8,0($8)
 9a8:	70a40609 	pmultsw	$5,$4
 9ac:	70003249 	pmflo	$6
	...
 9b8:	70260808 	paddw	$1,$1,$6
 9bc:	70a50609 	pmultsw	$5,$5
 9c0:	70003249 	pmflo	$6
	...
 9cc:	70461008 	paddw	$2,$2,$6
 9d0:	70a60609 	pmultsw	$5,$6
 9d4:	70003249 	pmflo	$6
	...
 9e0:	70661808 	paddw	$3,$3,$6
 9e4:	70a80609 	pmultsw	$5,$8
 9e8:	70003249 	pmflo	$6
	...
 9f4:	70862008 	paddw	$4,$4,$6
 9f8:	24420004 	addiu	$2,$2,4
 9fc:	144cffe2 	bne	$2,$12,988 <main+0x198>
 a00:	007e1821 	addu	$3,$3,$30
 a04:	01af1021 	addu	$2,$13,$15
 a08:	026d1821 	addu	$3,$19,$13
 a0c:	024d2021 	addu	$4,$18,$13
 a10:	022d2821 	addu	$5,$17,$13
 a14:	7c410000 	sq	$1,0($2)
 a18:	7c620000 	sq	$2,0($3)
 a1c:	7c830000 	sq	$3,0($4)
 a20:	7ca40000 	sq	$4,0($5)
 a24:	25ce0004 	addiu	$14,$14,4
 a28:	01d0102a 	slt	$2,$14,$16
 a2c:	1440ffd0 	bnez	$2,970 <main+0x180>
 a30:	25ad0010 	addiu	$13,$13,16
 a34:	26d60004 	addiu	$22,$22,4
 a38:	02d0102a 	slt	$2,$22,$16
 a3c:	0297a021 	addu	$20,$20,$23
 a40:	01f77821 	addu	$15,$15,$23
 a44:	1440ffc0 	bnez	$2,948 <main+0x158>
 a48:	01384821 	addu	$9,$9,$24
 a4c:	0c000177 	jal	5dc <mylib_display_newline>
 a50:	24130008 	li	$19,8
 a54:	2602fff9 	addiu	$2,$16,-7
 a58:	02020018 	mult	$16,$2
 a5c:	3c030030 	lui	$3,0x30
 a60:	24140050 	li	$20,80
 a64:	24110020 	li	$17,32
 a68:	00009012 	mflo	$18
 a6c:	00129080 	sll	$18,$18,0x2
 a70:	2652ffe0 	addiu	$18,$18,-32
 a74:	02439021 	addu	$18,$18,$3
 a78:	7a410000 	lq	$1,0($18)
 a7c:	7a420010 	lq	$2,16($18)
 a80:	00000000 	nop
 a84:	7020203d 	pextw	$4,$1,0x0
 a88:	7020307d 	pextw	$6,$1,0x1
 a8c:	702010bd 	pextw	$2,$1,0x2
 a90:	7020b8fd 	pextw	$23,$1,0x3
 a94:	7040b03d 	pextw	$22,$2,0x0
 a98:	7040a87d 	pextw	$21,$2,0x1
 a9c:	704018bd 	pextw	$3,$2,0x2
 aa0:	704028fd 	pextw	$5,$2,0x3
 aa4:	afa30434 	sw	$3,1076($29)
 aa8:	afa6043c 	sw	$6,1084($29)
 aac:	afa50438 	sw	$5,1080($29)
 ab0:	0c000100 	jal	400 <mylib_display_hex>
 ab4:	afa20430 	sw	$2,1072($29)
 ab8:	8fa6043c 	lw	$6,1084($29)
 abc:	afa0042c 	sw	$0,1068($29)
 ac0:	00001821 	move	$3,$0
 ac4:	8fa5042c 	lw	$5,1068($29)
 ac8:	00000000 	nop
 acc:	00a32821 	addu	$5,$5,$3
 ad0:	24630001 	addiu	$3,$3,1
 ad4:	1474fffb 	bne	$3,$20,ac4 <main+0x2d4>
 ad8:	afa5042c 	sw	$5,1068($29)
 adc:	ac110000 	sw	$17,0($0)
 ae0:	0c000100 	jal	400 <mylib_display_hex>
 ae4:	00c02021 	move	$4,$6
 ae8:	afa00428 	sw	$0,1064($29)
 aec:	00001821 	move	$3,$0
 af0:	8fa40428 	lw	$4,1064($29)
 af4:	00000000 	nop
 af8:	00832021 	addu	$4,$4,$3
 afc:	24630001 	addiu	$3,$3,1
 b00:	1474fffb 	bne	$3,$20,af0 <main+0x300>
 b04:	afa40428 	sw	$4,1064($29)
 b08:	8fa40430 	lw	$4,1072($29)
 b0c:	0c000100 	jal	400 <mylib_display_hex>
 b10:	ac110000 	sw	$17,0($0)
 b14:	afa00424 	sw	$0,1060($29)
 b18:	00001821 	move	$3,$0
 b1c:	8fa40424 	lw	$4,1060($29)
 b20:	00000000 	nop
 b24:	00832021 	addu	$4,$4,$3
 b28:	24630001 	addiu	$3,$3,1
 b2c:	1474fffb 	bne	$3,$20,b1c <main+0x32c>
 b30:	afa40424 	sw	$4,1060($29)
 b34:	ac110000 	sw	$17,0($0)
 b38:	0c000100 	jal	400 <mylib_display_hex>
 b3c:	02e02021 	move	$4,$23
 b40:	afa00420 	sw	$0,1056($29)
 b44:	00001821 	move	$3,$0
 b48:	8fa40420 	lw	$4,1056($29)
 b4c:	00000000 	nop
 b50:	00832021 	addu	$4,$4,$3
 b54:	24630001 	addiu	$3,$3,1
 b58:	1474fffb 	bne	$3,$20,b48 <main+0x358>
 b5c:	afa40420 	sw	$4,1056($29)
 b60:	ac110000 	sw	$17,0($0)
 b64:	0c000100 	jal	400 <mylib_display_hex>
 b68:	02c02021 	move	$4,$22
 b6c:	afa0041c 	sw	$0,1052($29)
 b70:	00001821 	move	$3,$0
 b74:	8fa4041c 	lw	$4,1052($29)
 b78:	00000000 	nop
 b7c:	00832021 	addu	$4,$4,$3
 b80:	24630001 	addiu	$3,$3,1
 b84:	1474fffb 	bne	$3,$20,b74 <main+0x384>
 b88:	afa4041c 	sw	$4,1052($29)
 b8c:	ac110000 	sw	$17,0($0)
 b90:	0c000100 	jal	400 <mylib_display_hex>
 b94:	02a02021 	move	$4,$21
 b98:	afa00418 	sw	$0,1048($29)
 b9c:	00001821 	move	$3,$0
 ba0:	8fa40418 	lw	$4,1048($29)
 ba4:	00000000 	nop
 ba8:	00832021 	addu	$4,$4,$3
 bac:	24630001 	addiu	$3,$3,1
 bb0:	1474fffb 	bne	$3,$20,ba0 <main+0x3b0>
 bb4:	afa40418 	sw	$4,1048($29)
 bb8:	8fa40434 	lw	$4,1076($29)
 bbc:	0c000100 	jal	400 <mylib_display_hex>
 bc0:	ac110000 	sw	$17,0($0)
 bc4:	afa00414 	sw	$0,1044($29)
 bc8:	00001821 	move	$3,$0
 bcc:	8fa40414 	lw	$4,1044($29)
 bd0:	00000000 	nop
 bd4:	00832021 	addu	$4,$4,$3
 bd8:	24630001 	addiu	$3,$3,1
 bdc:	1474fffb 	bne	$3,$20,bcc <main+0x3dc>
 be0:	afa40414 	sw	$4,1044($29)
 be4:	8fa40438 	lw	$4,1080($29)
 be8:	0c000100 	jal	400 <mylib_display_hex>
 bec:	ac110000 	sw	$17,0($0)
 bf0:	afa00410 	sw	$0,1040($29)
 bf4:	00001821 	move	$3,$0
 bf8:	8fa40410 	lw	$4,1040($29)
 bfc:	00000000 	nop
 c00:	00832021 	addu	$4,$4,$3
 c04:	24630001 	addiu	$3,$3,1
 c08:	1474fffb 	bne	$3,$20,bf8 <main+0x408>
 c0c:	afa40410 	sw	$4,1040($29)
 c10:	ac110000 	sw	$17,0($0)
 c14:	0c000177 	jal	5dc <mylib_display_newline>
 c18:	2673ffff 	addiu	$19,$19,-1
 c1c:	1660ff96 	bnez	$19,a78 <main+0x288>
 c20:	025e9021 	addu	$18,$18,$30
 c24:	1a000021 	blez	$16,cac <main+0x4bc>
 c28:	00003021 	move	$6,$0
 c2c:	00005821 	move	$11,$0
 c30:	00002021 	move	$4,$0
 c34:	3c0a0030 	lui	$10,0x30
 c38:	24080020 	li	$8,32
 c3c:	03c64821 	addu	$9,$30,$6
 c40:	00ca1021 	addu	$2,$6,$10
 c44:	8c450000 	lw	$5,0($2)
 c48:	00041827 	nor	$3,$0,$4
 c4c:	00001021 	move	$2,$0
 c50:	00452006 	srlv	$4,$5,$2
 c54:	00642026 	xor	$4,$3,$4
 c58:	308400ff 	andi	$4,$4,0xff
 c5c:	00042080 	sll	$4,$4,0x2
 c60:	27a70010 	addiu	$7,$29,16
 c64:	00e42021 	addu	$4,$7,$4
 c68:	8c840000 	lw	$4,0($4)
 c6c:	00031a02 	srl	$3,$3,0x8
 c70:	24420008 	addiu	$2,$2,8
 c74:	1448fff6 	bne	$2,$8,c50 <main+0x460>
 c78:	00831826 	xor	$3,$4,$3
 c7c:	24c60004 	addiu	$6,$6,4
 c80:	14c9ffef 	bne	$6,$9,c40 <main+0x450>
 c84:	00032027 	nor	$4,$0,$3
 c88:	256b0001 	addiu	$11,$11,1
 c8c:	1570ffec 	bne	$11,$16,c40 <main+0x450>
 c90:	03c64821 	addu	$9,$30,$6
 c94:	0c000100 	jal	400 <mylib_display_hex>
 c98:	00000000 	nop
 c9c:	0c000177 	jal	5dc <mylib_display_newline>
 ca0:	00000000 	nop
 ca4:	0c0001a1 	jal	684 <mylib_finalize>
 ca8:	00000000 	nop
 cac:	08000325 	j	c94 <main+0x4a4>
 cb0:	00002021 	move	$4,$0
