	.file	1 "main.c"
	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 3
	.text
	.align	2
	.set	nomips16
	.ent	output_buffer_put
	.type	output_buffer_put, @function
output_buffer_put:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	lw	$2,%gp_rel(output_buffer_size)($28)
	lui	$7,%hi(output_buffer)
	addiu	$7,$7,%lo(output_buffer)
	addiu	$3,$2,1
	slt	$5,$3,1024
	addu	$2,$2,$7
	sw	$3,%gp_rel(output_buffer_size)($28)
	.set	noreorder
	.set	nomacro
	bne	$5,$0,$L4
	sb	$4,0($2)
	.set	macro
	.set	reorder

 #APP
 # 42 "././lib.c" 1
	li	$4,1
	move	$5,$7
	move	$6,$3
	li	$2,4004
	syscall
	move	$3,$2
	
 # 0 "" 2
 #NO_APP
	sw	$0,%gp_rel(output_buffer_size)($28)
$L4:
	j	$31
	.end	output_buffer_put
	.size	output_buffer_put, .-output_buffer_put
	.align	2
	.globl	mylib_wait
	.set	nomips16
	.ent	mylib_wait
	.type	mylib_wait, @function
mylib_wait:
	.frame	$sp,8,$31		# vars= 8, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	addiu	$sp,$sp,-8
	move	$2,$0
	sw	$0,0($sp)
	li	$4,40			# 0x28
$L7:
	lw	$3,0($sp)
	#nop
	addu	$3,$3,$2
	addiu	$2,$2,1
	sw	$3,0($sp)
	bne	$2,$4,$L7
	.set	noreorder
	.set	nomacro
	j	$31
	addiu	$sp,$sp,8
	.set	macro
	.set	reorder

	.end	mylib_wait
	.size	mylib_wait, .-mylib_wait
	.align	2
	.globl	mylib_display_dec
	.set	nomips16
	.ent	mylib_display_dec
	.type	mylib_display_dec, @function
mylib_display_dec:
	.frame	$sp,1056,$31		# vars= 1024, regs= 4/0, args= 16, gp= 0
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	addiu	$sp,$sp,-1056
	sw	$31,1052($sp)
	sw	$18,1048($sp)
	sw	$17,1044($sp)
	.set	noreorder
	.set	nomacro
	bltz	$4,$L34
	sw	$16,1040($sp)
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	bne	$4,$0,$L35
	li	$2,48			# 0x30
	.set	macro
	.set	reorder

	sw	$2,16($sp)
	li	$4,48			# 0x30
	move	$16,$0
	addiu	$9,$sp,16
	addiu	$16,$16,-1
$L37:
	sll	$17,$16,2
	addu	$17,$9,$17
	.set	noreorder
	.set	nomacro
	j	$L14
	li	$18,-1			# 0xffffffffffffffff
	.set	macro
	.set	reorder

$L18:
	lw	$4,0($17)
	addiu	$17,$17,-4
$L14:
	jal	output_buffer_put
	.set	noreorder
	.set	nomacro
	bne	$16,$18,$L18
	addiu	$16,$16,-1
	.set	macro
	.set	reorder

	lw	$31,1052($sp)
	lw	$18,1048($sp)
	lw	$17,1044($sp)
	lw	$16,1040($sp)
	.set	noreorder
	.set	nomacro
	j	$31
	addiu	$sp,$sp,1056
	.set	macro
	.set	reorder

$L34:
	subu	$4,$0,$4
	li	$11,1			# 0x1
$L11:
	li	$6,1717960704			# 0x66660000
	addiu	$6,$6,26215
	mult	$4,$6
	sra	$5,$4,31
	addiu	$9,$sp,16
	move	$3,$9
	move	$8,$0
	li	$10,1			# 0x1
	li	$12,2			# 0x2
	li	$13,3			# 0x3
	li	$14,4			# 0x4
	li	$15,5			# 0x5
	li	$17,6			# 0x6
	mfhi	$2
	sra	$2,$2,2
	subu	$2,$2,$5
	sll	$7,$2,1
	sll	$2,$2,3
	addu	$2,$7,$2
	subu	$2,$4,$2
	.set	noreorder
	.set	nomacro
	beq	$2,$0,$L20
	li	$18,7			# 0x7
	.set	macro
	.set	reorder

$L36:
	beq	$2,$10,$L21
	beq	$2,$12,$L22
	beq	$2,$13,$L23
	beq	$2,$14,$L24
	beq	$2,$15,$L25
	beq	$2,$17,$L26
	beq	$2,$18,$L27
	xori	$2,$2,0x8
	sltu	$2,$0,$2
	addiu	$2,$2,56
$L15:
	mult	$4,$6
	sw	$2,0($3)
	addiu	$16,$8,1
	mfhi	$4
	sra	$4,$4,2
	subu	$4,$4,$5
	.set	noreorder
	.set	nomacro
	bne	$4,$0,$L16
	addiu	$3,$3,4
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	beq	$11,$0,$L17
	sll	$2,$16,2
	.set	macro
	.set	reorder

	addu	$2,$9,$2
	li	$3,45			# 0x2d
	sw	$3,0($2)
	addiu	$16,$8,2
$L17:
	addiu	$16,$16,-1
	sll	$2,$16,2
	addu	$2,$9,$2
	lw	$4,0($2)
	.set	noreorder
	.set	nomacro
	j	$L37
	addiu	$16,$16,-1
	.set	macro
	.set	reorder

$L16:
	mult	$4,$6
	sra	$5,$4,31
	mfhi	$2
	sra	$2,$2,2
	subu	$2,$2,$5
	sll	$7,$2,1
	sll	$2,$2,3
	addu	$2,$7,$2
	subu	$2,$4,$2
	.set	noreorder
	.set	nomacro
	bne	$2,$0,$L36
	move	$8,$16
	.set	macro
	.set	reorder

$L20:
	.set	noreorder
	.set	nomacro
	j	$L15
	li	$2,48			# 0x30
	.set	macro
	.set	reorder

$L21:
	.set	noreorder
	.set	nomacro
	j	$L15
	li	$2,49			# 0x31
	.set	macro
	.set	reorder

$L22:
	.set	noreorder
	.set	nomacro
	j	$L15
	li	$2,50			# 0x32
	.set	macro
	.set	reorder

$L23:
	.set	noreorder
	.set	nomacro
	j	$L15
	li	$2,51			# 0x33
	.set	macro
	.set	reorder

$L24:
	.set	noreorder
	.set	nomacro
	j	$L15
	li	$2,52			# 0x34
	.set	macro
	.set	reorder

$L35:
	.set	noreorder
	.set	nomacro
	j	$L11
	move	$11,$0
	.set	macro
	.set	reorder

$L25:
	.set	noreorder
	.set	nomacro
	j	$L15
	li	$2,53			# 0x35
	.set	macro
	.set	reorder

$L26:
	.set	noreorder
	.set	nomacro
	j	$L15
	li	$2,54			# 0x36
	.set	macro
	.set	reorder

$L27:
	.set	noreorder
	.set	nomacro
	j	$L15
	li	$2,55			# 0x37
	.set	macro
	.set	reorder

	.end	mylib_display_dec
	.size	mylib_display_dec, .-mylib_display_dec
	.align	2
	.globl	mylib_display_hex
	.set	nomips16
	.ent	mylib_display_hex
	.type	mylib_display_hex, @function
mylib_display_hex:
	.frame	$sp,64,$31		# vars= 32, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	addiu	$sp,$sp,-64
	addiu	$2,$sp,16
	sw	$17,56($sp)
	sw	$16,52($sp)
	sw	$31,60($sp)
	move	$17,$2
	addiu	$5,$sp,48
	li	$6,1			# 0x1
	li	$7,2			# 0x2
	li	$8,3			# 0x3
	li	$9,4			# 0x4
	li	$10,5			# 0x5
	li	$11,6			# 0x6
	li	$12,7			# 0x7
	li	$13,8			# 0x8
	li	$14,9			# 0x9
	li	$15,10			# 0xa
	li	$16,11			# 0xb
	li	$24,12			# 0xc
	li	$25,13			# 0xd
$L41:
	andi	$3,$4,0xf
	beq	$3,$0,$L44
	beq	$3,$6,$L45
	beq	$3,$7,$L46
	beq	$3,$8,$L47
	beq	$3,$9,$L48
	beq	$3,$10,$L49
	beq	$3,$11,$L50
	beq	$3,$12,$L51
	beq	$3,$13,$L52
	beq	$3,$14,$L53
	beq	$3,$15,$L54
	beq	$3,$16,$L55
	beq	$3,$24,$L56
	beq	$3,$25,$L57
	xori	$3,$3,0xe
	sltu	$3,$0,$3
	.set	noreorder
	.set	nomacro
	j	$L39
	addiu	$3,$3,101
	.set	macro
	.set	reorder

$L44:
	li	$3,48			# 0x30
$L39:
	sw	$3,0($2)
	addiu	$2,$2,4
	.set	noreorder
	.set	nomacro
	bne	$2,$5,$L41
	sra	$4,$4,4
	.set	macro
	.set	reorder

	addiu	$16,$sp,44
	addiu	$17,$17,-4
$L43:
	lw	$4,0($16)
	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	addiu	$16,$16,-4
	.set	macro
	.set	reorder

	bne	$16,$17,$L43
	lw	$31,60($sp)
	lw	$17,56($sp)
	lw	$16,52($sp)
	.set	noreorder
	.set	nomacro
	j	$31
	addiu	$sp,$sp,64
	.set	macro
	.set	reorder

$L45:
	.set	noreorder
	.set	nomacro
	j	$L39
	li	$3,49			# 0x31
	.set	macro
	.set	reorder

$L46:
	.set	noreorder
	.set	nomacro
	j	$L39
	li	$3,50			# 0x32
	.set	macro
	.set	reorder

$L47:
	.set	noreorder
	.set	nomacro
	j	$L39
	li	$3,51			# 0x33
	.set	macro
	.set	reorder

$L48:
	.set	noreorder
	.set	nomacro
	j	$L39
	li	$3,52			# 0x34
	.set	macro
	.set	reorder

$L49:
	.set	noreorder
	.set	nomacro
	j	$L39
	li	$3,53			# 0x35
	.set	macro
	.set	reorder

$L50:
	.set	noreorder
	.set	nomacro
	j	$L39
	li	$3,54			# 0x36
	.set	macro
	.set	reorder

$L51:
	.set	noreorder
	.set	nomacro
	j	$L39
	li	$3,55			# 0x37
	.set	macro
	.set	reorder

$L54:
	.set	noreorder
	.set	nomacro
	j	$L39
	li	$3,97			# 0x61
	.set	macro
	.set	reorder

$L52:
	.set	noreorder
	.set	nomacro
	j	$L39
	li	$3,56			# 0x38
	.set	macro
	.set	reorder

$L53:
	.set	noreorder
	.set	nomacro
	j	$L39
	li	$3,57			# 0x39
	.set	macro
	.set	reorder

$L55:
	.set	noreorder
	.set	nomacro
	j	$L39
	li	$3,98			# 0x62
	.set	macro
	.set	reorder

$L56:
	.set	noreorder
	.set	nomacro
	j	$L39
	li	$3,99			# 0x63
	.set	macro
	.set	reorder

$L57:
	.set	noreorder
	.set	nomacro
	j	$L39
	li	$3,100			# 0x64
	.set	macro
	.set	reorder

	.end	mylib_display_hex
	.size	mylib_display_hex, .-mylib_display_hex
	.align	2
	.globl	mylib_display_char
	.set	nomips16
	.ent	mylib_display_char
	.type	mylib_display_char, @function
mylib_display_char:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	j	output_buffer_put
	.end	mylib_display_char
	.size	mylib_display_char, .-mylib_display_char
	.align	2
	.globl	mylib_display_newline
	.set	nomips16
	.ent	mylib_display_newline
	.type	mylib_display_newline, @function
mylib_display_newline:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,10			# 0xa
	.set	macro
	.set	reorder

	lw	$31,20($sp)
	li	$4,13			# 0xd
	.set	noreorder
	.set	nomacro
	j	output_buffer_put
	addiu	$sp,$sp,24
	.set	macro
	.set	reorder

	.end	mylib_display_newline
	.size	mylib_display_newline, .-mylib_display_newline
	.align	2
	.globl	mylib_flush
	.set	nomips16
	.ent	mylib_flush
	.type	mylib_flush, @function
mylib_flush:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	lui	$3,%hi(output_buffer)
	lw	$7,%gp_rel(output_buffer_size)($28)
	addiu	$3,$3,%lo(output_buffer)
 #APP
 # 42 "././lib.c" 1
	li	$4,1
	move	$5,$3
	move	$6,$7
	li	$2,4004
	syscall
	move	$3,$2
	
 # 0 "" 2
 #NO_APP
	.set	noreorder
	.set	nomacro
	j	$31
	sw	$0,%gp_rel(output_buffer_size)($28)
	.set	macro
	.set	reorder

	.end	mylib_flush
	.size	mylib_flush, .-mylib_flush
	.align	2
	.globl	mylib_finalize
	.set	nomips16
	.ent	mylib_finalize
	.type	mylib_finalize, @function
mylib_finalize:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,10			# 0xa
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,13			# 0xd
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,69			# 0x45
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,78			# 0x4e
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,68			# 0x44
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,10			# 0xa
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,13			# 0xd
	.set	macro
	.set	reorder

	lui	$3,%hi(output_buffer)
	lw	$7,%gp_rel(output_buffer_size)($28)
	addiu	$3,$3,%lo(output_buffer)
 #APP
 # 42 "././lib.c" 1
	li	$4,1
	move	$5,$3
	move	$6,$7
	li	$2,4004
	syscall
	move	$3,$2
	
 # 0 "" 2
 #NO_APP
	sw	$0,%gp_rel(output_buffer_size)($28)
 #APP
 # 200 "././lib.c" 1
	li	$4,0
	li	$2,4001
	syscall
	
 # 0 "" 2
 #NO_APP
	lw	$31,20($sp)
	#nop
	.set	noreorder
	.set	nomacro
	j	$31
	addiu	$sp,$sp,24
	.set	macro
	.set	reorder

	.end	mylib_finalize
	.size	mylib_finalize, .-mylib_finalize
	.align	2
	.globl	make_crc32_table
	.set	nomips16
	.ent	make_crc32_table
	.type	make_crc32_table, @function
make_crc32_table:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	li	$7,-306708480			# 0xffffffffedb80000
	move	$8,$0
	ori	$7,$7,0x8320
	li	$9,256			# 0x100
$L67:
	move	$2,$8
	.set	noreorder
	.set	nomacro
	j	$L72
	li	$3,8			# 0x8
	.set	macro
	.set	reorder

$L74:
	addiu	$3,$3,-1
	.set	noreorder
	.set	nomacro
	beq	$3,$0,$L73
	xor	$2,$6,$7
	.set	macro
	.set	reorder

$L72:
	andi	$5,$2,0x1
	.set	noreorder
	.set	nomacro
	bne	$5,$0,$L74
	srl	$6,$2,1
	.set	macro
	.set	reorder

	addiu	$3,$3,-1
	.set	noreorder
	.set	nomacro
	bne	$3,$0,$L72
	srl	$2,$2,1
	.set	macro
	.set	reorder

$L73:
	addiu	$8,$8,1
	sw	$2,0($4)
	.set	noreorder
	.set	nomacro
	bne	$8,$9,$L67
	addiu	$4,$4,4
	.set	macro
	.set	reorder

	j	$31
	.end	make_crc32_table
	.size	make_crc32_table, .-make_crc32_table
	.align	2
	.globl	update_crc32
	.set	nomips16
	.ent	update_crc32
	.type	update_crc32, @function
update_crc32:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	nor	$2,$0,$4
	move	$3,$0
	li	$7,32			# 0x20
$L77:
	srl	$4,$5,$3
	xor	$4,$2,$4
	andi	$4,$4,0x00ff
	sll	$4,$4,2
	addu	$4,$6,$4
	lw	$4,0($4)
	srl	$2,$2,8
	addiu	$3,$3,8
	.set	noreorder
	.set	nomacro
	bne	$3,$7,$L77
	xor	$2,$4,$2
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	j	$31
	nor	$2,$0,$2
	.set	macro
	.set	reorder

	.end	update_crc32
	.size	update_crc32, .-update_crc32
	.rdata
	.align	2
$LC0:
	.word	0
	.word	1996959894
	.word	-301047508
	.word	-1727442502
	.word	124634137
	.word	1886057615
	.word	-379345611
	.word	-1637575261
	.word	249268274
	.word	2044508324
	.word	-522852066
	.word	-1747789432
	.word	162941995
	.word	2125561021
	.word	-407360249
	.word	-1866523247
	.word	498536548
	.word	1789927666
	.word	-205950648
	.word	-2067906082
	.word	450548861
	.word	1843258603
	.word	-187386543
	.word	-2083289657
	.word	325883990
	.word	1684777152
	.word	-43845254
	.word	-1973040660
	.word	335633487
	.word	1661365465
	.word	-99664541
	.word	-1928851979
	.word	997073096
	.word	1281953886
	.word	-715111964
	.word	-1570279054
	.word	1006888145
	.word	1258607687
	.word	-770865667
	.word	-1526024853
	.word	901097722
	.word	1119000684
	.word	-608450090
	.word	-1396901568
	.word	853044451
	.word	1172266101
	.word	-589951537
	.word	-1412350631
	.word	651767980
	.word	1373503546
	.word	-925412992
	.word	-1076862698
	.word	565507253
	.word	1454621731
	.word	-809855591
	.word	-1195530993
	.word	671266974
	.word	1594198024
	.word	-972236366
	.word	-1324619484
	.word	795835527
	.word	1483230225
	.word	-1050600021
	.word	-1234817731
	.word	1994146192
	.word	31158534
	.word	-1731059524
	.word	-271249366
	.word	1907459465
	.word	112637215
	.word	-1614814043
	.word	-390540237
	.word	2013776290
	.word	251722036
	.word	-1777751922
	.word	-519137256
	.word	2137656763
	.word	141376813
	.word	-1855689577
	.word	-429695999
	.word	1802195444
	.word	476864866
	.word	-2056965928
	.word	-228458418
	.word	1812370925
	.word	453092731
	.word	-2113342271
	.word	-183516073
	.word	1706088902
	.word	314042704
	.word	-1950435094
	.word	-54949764
	.word	1658658271
	.word	366619977
	.word	-1932296973
	.word	-69972891
	.word	1303535960
	.word	984961486
	.word	-1547960204
	.word	-725929758
	.word	1256170817
	.word	1037604311
	.word	-1529756563
	.word	-740887301
	.word	1131014506
	.word	879679996
	.word	-1385723834
	.word	-631195440
	.word	1141124467
	.word	855842277
	.word	-1442165665
	.word	-586318647
	.word	1342533948
	.word	654459306
	.word	-1106571248
	.word	-921952122
	.word	1466479909
	.word	544179635
	.word	-1184443383
	.word	-832445281
	.word	1591671054
	.word	702138776
	.word	-1328506846
	.word	-942167884
	.word	1504918807
	.word	783551873
	.word	-1212326853
	.word	-1061524307
	.word	-306674912
	.word	-1698712650
	.word	62317068
	.word	1957810842
	.word	-355121351
	.word	-1647151185
	.word	81470997
	.word	1943803523
	.word	-480048366
	.word	-1805370492
	.word	225274430
	.word	2053790376
	.word	-468791541
	.word	-1828061283
	.word	167816743
	.word	2097651377
	.word	-267414716
	.word	-2029476910
	.word	503444072
	.word	1762050814
	.word	-144550051
	.word	-2140837941
	.word	426522225
	.word	1852507879
	.word	-19653770
	.word	-1982649376
	.word	282753626
	.word	1742555852
	.word	-105259153
	.word	-1900089351
	.word	397917763
	.word	1622183637
	.word	-690576408
	.word	-1580100738
	.word	953729732
	.word	1340076626
	.word	-776247311
	.word	-1497606297
	.word	1068828381
	.word	1219638859
	.word	-670225446
	.word	-1358292148
	.word	906185462
	.word	1090812512
	.word	-547295293
	.word	-1469587627
	.word	829329135
	.word	1181335161
	.word	-882789492
	.word	-1134132454
	.word	628085408
	.word	1382605366
	.word	-871598187
	.word	-1156888829
	.word	570562233
	.word	1426400815
	.word	-977650754
	.word	-1296233688
	.word	733239954
	.word	1555261956
	.word	-1026031705
	.word	-1244606671
	.word	752459403
	.word	1541320221
	.word	-1687895376
	.word	-328994266
	.word	1969922972
	.word	40735498
	.word	-1677130071
	.word	-351390145
	.word	1913087877
	.word	83908371
	.word	-1782625662
	.word	-491226604
	.word	2075208622
	.word	213261112
	.word	-1831694693
	.word	-438977011
	.word	2094854071
	.word	198958881
	.word	-2032938284
	.word	-237706686
	.word	1759359992
	.word	534414190
	.word	-2118248755
	.word	-155638181
	.word	1873836001
	.word	414664567
	.word	-2012718362
	.word	-15766928
	.word	1711684554
	.word	285281116
	.word	-1889165569
	.word	-127750551
	.word	1634467795
	.word	376229701
	.word	-1609899400
	.word	-686959890
	.word	1308918612
	.word	956543938
	.word	-1486412191
	.word	-799009033
	.word	1231636301
	.word	1047427035
	.word	-1362007478
	.word	-640263460
	.word	1088359270
	.word	936918000
	.word	-1447252397
	.word	-558129467
	.word	1202900863
	.word	817233897
	.word	-1111625188
	.word	-893730166
	.word	1404277552
	.word	615818150
	.word	-1160759803
	.word	-841546093
	.word	1423857449
	.word	601450431
	.word	-1285129682
	.word	-1000256840
	.word	1567103746
	.word	711928724
	.word	-1274298825
	.word	-1022587231
	.word	1510334235
	.word	755167117
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.set	nomips16
	.ent	main
	.type	main, @function
main:
	.frame	$sp,1096,$31		# vars= 1040, regs= 10/0, args= 16, gp= 0
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	lui	$3,%hi(_binary_320mm_dat_start)
	addiu	$3,$3,%lo(_binary_320mm_dat_start)
	li	$2,262144			# 0x40000
	addiu	$sp,$sp,-1096
	addu	$2,$2,$3
	sw	$16,1056($sp)
	lw	$16,-4($2)
	lui	$2,%hi($LC0)
	sw	$3,%gp_rel(init_data)($28)
	lui	$3,%hi(_binary_320mm_dat_start+262140)
	addiu	$3,$3,%lo(_binary_320mm_dat_start+262140)
	addiu	$2,$2,%lo($LC0)
	sw	$3,%gp_rel(init_n)($28)
	sw	$31,1092($sp)
	sw	$fp,1088($sp)
	sw	$23,1084($sp)
	sw	$22,1080($sp)
	sw	$21,1076($sp)
	sw	$20,1072($sp)
	sw	$19,1068($sp)
	sw	$18,1064($sp)
	sw	$17,1060($sp)
	addiu	$3,$sp,16
	addiu	$4,$2,1024
$L79:
	lw	$8,0($2)
	lw	$7,4($2)
	lw	$6,8($2)
	lw	$5,12($2)
	addiu	$2,$2,16
	sw	$8,0($3)
	sw	$7,4($3)
	sw	$6,8($3)
	sw	$5,12($3)
	.set	noreorder
	.set	nomacro
	bne	$2,$4,$L79
	addiu	$3,$3,16
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,109			# 0x6d
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,109			# 0x6d
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,32			# 0x20
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,110			# 0x6e
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,61			# 0x3d
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	mylib_display_dec
	move	$4,$16
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,10			# 0xa
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,13			# 0xd
	.set	macro
	.set	reorder

 #APP
 # 197 "./main.c" 1
	.set   noat
	pinsw  $0,$0,$0,0
	nop
	nop
	pinsw  $0,$0,$0,1
	nop
	nop
	pinsw  $0,$0,$0,2
	nop
	nop
	pinsw  $0,$0,$0,3
	.set   at
	
 # 0 "" 2
 #NO_APP
	mult	$16,$16
	mflo	$14
	.set	noreorder
	.set	nomacro
	blez	$14,$L80
	lui	$3,%hi(buf)
	.set	macro
	.set	reorder

	lw	$15,%gp_rel(init_data)($28)
	lui	$2,%hi(dummy_mem)
	addiu	$3,$3,%lo(buf)
	addiu	$2,$2,%lo(dummy_mem)
	move	$5,$0
	move	$4,$0
$L81:
	sll	$6,$5,2
	addu	$6,$15,$6
 #APP
 # 214 "./main.c" 1
	.set    noat
	lq      $1,($6)
	lq      $2,16($6)
	.set    at

 # 0 "" 2
 # 220 "./main.c" 1
	.set    noat
	nop
	pextw   $6,$1,0
	pextw   $7,$1,1
	pextw   $8,$1,2
	pextw   $9,$1,3
	pextw   $10,$2,0
	pextw   $11,$2,1
	pextw   $12,$2,2
	pextw   $13,$2,3
	.set    at
	
 # 0 "" 2
 # 236 "./main.c" 1
	.set    noat
	pinsw   $3,$0,$6,0
	pinsw   $4,$0,$7,0
	nop
	pinsw   $3,$3,$8,1
	pinsw   $4,$4,$9,1
	nop
	pinsw   $3,$3,$10,2
	pinsw   $4,$4,$11,2
	nop
	pinsw   $3,$3,$12,3
	pinsw   $4,$4,$13,3
	.set    at
	
 # 0 "" 2
 # 271 "./main.c" 1
	.set       noat
	cache      0x0d,($3)
	cache      0x0d,($2)
	.set       at

 # 0 "" 2
 # 279 "./main.c" 1
	.set    noat
	sq      $3,($3)
	sq      $4,($2)
	.set    at

 # 0 "" 2
 #NO_APP
	addiu	$4,$4,4
	addiu	$5,$5,8
	slt	$6,$4,$14
	andi	$5,$5,0xffff
	addiu	$3,$3,16
	.set	noreorder
	.set	nomacro
	bne	$6,$0,$L81
	addiu	$2,$2,16
	.set	macro
	.set	reorder

$L80:
	.set	noreorder
	.set	nomacro
	blez	$16,$L101
	sll	$21,$16,3
	.set	macro
	.set	reorder

	sll	$17,$16,2
	lui	$3,%hi(buf)
	lui	$2,%hi(dummy_mem)
	lui	$18,%hi(dummy_mem+2097152)
	move	$25,$17
	sll	$22,$16,1
	move	$4,$16
	move	$31,$0
	move	$24,$0
	move	$23,$0
	addiu	$3,$3,%lo(buf)
	addiu	$13,$2,%lo(dummy_mem)
	addiu	$18,$18,%lo(dummy_mem+2097152)
	move	$12,$21
$L83:
	addu	$fp,$22,$4
	subu	$2,$fp,$31
	subu	$4,$4,$31
	sll	$11,$4,2
	addu	$31,$31,$22
	sll	$4,$2,2
	addu	$20,$24,$21
	addu	$19,$25,$21
	move	$14,$0
	move	$15,$0
$L87:
 #APP
 # 451 "./main.c" 1
	.set    noat
	psubw   $1,$0,$0
	psubw   $2,$0,$0
	psubw   $3,$0,$0
	psubw   $4,$0,$0
	.set    at

 # 0 "" 2
 #NO_APP
	move	$6,$0
	move	$2,$24
	move	$5,$14
$L85:
	addu	$7,$13,$5
 #APP
 # 464 "./main.c" 1
	.set    noat
	lq      $5,($7)
	.set    at

 # 0 "" 2
 #NO_APP
	addu	$8,$2,$11
	addu	$9,$2,$12
	addu	$10,$2,$4
	addu	$7,$3,$2
	addu	$8,$3,$8
	addu	$9,$3,$9
	addu	$10,$3,$10
	lw	$7,0($7)
	lw	$8,0($8)
	lw	$9,0($9)
	lw	$10,0($10)
	#nop
 #APP
 # 487 "./main.c" 1
	.set    noat
	pmultsw $5,$7
	pmflo   $6
	nop
	nop
	paddw   $1,$1,$6
	pmultsw $5,$8
	pmflo   $6
	nop
	nop
	paddw   $2,$2,$6
	pmultsw $5,$9
	pmflo   $6
	nop
	nop
	paddw   $3,$3,$6
	pmultsw $5,$10
	pmflo   $6
	nop
	nop
	paddw   $4,$4,$6
	.set    at
	
 # 0 "" 2
 #NO_APP
	addiu	$6,$6,1
	addu	$5,$5,$17
	.set	noreorder
	.set	nomacro
	bne	$6,$16,$L85
	addiu	$2,$2,4
	.set	macro
	.set	reorder

	addu	$2,$14,$24
	addu	$5,$14,$25
	addu	$6,$14,$20
	addu	$7,$14,$19
	addu	$2,$18,$2
	addu	$5,$18,$5
	addu	$6,$18,$6
	addu	$7,$18,$7
 #APP
 # 531 "./main.c" 1
	.set     noat
	cache    0x0d,($2)
	cache    0x0d,($5)
	cache    0x0d,($6)
	cache    0x0d,($7)
	
 # 0 "" 2
 # 551 "./main.c" 1
	.set    noat
	sq      $1,($2)
	sq      $2,($5)
	sq      $3,($6)
	sq      $4,($7)
	.set    at
	
 # 0 "" 2
 #NO_APP
	addiu	$15,$15,4
	slt	$2,$15,$16
	.set	noreorder
	.set	nomacro
	bne	$2,$0,$L87
	addiu	$14,$14,16
	.set	macro
	.set	reorder

	addiu	$23,$23,4
	slt	$2,$23,$16
	addu	$24,$20,$21
	addu	$25,$19,$21
	addu	$4,$fp,$22
	.set	noreorder
	.set	nomacro
	bne	$2,$0,$L83
	addu	$31,$31,$22
	.set	macro
	.set	reorder

$L82:
	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,10			# 0xa
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,13			# 0xd
	.set	macro
	.set	reorder

	addiu	$2,$16,-7
	mult	$16,$2
	li	$19,8			# 0x8
	mflo	$20
	sll	$20,$20,2
	addiu	$20,$20,-32
	addu	$2,$18,$20
$L102:
 #APP
 # 635 "./main.c" 1
	.set    noat
	lq      $1,($2)
	lq      $2,16($2)
	.set    at

 # 0 "" 2
 # 641 "./main.c" 1
	.set    noat
	nop
	pextw   $4,$1,0
	pextw   $5,$1,1
	pextw   $3,$1,2
	pextw   $2,$1,3
	pextw   $fp,$2,0
	pextw   $23,$2,1
	pextw   $22,$2,2
	pextw   $21,$2,3
	.set    at
	
 # 0 "" 2
 #NO_APP
	sw	$2,1048($sp)
	sw	$3,1044($sp)
	.set	noreorder
	.set	nomacro
	jal	mylib_display_hex
	sw	$5,1040($sp)
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,32			# 0x20
	.set	macro
	.set	reorder

	lw	$5,1040($sp)
	addiu	$19,$19,-1
	addu	$20,$20,$17
	.set	noreorder
	.set	nomacro
	jal	mylib_display_hex
	move	$4,$5
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,32			# 0x20
	.set	macro
	.set	reorder

	lw	$3,1044($sp)
	.set	noreorder
	.set	nomacro
	jal	mylib_display_hex
	move	$4,$3
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,32			# 0x20
	.set	macro
	.set	reorder

	lw	$2,1048($sp)
	.set	noreorder
	.set	nomacro
	jal	mylib_display_hex
	move	$4,$2
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,32			# 0x20
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	mylib_display_hex
	move	$4,$fp
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,32			# 0x20
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	mylib_display_hex
	move	$4,$23
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,32			# 0x20
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	mylib_display_hex
	move	$4,$22
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,32			# 0x20
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	mylib_display_hex
	move	$4,$21
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,32			# 0x20
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,10			# 0xa
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,13			# 0xd
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	bne	$19,$0,$L102
	addu	$2,$18,$20
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	blez	$16,$L96
	move	$10,$0
	.set	macro
	.set	reorder

	move	$9,$0
	move	$4,$0
	li	$6,32			# 0x20
$L91:
	move	$8,$10
	move	$7,$0
$L95:
	addu	$2,$18,$8
	lw	$5,0($2)
	nor	$3,$0,$4
	move	$2,$0
$L93:
	srl	$4,$5,$2
	xor	$4,$3,$4
	andi	$4,$4,0x00ff
	sll	$4,$4,2
	addiu	$11,$sp,16
	addu	$4,$11,$4
	lw	$4,0($4)
	srl	$3,$3,8
	addiu	$2,$2,8
	.set	noreorder
	.set	nomacro
	bne	$2,$6,$L93
	xor	$3,$4,$3
	.set	macro
	.set	reorder

	addiu	$7,$7,1
	nor	$4,$0,$3
	.set	noreorder
	.set	nomacro
	bne	$7,$16,$L95
	addiu	$8,$8,4
	.set	macro
	.set	reorder

	addiu	$9,$9,1
	.set	noreorder
	.set	nomacro
	bne	$9,$16,$L91
	addu	$10,$10,$17
	.set	macro
	.set	reorder

$L90:
	jal	mylib_display_hex
	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,10			# 0xa
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	jal	output_buffer_put
	li	$4,13			# 0xd
	.set	macro
	.set	reorder

	jal	mylib_finalize
	lw	$31,1092($sp)
	lw	$fp,1088($sp)
	lw	$23,1084($sp)
	lw	$22,1080($sp)
	lw	$21,1076($sp)
	lw	$20,1072($sp)
	lw	$19,1068($sp)
	lw	$18,1064($sp)
	lw	$17,1060($sp)
	lw	$16,1056($sp)
	move	$2,$0
	.set	noreorder
	.set	nomacro
	j	$31
	addiu	$sp,$sp,1096
	.set	macro
	.set	reorder

$L96:
	.set	noreorder
	.set	nomacro
	j	$L90
	move	$4,$0
	.set	macro
	.set	reorder

$L101:
	lui	$18,%hi(dummy_mem+2097152)
	sll	$17,$16,2
	.set	noreorder
	.set	nomacro
	j	$L82
	addiu	$18,$18,%lo(dummy_mem+2097152)
	.set	macro
	.set	reorder

	.end	main
	.size	main, .-main
	.globl	buf
	.section	.dummy_space2,"aw",@progbits
	.align	4
	.type	buf, @object
	.size	buf, 2097152
buf:
	.space	2097152

	.comm	init_n,4,4

	.comm	init_data,4,16
	.globl	dummy_mem
	.section	.dummy_space,"aw",@progbits
	.align	4
	.type	dummy_mem, @object
	.size	dummy_mem, 5767168
dummy_mem:
	.space	5767168
	.local	output_buffer_size
	.comm	output_buffer_size,4,4
	.local	output_buffer
	.comm	output_buffer,1024,4
	.ident	"GCC: (GNU) 4.8.3"
