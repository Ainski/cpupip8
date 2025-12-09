addiu $s0, $zero, 100    # building_height = 100
addiu $s1, $zero, 42     # egg_durability = 42

# 物质匮乏时期成本参数
addiu $s2, $zero, 2      # scarcity_p1 = 2
addiu $s3, $zero, 1      # scarcity_p2 = 1  
addiu $s4, $zero, 4      # scarcity_p3 = 4

# 人力成本增长时期成本参数
addiu $s5, $zero, 4      # labor_p1 = 4
addiu $s6, $zero, 1      # labor_p2 = 1
addiu $s7, $zero, 2      # labor_p3 = 2

# 开始模拟物质匮乏时期
# 初始化游戏变量
addiu $t0, $zero, 0      # total_drops = 0
addiu $t1, $zero, 0      # total_eggs_broken = 0
addiu $t2, $zero, 0      # last_egg_broken = 0
addiu $t3, $zero, 0      # total_cost = 0
addiu $t4, $zero, 1      # low = 1
addiu $t5, $zero, 100    # high = building_height
addiu $t6, $zero, 0      # current_floor = 0
addiu $t7, $zero, 2      # eggs_remaining = 2
addiu $t8, $zero, 0      # up_floors = 0
addiu $t9, $zero, 0      # down_floors = 0

# 物质匮乏时期游戏循环
scarcity_loop:
# 检查循环条件: low <= high && eggs_remaining > 0
sltu $at, $t5, $t4       # high < low?
bne $at, $zero, scarcity_end
beq $t7, $zero, scarcity_end

# 计算mid = (low + high) / 2
addu $at, $t4, $t5
srl $at, $at, 1

# 计算上下楼
sltu $k0, $t6, $at       # current_floor < mid?
bne $k0, $zero, scarcity_go_up

# 下楼情况
subu $k0, $t6, $at
addu $t9, $t9, $k0
beq $zero, $zero, scarcity_update_pos

scarcity_go_up:
# 上楼情况
subu $k0, $at, $t6
addu $t8, $t8, $k0

scarcity_update_pos:
# current_floor = mid
addiu $t6, $at, 0

# total_drops++
addiu $t0, $t0, 1

# 检查鸡蛋是否摔破
sltu $k0, $s1, $at       # egg_durability < mid?
bne $k0, $zero, scarcity_egg_broken

# 鸡蛋没破
addiu $t2, $zero, 0      # last_egg_broken = 0
addiu $t4, $at, 1        # low = mid + 1
beq $zero, $zero, scarcity_continue

scarcity_egg_broken:
# 鸡蛋摔破
addiu $t1, $t1, 1        # total_eggs_broken++
addiu $t7, $t7, -1       # eggs_remaining--
addiu $t2, $zero, 1      # last_egg_broken = 1
addiu $t5, $at, -1       # high = mid - 1

scarcity_continue:
beq $zero, $zero, scarcity_loop

scarcity_end:
# 计算物质匮乏时期总成本: up_floors*p1 + down_floors*p2 + eggs_broken*p3
addiu $k0, $zero, 0      # temp_cost = 0

# 计算 up_floors * p1 (加法模拟乘法)
addiu $k1, $zero, 0      # 乘法计数器
scarcity_mult1_loop:
beq $t8, $zero, scarcity_mult1_done
addu $k0, $k0, $s2
addiu $t8, $t8, -1
beq $zero, $zero, scarcity_mult1_loop
scarcity_mult1_done:

# 计算 down_floors * p2
addiu $k1, $zero, 0
scarcity_mult2_loop:
beq $t9, $zero, scarcity_mult2_done
addu $k0, $k0, $s3
addiu $t9, $t9, -1
beq $zero, $zero, scarcity_mult2_loop
scarcity_mult2_done:

# 计算 eggs_broken * p3
addiu $k1, $zero, 0
scarcity_mult3_loop:
beq $t1, $zero, scarcity_mult3_done
addu $k0, $k0, $s4
addiu $t1, $t1, -1
beq $zero, $zero, scarcity_mult3_loop
scarcity_mult3_done:

# 保存物质匮乏时期结果
addiu $t8, $t0, 0        # total_drops -> $t8
addiu $t9, $t1, 0        # total_eggs_broken -> $t9
addiu $k0, $t2, 0        # last_egg_broken -> $k0
addiu $k1, $k0, 0        # total_cost -> $k1

# 开始模拟人力成本增长时期
# 重新初始化游戏变量
addiu $t0, $zero, 0      # total_drops = 0
addiu $t1, $zero, 0      # total_eggs_broken = 0
addiu $t2, $zero, 0      # last_egg_broken = 0
addiu $t3, $zero, 0      # total_cost = 0
addiu $t4, $zero, 1      # low = 1
addiu $t5, $zero, 100    # high = building_height
addiu $t6, $zero, 0      # current_floor = 0
addiu $t7, $zero, 2      # eggs_remaining = 2
addiu $gp, $zero, 0      # up_floors = 0
addiu $sp, $zero, 0      # down_floors = 0

# 人力成本增长时期游戏循环
labor_loop:
# 检查循环条件
sltu $at, $t5, $t4       # high < low?
bne $at, $zero, labor_end
beq $t7, $zero, labor_end

# 计算mid = (low + high) / 2
addu $at, $t4, $t5
srl $at, $at, 1

# 计算上下楼
sltu $fp, $t6, $at       # current_floor < mid?
bne $fp, $zero, labor_go_up

# 下楼情况
subu $fp, $t6, $at
addu $sp, $sp, $fp
beq $zero, $zero, labor_update_pos

labor_go_up:
# 上楼情况
subu $fp, $at, $t6
addu $gp, $gp, $fp

labor_update_pos:
# current_floor = mid
addiu $t6, $at, 0

# total_drops++
addiu $t0, $t0, 1

# 检查鸡蛋是否摔破
sltu $fp, $s1, $at       # egg_durability < mid?
bne $fp, $zero, labor_egg_broken

# 鸡蛋没破
addiu $t2, $zero, 0      # last_egg_broken = 0
addiu $t4, $at, 1        # low = mid + 1
beq $zero, $zero, labor_continue

labor_egg_broken:
# 鸡蛋摔破
addiu $t1, $t1, 1        # total_eggs_broken++
addiu $t7, $t7, -1       # eggs_remaining--
addiu $t2, $zero, 1      # last_egg_broken = 1
addiu $t5, $at, -1       # high = mid - 1

labor_continue:
beq $zero, $zero, labor_loop

labor_end:
# 计算人力成本增长时期总成本
addiu $ra, $zero, 0      # temp_cost = 0

# 计算 up_floors * p1
addiu $fp, $zero, 0
labor_mult1_loop:
beq $gp, $zero, labor_mult1_done
addu $ra, $ra, $s5
addiu $gp, $gp, -1
beq $zero, $zero, labor_mult1_loop
labor_mult1_done:

# 计算 down_floors * p2
addiu $fp, $zero, 0
labor_mult2_loop:
beq $sp, $zero, labor_mult2_done
addu $ra, $ra, $s6
addiu $sp, $sp, -1
beq $zero, $zero, labor_mult2_loop
labor_mult2_done:

# 计算 eggs_broken * p3
addiu $fp, $zero, 0
labor_mult3_loop:
beq $t1, $zero, labor_mult3_done
addu $ra, $ra, $s7
addiu $t1, $t1, -1
beq $zero, $zero, labor_mult3_loop
labor_mult3_done:

# 保存人力成本增长时期结果
addiu $gp, $t0, 0        # total_drops -> $gp
addiu $sp, $t1, 0        # total_eggs_broken -> $sp
addiu $fp, $t2, 0        # last_egg_broken -> $fp
addiu $ra, $ra, 0        # total_cost -> $ra

# 程序结束
halt