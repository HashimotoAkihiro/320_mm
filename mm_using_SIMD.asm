
mm_using_SIMD:     file format elf32-littlemips


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
  78:	3c1c0005 	lui	$28,0x5
  7c:	279c7ff0 	addiu	$28,$28,32752
  80:	3c1d7fff 	lui	$29,0x7fff
  84:	37bdff00 	ori	$29,$29,0xff00
  88:	080001d0 	j	740 <main>
  8c:	00000000 	nop

Disassembly of section .text:

00000200 <output_buffer_put>:
 200:	8f828410 	lw	$2,-31728($28)
 204:	3c070005 	lui	$7,0x5
 208:	24e70000 	addiu	$7,$7,0
 20c:	24430001 	addiu	$3,$2,1
 210:	28650400 	slti	$5,$3,1024
 214:	00471021 	addu	$2,$2,$7
 218:	af838410 	sw	$3,-31728($28)
 21c:	14a00008 	bnez	$5,240 <output_buffer_put+0x40>
 220:	a0440000 	sb	$4,0($2)
 224:	24040001 	li	$4,1
 228:	00e02821 	move	$5,$7
 22c:	00603021 	move	$6,$3
 230:	24020fa4 	li	$2,4004
 234:	0000000c 	syscall
 238:	00401821 	move	$3,$2
 23c:	af808410 	sw	$0,-31728($28)
 240:	03e00008 	jr	$31
 244:	00000000 	nop

00000248 <mylib_wait>:
 248:	27bdfff8 	addiu	$29,$29,-8
 24c:	00001021 	move	$2,$0
 250:	afa00000 	sw	$0,0($29)
 254:	24040028 	li	$4,40
 258:	8fa30000 	lw	$3,0($29)
 25c:	00000000 	nop
 260:	00621821 	addu	$3,$3,$2
 264:	24420001 	addiu	$2,$2,1
 268:	1444fffb 	bne	$2,$4,258 <mylib_wait+0x10>
 26c:	afa30000 	sw	$3,0($29)
 270:	03e00008 	jr	$31
 274:	27bd0008 	addiu	$29,$29,8

00000278 <mylib_display_dec>:
 278:	27bdfbe0 	addiu	$29,$29,-1056
 27c:	afbf041c 	sw	$31,1052($29)
 280:	afb20418 	sw	$18,1048($29)
 284:	afb10414 	sw	$17,1044($29)
 288:	04800018 	bltz	$4,2ec <mylib_display_dec+0x74>
 28c:	afb00410 	sw	$16,1040($29)
 290:	14800068 	bnez	$4,434 <mylib_display_dec+0x1bc>
 294:	24020030 	li	$2,48
 298:	afa20010 	sw	$2,16($29)
 29c:	24040030 	li	$4,48
 2a0:	00008021 	move	$16,$0
 2a4:	27a90010 	addiu	$9,$29,16
 2a8:	2610ffff 	addiu	$16,$16,-1
 2ac:	00108880 	sll	$17,$16,0x2
 2b0:	01318821 	addu	$17,$9,$17
 2b4:	080000b1 	j	2c4 <mylib_display_dec+0x4c>
 2b8:	2412ffff 	li	$18,-1
 2bc:	8e240000 	lw	$4,0($17)
 2c0:	2631fffc 	addiu	$17,$17,-4
 2c4:	0c000080 	jal	200 <output_buffer_put>
 2c8:	00000000 	nop
 2cc:	1612fffb 	bne	$16,$18,2bc <mylib_display_dec+0x44>
 2d0:	2610ffff 	addiu	$16,$16,-1
 2d4:	8fbf041c 	lw	$31,1052($29)
 2d8:	8fb20418 	lw	$18,1048($29)
 2dc:	8fb10414 	lw	$17,1044($29)
 2e0:	8fb00410 	lw	$16,1040($29)
 2e4:	03e00008 	jr	$31
 2e8:	27bd0420 	addiu	$29,$29,1056
 2ec:	00042023 	negu	$4,$4
 2f0:	240b0001 	li	$11,1
 2f4:	3c066666 	lui	$6,0x6666
 2f8:	24c66667 	addiu	$6,$6,26215
 2fc:	00860018 	mult	$4,$6
 300:	00042fc3 	sra	$5,$4,0x1f
 304:	27a90010 	addiu	$9,$29,16
 308:	01201821 	move	$3,$9
 30c:	00004021 	move	$8,$0
 310:	240a0001 	li	$10,1
 314:	240c0002 	li	$12,2
 318:	240d0003 	li	$13,3
 31c:	240e0004 	li	$14,4
 320:	240f0005 	li	$15,5
 324:	24110006 	li	$17,6
 328:	00001010 	mfhi	$2
 32c:	00021083 	sra	$2,$2,0x2
 330:	00451023 	subu	$2,$2,$5
 334:	00023840 	sll	$7,$2,0x1
 338:	000210c0 	sll	$2,$2,0x3
 33c:	00e21021 	addu	$2,$7,$2
 340:	00821023 	subu	$2,$4,$2
 344:	10400031 	beqz	$2,40c <mylib_display_dec+0x194>
 348:	24120007 	li	$18,7
 34c:	104a0031 	beq	$2,$10,414 <mylib_display_dec+0x19c>
 350:	00000000 	nop
 354:	104c0031 	beq	$2,$12,41c <mylib_display_dec+0x1a4>
 358:	00000000 	nop
 35c:	104d0031 	beq	$2,$13,424 <mylib_display_dec+0x1ac>
 360:	00000000 	nop
 364:	104e0031 	beq	$2,$14,42c <mylib_display_dec+0x1b4>
 368:	00000000 	nop
 36c:	104f0033 	beq	$2,$15,43c <mylib_display_dec+0x1c4>
 370:	00000000 	nop
 374:	10510033 	beq	$2,$17,444 <mylib_display_dec+0x1cc>
 378:	00000000 	nop
 37c:	10520033 	beq	$2,$18,44c <mylib_display_dec+0x1d4>
 380:	00000000 	nop
 384:	38420008 	xori	$2,$2,0x8
 388:	0002102b 	sltu	$2,$0,$2
 38c:	24420038 	addiu	$2,$2,56
 390:	00860018 	mult	$4,$6
 394:	ac620000 	sw	$2,0($3)
 398:	25100001 	addiu	$16,$8,1
 39c:	00002010 	mfhi	$4
 3a0:	00042083 	sra	$4,$4,0x2
 3a4:	00852023 	subu	$4,$4,$5
 3a8:	1480000d 	bnez	$4,3e0 <mylib_display_dec+0x168>
 3ac:	24630004 	addiu	$3,$3,4
 3b0:	11600005 	beqz	$11,3c8 <mylib_display_dec+0x150>
 3b4:	00101080 	sll	$2,$16,0x2
 3b8:	01221021 	addu	$2,$9,$2
 3bc:	2403002d 	li	$3,45
 3c0:	ac430000 	sw	$3,0($2)
 3c4:	25100002 	addiu	$16,$8,2
 3c8:	2610ffff 	addiu	$16,$16,-1
 3cc:	00101080 	sll	$2,$16,0x2
 3d0:	01221021 	addu	$2,$9,$2
 3d4:	8c440000 	lw	$4,0($2)
 3d8:	080000ab 	j	2ac <mylib_display_dec+0x34>
 3dc:	2610ffff 	addiu	$16,$16,-1
 3e0:	00860018 	mult	$4,$6
 3e4:	00042fc3 	sra	$5,$4,0x1f
 3e8:	00001010 	mfhi	$2
 3ec:	00021083 	sra	$2,$2,0x2
 3f0:	00451023 	subu	$2,$2,$5
 3f4:	00023840 	sll	$7,$2,0x1
 3f8:	000210c0 	sll	$2,$2,0x3
 3fc:	00e21021 	addu	$2,$7,$2
 400:	00821023 	subu	$2,$4,$2
 404:	1440ffd1 	bnez	$2,34c <mylib_display_dec+0xd4>
 408:	02004021 	move	$8,$16
 40c:	080000e4 	j	390 <mylib_display_dec+0x118>
 410:	24020030 	li	$2,48
 414:	080000e4 	j	390 <mylib_display_dec+0x118>
 418:	24020031 	li	$2,49
 41c:	080000e4 	j	390 <mylib_display_dec+0x118>
 420:	24020032 	li	$2,50
 424:	080000e4 	j	390 <mylib_display_dec+0x118>
 428:	24020033 	li	$2,51
 42c:	080000e4 	j	390 <mylib_display_dec+0x118>
 430:	24020034 	li	$2,52
 434:	080000bd 	j	2f4 <mylib_display_dec+0x7c>
 438:	00005821 	move	$11,$0
 43c:	080000e4 	j	390 <mylib_display_dec+0x118>
 440:	24020035 	li	$2,53
 444:	080000e4 	j	390 <mylib_display_dec+0x118>
 448:	24020036 	li	$2,54
 44c:	080000e4 	j	390 <mylib_display_dec+0x118>
 450:	24020037 	li	$2,55

00000454 <mylib_display_hex>:
 454:	27bdffc0 	addiu	$29,$29,-64
 458:	27a20010 	addiu	$2,$29,16
 45c:	afb10038 	sw	$17,56($29)
 460:	afb00034 	sw	$16,52($29)
 464:	afbf003c 	sw	$31,60($29)
 468:	00408821 	move	$17,$2
 46c:	27a50030 	addiu	$5,$29,48
 470:	24060001 	li	$6,1
 474:	24070002 	li	$7,2
 478:	24080003 	li	$8,3
 47c:	24090004 	li	$9,4
 480:	240a0005 	li	$10,5
 484:	240b0006 	li	$11,6
 488:	240c0007 	li	$12,7
 48c:	240d0008 	li	$13,8
 490:	240e0009 	li	$14,9
 494:	240f000a 	li	$15,10
 498:	2410000b 	li	$16,11
 49c:	2418000c 	li	$24,12
 4a0:	2419000d 	li	$25,13
 4a4:	3083000f 	andi	$3,$4,0xf
 4a8:	1060001f 	beqz	$3,528 <mylib_display_hex+0xd4>
 4ac:	00000000 	nop
 4b0:	1066002e 	beq	$3,$6,56c <mylib_display_hex+0x118>
 4b4:	00000000 	nop
 4b8:	1067002e 	beq	$3,$7,574 <mylib_display_hex+0x120>
 4bc:	00000000 	nop
 4c0:	1068002e 	beq	$3,$8,57c <mylib_display_hex+0x128>
 4c4:	00000000 	nop
 4c8:	1069002e 	beq	$3,$9,584 <mylib_display_hex+0x130>
 4cc:	00000000 	nop
 4d0:	106a002e 	beq	$3,$10,58c <mylib_display_hex+0x138>
 4d4:	00000000 	nop
 4d8:	106b002e 	beq	$3,$11,594 <mylib_display_hex+0x140>
 4dc:	00000000 	nop
 4e0:	106c002e 	beq	$3,$12,59c <mylib_display_hex+0x148>
 4e4:	00000000 	nop
 4e8:	106d0030 	beq	$3,$13,5ac <mylib_display_hex+0x158>
 4ec:	00000000 	nop
 4f0:	106e0030 	beq	$3,$14,5b4 <mylib_display_hex+0x160>
 4f4:	00000000 	nop
 4f8:	106f002a 	beq	$3,$15,5a4 <mylib_display_hex+0x150>
 4fc:	00000000 	nop
 500:	1070002e 	beq	$3,$16,5bc <mylib_display_hex+0x168>
 504:	00000000 	nop
 508:	1078002e 	beq	$3,$24,5c4 <mylib_display_hex+0x170>
 50c:	00000000 	nop
 510:	1079002e 	beq	$3,$25,5cc <mylib_display_hex+0x178>
 514:	00000000 	nop
 518:	3863000e 	xori	$3,$3,0xe
 51c:	0003182b 	sltu	$3,$0,$3
 520:	0800014b 	j	52c <mylib_display_hex+0xd8>
 524:	24630065 	addiu	$3,$3,101
 528:	24030030 	li	$3,48
 52c:	ac430000 	sw	$3,0($2)
 530:	24420004 	addiu	$2,$2,4
 534:	1445ffdb 	bne	$2,$5,4a4 <mylib_display_hex+0x50>
 538:	00042103 	sra	$4,$4,0x4
 53c:	27b0002c 	addiu	$16,$29,44
 540:	2631fffc 	addiu	$17,$17,-4
 544:	8e040000 	lw	$4,0($16)
 548:	0c000080 	jal	200 <output_buffer_put>
 54c:	2610fffc 	addiu	$16,$16,-4
 550:	1611fffc 	bne	$16,$17,544 <mylib_display_hex+0xf0>
 554:	00000000 	nop
 558:	8fbf003c 	lw	$31,60($29)
 55c:	8fb10038 	lw	$17,56($29)
 560:	8fb00034 	lw	$16,52($29)
 564:	03e00008 	jr	$31
 568:	27bd0040 	addiu	$29,$29,64
 56c:	0800014b 	j	52c <mylib_display_hex+0xd8>
 570:	24030031 	li	$3,49
 574:	0800014b 	j	52c <mylib_display_hex+0xd8>
 578:	24030032 	li	$3,50
 57c:	0800014b 	j	52c <mylib_display_hex+0xd8>
 580:	24030033 	li	$3,51
 584:	0800014b 	j	52c <mylib_display_hex+0xd8>
 588:	24030034 	li	$3,52
 58c:	0800014b 	j	52c <mylib_display_hex+0xd8>
 590:	24030035 	li	$3,53
 594:	0800014b 	j	52c <mylib_display_hex+0xd8>
 598:	24030036 	li	$3,54
 59c:	0800014b 	j	52c <mylib_display_hex+0xd8>
 5a0:	24030037 	li	$3,55
 5a4:	0800014b 	j	52c <mylib_display_hex+0xd8>
 5a8:	24030061 	li	$3,97
 5ac:	0800014b 	j	52c <mylib_display_hex+0xd8>
 5b0:	24030038 	li	$3,56
 5b4:	0800014b 	j	52c <mylib_display_hex+0xd8>
 5b8:	24030039 	li	$3,57
 5bc:	0800014b 	j	52c <mylib_display_hex+0xd8>
 5c0:	24030062 	li	$3,98
 5c4:	0800014b 	j	52c <mylib_display_hex+0xd8>
 5c8:	24030063 	li	$3,99
 5cc:	0800014b 	j	52c <mylib_display_hex+0xd8>
 5d0:	24030064 	li	$3,100

000005d4 <mylib_display_char>:
 5d4:	08000080 	j	200 <output_buffer_put>
 5d8:	00000000 	nop

000005dc <mylib_display_newline>:
 5dc:	27bdffe8 	addiu	$29,$29,-24
 5e0:	afbf0014 	sw	$31,20($29)
 5e4:	0c000080 	jal	200 <output_buffer_put>
 5e8:	2404000a 	li	$4,10
 5ec:	8fbf0014 	lw	$31,20($29)
 5f0:	2404000d 	li	$4,13
 5f4:	08000080 	j	200 <output_buffer_put>
 5f8:	27bd0018 	addiu	$29,$29,24

000005fc <mylib_flush>:
 5fc:	3c030005 	lui	$3,0x5
 600:	8f878410 	lw	$7,-31728($28)
 604:	24630000 	addiu	$3,$3,0
 608:	24040001 	li	$4,1
 60c:	00602821 	move	$5,$3
 610:	00e03021 	move	$6,$7
 614:	24020fa4 	li	$2,4004
 618:	0000000c 	syscall
 61c:	00401821 	move	$3,$2
 620:	03e00008 	jr	$31
 624:	af808410 	sw	$0,-31728($28)

00000628 <mylib_finalize>:
 628:	27bdffe8 	addiu	$29,$29,-24
 62c:	afbf0014 	sw	$31,20($29)
 630:	0c000080 	jal	200 <output_buffer_put>
 634:	2404000a 	li	$4,10
 638:	0c000080 	jal	200 <output_buffer_put>
 63c:	2404000d 	li	$4,13
 640:	0c000080 	jal	200 <output_buffer_put>
 644:	24040045 	li	$4,69
 648:	0c000080 	jal	200 <output_buffer_put>
 64c:	2404004e 	li	$4,78
 650:	0c000080 	jal	200 <output_buffer_put>
 654:	24040044 	li	$4,68
 658:	0c000080 	jal	200 <output_buffer_put>
 65c:	2404000a 	li	$4,10
 660:	0c000080 	jal	200 <output_buffer_put>
 664:	2404000d 	li	$4,13
 668:	3c030005 	lui	$3,0x5
 66c:	8f878410 	lw	$7,-31728($28)
 670:	24630000 	addiu	$3,$3,0
 674:	24040001 	li	$4,1
 678:	00602821 	move	$5,$3
 67c:	00e03021 	move	$6,$7
 680:	24020fa4 	li	$2,4004
 684:	0000000c 	syscall
 688:	00401821 	move	$3,$2
 68c:	af808410 	sw	$0,-31728($28)
 690:	24040000 	li	$4,0
 694:	24020fa1 	li	$2,4001
 698:	0000000c 	syscall
 69c:	8fbf0014 	lw	$31,20($29)
 6a0:	00000000 	nop
 6a4:	03e00008 	jr	$31
 6a8:	27bd0018 	addiu	$29,$29,24

000006ac <make_crc32_table>:
 6ac:	3c07edb8 	lui	$7,0xedb8
 6b0:	00004021 	move	$8,$0
 6b4:	34e78320 	ori	$7,$7,0x8320
 6b8:	24090100 	li	$9,256
 6bc:	01001021 	move	$2,$8
 6c0:	080001b5 	j	6d4 <make_crc32_table+0x28>
 6c4:	24030008 	li	$3,8
 6c8:	2463ffff 	addiu	$3,$3,-1
 6cc:	10600007 	beqz	$3,6ec <make_crc32_table+0x40>
 6d0:	00c71026 	xor	$2,$6,$7
 6d4:	30450001 	andi	$5,$2,0x1
 6d8:	14a0fffb 	bnez	$5,6c8 <make_crc32_table+0x1c>
 6dc:	00023042 	srl	$6,$2,0x1
 6e0:	2463ffff 	addiu	$3,$3,-1
 6e4:	1460fffb 	bnez	$3,6d4 <make_crc32_table+0x28>
 6e8:	00021042 	srl	$2,$2,0x1
 6ec:	25080001 	addiu	$8,$8,1
 6f0:	ac820000 	sw	$2,0($4)
 6f4:	1509fff1 	bne	$8,$9,6bc <make_crc32_table+0x10>
 6f8:	24840004 	addiu	$4,$4,4
 6fc:	03e00008 	jr	$31
 700:	00000000 	nop

00000704 <update_crc32>:
 704:	00041027 	nor	$2,$0,$4
 708:	00001821 	move	$3,$0
 70c:	24070020 	li	$7,32
 710:	00652006 	srlv	$4,$5,$3
 714:	00442026 	xor	$4,$2,$4
 718:	308400ff 	andi	$4,$4,0xff
 71c:	00042080 	sll	$4,$4,0x2
 720:	00c42021 	addu	$4,$6,$4
 724:	8c840000 	lw	$4,0($4)
 728:	00021202 	srl	$2,$2,0x8
 72c:	24630008 	addiu	$3,$3,8
 730:	1467fff7 	bne	$3,$7,710 <update_crc32+0xc>
 734:	00821026 	xor	$2,$4,$2
 738:	03e00008 	jr	$31
 73c:	00021027 	nor	$2,$0,$2

00000740 <main>:
 740:	3c030001 	lui	$3,0x1
 744:	24630000 	addiu	$3,$3,0
 748:	3c020004 	lui	$2,0x4
 74c:	27bdfbb8 	addiu	$29,$29,-1096
 750:	00431021 	addu	$2,$2,$3
 754:	afb00420 	sw	$16,1056($29)
 758:	8c50fffc 	lw	$16,-4($2)
 75c:	3c020000 	lui	$2,0x0
 760:	af838420 	sw	$3,-31712($28)
 764:	3c030005 	lui	$3,0x5
 768:	2463fffc 	addiu	$3,$3,-4
 76c:	24420c4c 	addiu	$2,$2,3148
 770:	af838424 	sw	$3,-31708($28)
 774:	afbf0444 	sw	$31,1092($29)
 778:	afbe0440 	sw	$30,1088($29)
 77c:	afb7043c 	sw	$23,1084($29)
 780:	afb60438 	sw	$22,1080($29)
 784:	afb50434 	sw	$21,1076($29)
 788:	afb40430 	sw	$20,1072($29)
 78c:	afb3042c 	sw	$19,1068($29)
 790:	afb20428 	sw	$18,1064($29)
 794:	afb10424 	sw	$17,1060($29)
 798:	27a30010 	addiu	$3,$29,16
 79c:	24440400 	addiu	$4,$2,1024
 7a0:	8c480000 	lw	$8,0($2)
 7a4:	8c470004 	lw	$7,4($2)
 7a8:	8c460008 	lw	$6,8($2)
 7ac:	8c45000c 	lw	$5,12($2)
 7b0:	24420010 	addiu	$2,$2,16
 7b4:	ac680000 	sw	$8,0($3)
 7b8:	ac670004 	sw	$7,4($3)
 7bc:	ac660008 	sw	$6,8($3)
 7c0:	ac65000c 	sw	$5,12($3)
 7c4:	1444fff6 	bne	$2,$4,7a0 <main+0x60>
 7c8:	24630010 	addiu	$3,$3,16
 7cc:	0c000080 	jal	200 <output_buffer_put>
 7d0:	2404006d 	li	$4,109
 7d4:	0c000080 	jal	200 <output_buffer_put>
 7d8:	2404006d 	li	$4,109
 7dc:	0c000080 	jal	200 <output_buffer_put>
 7e0:	24040020 	li	$4,32
 7e4:	0c000080 	jal	200 <output_buffer_put>
 7e8:	2404006e 	li	$4,110
 7ec:	0c000080 	jal	200 <output_buffer_put>
 7f0:	2404003d 	li	$4,61
 7f4:	0c00009e 	jal	278 <mylib_display_dec>
 7f8:	02002021 	move	$4,$16
 7fc:	0c000080 	jal	200 <output_buffer_put>
 800:	2404000a 	li	$4,10
 804:	0c000080 	jal	200 <output_buffer_put>
 808:	2404000d 	li	$4,13
 80c:	70000035 	pinsw	$0,$0,$0,0x0
	...
 818:	70000075 	pinsw	$0,$0,$0,0x1
	...
 824:	700000b5 	pinsw	$0,$0,$0,0x2
	...
 830:	700000f5 	pinsw	$0,$0,$0,0x3
 834:	02100018 	mult	$16,$16
 838:	00007012 	mflo	$14
 83c:	19c0002b 	blez	$14,8ec <main+0x1ac>
 840:	3c03005d 	lui	$3,0x5d
 844:	8f918420 	lw	$17,-31712($28)
 848:	3c020005 	lui	$2,0x5
 84c:	24650420 	addiu	$5,$3,1056
 850:	24420420 	addiu	$2,$2,1056
 854:	00002021 	move	$4,$0
 858:	00001821 	move	$3,$0
 85c:	3c0f0020 	lui	$15,0x20
 860:	00043080 	sll	$6,$4,0x2
 864:	02263021 	addu	$6,$17,$6
 868:	78c10000 	lq	$1,0($6)
 86c:	78c20010 	lq	$2,16($6)
 870:	00000000 	nop
 874:	7020303d 	pextw	$6,$1,0x0
 878:	7020387d 	pextw	$7,$1,0x1
 87c:	702040bd 	pextw	$8,$1,0x2
 880:	702048fd 	pextw	$9,$1,0x3
 884:	7040503d 	pextw	$10,$2,0x0
 888:	7040587d 	pextw	$11,$2,0x1
 88c:	704060bd 	pextw	$12,$2,0x2
 890:	704068fd 	pextw	$13,$2,0x3
 894:	70061835 	pinsw	$3,$0,$6,0x0
 898:	70072035 	pinsw	$4,$0,$7,0x0
 89c:	00000000 	nop
 8a0:	70681875 	pinsw	$3,$3,$8,0x1
 8a4:	70892075 	pinsw	$4,$4,$9,0x1
 8a8:	00000000 	nop
 8ac:	706a18b5 	pinsw	$3,$3,$10,0x2
 8b0:	708b20b5 	pinsw	$4,$4,$11,0x2
 8b4:	00000000 	nop
 8b8:	706c18f5 	pinsw	$3,$3,$12,0x3
 8bc:	708d20f5 	pinsw	$4,$4,$13,0x3
 8c0:	004f3021 	addu	$6,$2,$15
 8c4:	7cc00000 	sq	$0,0($6)
 8c8:	7ca30000 	sq	$3,0($5)
 8cc:	7c440000 	sq	$4,0($2)
 8d0:	24630004 	addiu	$3,$3,4
 8d4:	24840008 	addiu	$4,$4,8
 8d8:	006e302a 	slt	$6,$3,$14
 8dc:	3084ffff 	andi	$4,$4,0xffff
 8e0:	24420010 	addiu	$2,$2,16
 8e4:	14c0ffde 	bnez	$6,860 <main+0x120>
 8e8:	24a50010 	addiu	$5,$5,16
 8ec:	1a0000d3 	blez	$16,c3c <main+0x4fc>
 8f0:	0010a8c0 	sll	$21,$16,0x3
 8f4:	00108880 	sll	$17,$16,0x2
 8f8:	3c020005 	lui	$2,0x5
 8fc:	3c03005d 	lui	$3,0x5d
 900:	3c120025 	lui	$18,0x25
 904:	0220c821 	move	$25,$17
 908:	0010b040 	sll	$22,$16,0x1
 90c:	02002021 	move	$4,$16
 910:	0000f821 	move	$31,$0
 914:	0000c021 	move	$24,$0
 918:	0000b821 	move	$23,$0
 91c:	244d0420 	addiu	$13,$2,1056
 920:	24630420 	addiu	$3,$3,1056
 924:	26520420 	addiu	$18,$18,1056
 928:	02a06021 	move	$12,$21
 92c:	02c4f021 	addu	$30,$22,$4
 930:	03df1023 	subu	$2,$30,$31
 934:	009f2023 	subu	$4,$4,$31
 938:	00045880 	sll	$11,$4,0x2
 93c:	03f6f821 	addu	$31,$31,$22
 940:	00022080 	sll	$4,$2,0x2
 944:	0315a021 	addu	$20,$24,$21
 948:	03359821 	addu	$19,$25,$21
 94c:	00007021 	move	$14,$0
 950:	00007821 	move	$15,$0
 954:	70000848 	psubw	$1,$0,$0
 958:	70001048 	psubw	$2,$0,$0
 95c:	70001848 	psubw	$3,$0,$0
 960:	70002048 	psubw	$4,$0,$0
 964:	00003021 	move	$6,$0
 968:	03001021 	move	$2,$24
 96c:	01c02821 	move	$5,$14
 970:	01a53821 	addu	$7,$13,$5
 974:	78e50000 	lq	$5,0($7)
 978:	004b4021 	addu	$8,$2,$11
 97c:	004c4821 	addu	$9,$2,$12
 980:	00445021 	addu	$10,$2,$4
 984:	00623821 	addu	$7,$3,$2
 988:	00684021 	addu	$8,$3,$8
 98c:	00694821 	addu	$9,$3,$9
 990:	006a5021 	addu	$10,$3,$10
 994:	8ce70000 	lw	$7,0($7)
 998:	8d080000 	lw	$8,0($8)
 99c:	8d290000 	lw	$9,0($9)
 9a0:	8d4a0000 	lw	$10,0($10)
 9a4:	70a70609 	pmultsw	$5,$7
 9a8:	70003249 	pmflo	$6
	...
 9b4:	70260808 	paddw	$1,$1,$6
 9b8:	70a80609 	pmultsw	$5,$8
 9bc:	70003249 	pmflo	$6
	...
 9c8:	70461008 	paddw	$2,$2,$6
 9cc:	70a90609 	pmultsw	$5,$9
 9d0:	70003249 	pmflo	$6
	...
 9dc:	70661808 	paddw	$3,$3,$6
 9e0:	70aa0609 	pmultsw	$5,$10
 9e4:	70003249 	pmflo	$6
	...
 9f0:	70862008 	paddw	$4,$4,$6
 9f4:	24c60001 	addiu	$6,$6,1
 9f8:	00b12821 	addu	$5,$5,$17
 9fc:	14d0ffdc 	bne	$6,$16,970 <main+0x230>
 a00:	24420004 	addiu	$2,$2,4
 a04:	01d81021 	addu	$2,$14,$24
 a08:	01d92821 	addu	$5,$14,$25
 a0c:	01d43021 	addu	$6,$14,$20
 a10:	01d33821 	addu	$7,$14,$19
 a14:	02421021 	addu	$2,$18,$2
 a18:	02452821 	addu	$5,$18,$5
 a1c:	02463021 	addu	$6,$18,$6
 a20:	02473821 	addu	$7,$18,$7
 a24:	7c410000 	sq	$1,0($2)
 a28:	7ca20000 	sq	$2,0($5)
 a2c:	7cc30000 	sq	$3,0($6)
 a30:	7ce40000 	sq	$4,0($7)
 a34:	25ef0004 	addiu	$15,$15,4
 a38:	01f0102a 	slt	$2,$15,$16
 a3c:	1440ffc5 	bnez	$2,954 <main+0x214>
 a40:	25ce0010 	addiu	$14,$14,16
 a44:	26f70004 	addiu	$23,$23,4
 a48:	02f0102a 	slt	$2,$23,$16
 a4c:	0295c021 	addu	$24,$20,$21
 a50:	0275c821 	addu	$25,$19,$21
 a54:	03d62021 	addu	$4,$30,$22
 a58:	1440ffb4 	bnez	$2,92c <main+0x1ec>
 a5c:	03f6f821 	addu	$31,$31,$22
 a60:	0c000080 	jal	200 <output_buffer_put>
 a64:	2404000a 	li	$4,10
 a68:	0c000080 	jal	200 <output_buffer_put>
 a6c:	2404000d 	li	$4,13
 a70:	2602fff9 	addiu	$2,$16,-7
 a74:	02020018 	mult	$16,$2
 a78:	24130008 	li	$19,8
 a7c:	0000a012 	mflo	$20
 a80:	0014a080 	sll	$20,$20,0x2
 a84:	2694ffe0 	addiu	$20,$20,-32
 a88:	02541021 	addu	$2,$18,$20
 a8c:	78410000 	lq	$1,0($2)
 a90:	78420010 	lq	$2,16($2)
 a94:	00000000 	nop
 a98:	7020203d 	pextw	$4,$1,0x0
 a9c:	7020287d 	pextw	$5,$1,0x1
 aa0:	702018bd 	pextw	$3,$1,0x2
 aa4:	702010fd 	pextw	$2,$1,0x3
 aa8:	7040f03d 	pextw	$30,$2,0x0
 aac:	7040b87d 	pextw	$23,$2,0x1
 ab0:	7040b0bd 	pextw	$22,$2,0x2
 ab4:	7040a8fd 	pextw	$21,$2,0x3
 ab8:	afa20418 	sw	$2,1048($29)
 abc:	afa30414 	sw	$3,1044($29)
 ac0:	0c000115 	jal	454 <mylib_display_hex>
 ac4:	afa50410 	sw	$5,1040($29)
 ac8:	0c000080 	jal	200 <output_buffer_put>
 acc:	24040020 	li	$4,32
 ad0:	8fa50410 	lw	$5,1040($29)
 ad4:	2673ffff 	addiu	$19,$19,-1
 ad8:	0291a021 	addu	$20,$20,$17
 adc:	0c000115 	jal	454 <mylib_display_hex>
 ae0:	00a02021 	move	$4,$5
 ae4:	0c000080 	jal	200 <output_buffer_put>
 ae8:	24040020 	li	$4,32
 aec:	8fa30414 	lw	$3,1044($29)
 af0:	0c000115 	jal	454 <mylib_display_hex>
 af4:	00602021 	move	$4,$3
 af8:	0c000080 	jal	200 <output_buffer_put>
 afc:	24040020 	li	$4,32
 b00:	8fa20418 	lw	$2,1048($29)
 b04:	0c000115 	jal	454 <mylib_display_hex>
 b08:	00402021 	move	$4,$2
 b0c:	0c000080 	jal	200 <output_buffer_put>
 b10:	24040020 	li	$4,32
 b14:	0c000115 	jal	454 <mylib_display_hex>
 b18:	03c02021 	move	$4,$30
 b1c:	0c000080 	jal	200 <output_buffer_put>
 b20:	24040020 	li	$4,32
 b24:	0c000115 	jal	454 <mylib_display_hex>
 b28:	02e02021 	move	$4,$23
 b2c:	0c000080 	jal	200 <output_buffer_put>
 b30:	24040020 	li	$4,32
 b34:	0c000115 	jal	454 <mylib_display_hex>
 b38:	02c02021 	move	$4,$22
 b3c:	0c000080 	jal	200 <output_buffer_put>
 b40:	24040020 	li	$4,32
 b44:	0c000115 	jal	454 <mylib_display_hex>
 b48:	02a02021 	move	$4,$21
 b4c:	0c000080 	jal	200 <output_buffer_put>
 b50:	24040020 	li	$4,32
 b54:	0c000080 	jal	200 <output_buffer_put>
 b58:	2404000a 	li	$4,10
 b5c:	0c000080 	jal	200 <output_buffer_put>
 b60:	2404000d 	li	$4,13
 b64:	1660ffc9 	bnez	$19,a8c <main+0x34c>
 b68:	02541021 	addu	$2,$18,$20
 b6c:	1a000031 	blez	$16,c34 <main+0x4f4>
 b70:	00005021 	move	$10,$0
 b74:	00004821 	move	$9,$0
 b78:	00002021 	move	$4,$0
 b7c:	24060020 	li	$6,32
 b80:	01404021 	move	$8,$10
 b84:	00003821 	move	$7,$0
 b88:	02481021 	addu	$2,$18,$8
 b8c:	8c450000 	lw	$5,0($2)
 b90:	00041827 	nor	$3,$0,$4
 b94:	00001021 	move	$2,$0
 b98:	00452006 	srlv	$4,$5,$2
 b9c:	00642026 	xor	$4,$3,$4
 ba0:	308400ff 	andi	$4,$4,0xff
 ba4:	00042080 	sll	$4,$4,0x2
 ba8:	27ab0010 	addiu	$11,$29,16
 bac:	01642021 	addu	$4,$11,$4
 bb0:	8c840000 	lw	$4,0($4)
 bb4:	00031a02 	srl	$3,$3,0x8
 bb8:	24420008 	addiu	$2,$2,8
 bbc:	1446fff6 	bne	$2,$6,b98 <main+0x458>
 bc0:	00831826 	xor	$3,$4,$3
 bc4:	24e70001 	addiu	$7,$7,1
 bc8:	00032027 	nor	$4,$0,$3
 bcc:	14f0ffee 	bne	$7,$16,b88 <main+0x448>
 bd0:	25080004 	addiu	$8,$8,4
 bd4:	25290001 	addiu	$9,$9,1
 bd8:	1530ffe9 	bne	$9,$16,b80 <main+0x440>
 bdc:	01515021 	addu	$10,$10,$17
 be0:	0c000115 	jal	454 <mylib_display_hex>
 be4:	00000000 	nop
 be8:	0c000080 	jal	200 <output_buffer_put>
 bec:	2404000a 	li	$4,10
 bf0:	0c000080 	jal	200 <output_buffer_put>
 bf4:	2404000d 	li	$4,13
 bf8:	0c00018a 	jal	628 <mylib_finalize>
 bfc:	00000000 	nop
 c00:	8fbf0444 	lw	$31,1092($29)
 c04:	8fbe0440 	lw	$30,1088($29)
 c08:	8fb7043c 	lw	$23,1084($29)
 c0c:	8fb60438 	lw	$22,1080($29)
 c10:	8fb50434 	lw	$21,1076($29)
 c14:	8fb40430 	lw	$20,1072($29)
 c18:	8fb3042c 	lw	$19,1068($29)
 c1c:	8fb20428 	lw	$18,1064($29)
 c20:	8fb10424 	lw	$17,1060($29)
 c24:	8fb00420 	lw	$16,1056($29)
 c28:	00001021 	move	$2,$0
 c2c:	03e00008 	jr	$31
 c30:	27bd0448 	addiu	$29,$29,1096
 c34:	080002f8 	j	be0 <main+0x4a0>
 c38:	00002021 	move	$4,$0
 c3c:	3c120025 	lui	$18,0x25
 c40:	00108880 	sll	$17,$16,0x2
 c44:	08000298 	j	a60 <main+0x320>
 c48:	26520420 	addiu	$18,$18,1056
