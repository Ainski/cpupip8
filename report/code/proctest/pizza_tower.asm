# 比萨塔摔鸡蛋游戏验证模型
# 寄存器使用说明：
# $s0: 总层数N
# $s1: 耐摔值F
# $s2: 当前鸡蛋数
# $s3: 总摔次数
# $s4: 总上楼数m
# $s5: 总下楼数n
# $s6: 摔破鸡蛋数h
# $s7: 最后摔的状态 (0:未破, 1:已破)
# $t0-$t9: 临时寄存器

# 内存布局：
# 0x0000: 输入N (总层数)
# 0x0004: 输入F (耐摔值)
# 0x0008: 输出总摔次数
# 0x000C: 输出总鸡蛋数
# 0x0010: 输出最后状态
# 0x0014: 输出成本1 (物质匮乏时期)
# 0x0018: 输出成本2 (人力成本增长时期)

# 初始化
main:
    # 加载输入参数
    lw $s0, 0x0000($zero)      # 加载总层数N
    lw $s1, 0x0004($zero)      # 加载耐摔值F
    
    # 初始化变量
    addiu $s2, $zero, 1        # 鸡蛋数从1开始
    addiu $s3, $zero, 0        # 总摔次数初始为0
    addiu $s4, $zero, 0        # 总上楼数初始为0
    addiu $s5, $zero, 0        # 总下楼数初始为0
    addiu $s6, $zero, 0        # 摔破鸡蛋数初始为0
    addiu $s7, $zero, 0        # 最后状态初始为0
    
    # 二分查找算法
    addiu $t0, $zero, 1        # low = 1
    add  $t1, $zero, $s0       # high = N
    addiu $t2, $zero, 0        # 当前楼层
    addiu $t3, $zero, 1        # 鸡蛋完好标志
    
search_loop:
    # 检查搜索是否结束
    sltu $t4, $t0, $t1         # 比较low < high
    beq  $t4, $zero, search_end
    
    # 计算中间楼层
    add  $t2, $t0, $t1         # low + high
    sll  $t5, $t2, 31          # 判断奇偶
    beq  $t5, $zero, even_mid
    addiu $t2, $t2, 1          # 奇数加1
even_mid:
    srl  $t2, $t2, 1           # 除以2得到中间楼层
    
    # 摔鸡蛋测试
    addiu $s3, $s3, 1          # 总摔次数+1
    
    # 计算上楼数
    subu $t6, $t2, $t0         # 当前楼层 - low
    add  $s4, $s4, $t6         # 累加上楼数
    
    # 测试鸡蛋
    sltu $t7, $t2, $s1         # 比较楼层 < 耐摔值
    addiu $t8, $s1, 1
    sltu $t9, $t2, $t8         # 比较楼层 <= 耐摔值
    beq  $t9, $zero, egg_broken
    
    # 鸡蛋未破
    addiu $s7, $zero, 0        # 最后状态=0 (未破)
    add  $t0, $zero, $t2       # low = mid
    addiu $t0, $t0, 1          # low = mid + 1
    
    # 计算下楼数
    subu $t6, $t1, $t2         # high - 当前楼层
    add  $s5, $s5, $t6         # 累加下楼数
    
    beq  $zero, $zero, search_continue
    
egg_broken:
    # 鸡蛋摔破
    addiu $s6, $s6, 1          # 摔破鸡蛋数+1
    addiu $s2, $s2, 1          # 总鸡蛋数+1 (使用新鸡蛋)
    addiu $s7, $zero, 1        # 最后状态=1 (已破)
    add  $t1, $zero, $t2       # high = mid
    
    # 计算下楼数
    subu $t6, $t2, $t0         # 当前楼层 - low
    add  $s5, $s5, $t6         # 累加下楼数
    
search_continue:
    beq  $zero, $zero, search_loop
    
search_end:
    # 最后一次测试
    addiu $s3, $s3, 1          # 总摔次数+1
    
    # 测试鸡蛋
    sltu $t7, $t0, $s1         # 比较楼层 < 耐摔值
    addiu $t8, $s1, 1
    sltu $t9, $t0, $t8         # 比较楼层 <= 耐摔值
    beq  $t9, $zero, final_broken
    
    # 鸡蛋未破
    addiu $s7, $zero, 0        # 最后状态=0
    beq  $zero, $zero, save_results
    
final_broken:
    # 鸡蛋摔破
    addiu $s6, $s6, 1          # 摔破鸡蛋数+1
    addiu $s2, $s2, 1          # 总鸡蛋数+1
    addiu $s7, $zero, 1        # 最后状态=1
    
save_results:
    # 保存输出结果
    sw $s3, 0x0008($zero)      # 保存总摔次数
    sw $s2, 0x000C($zero)      # 保存总鸡蛋数
    sw $s7, 0x0010($zero)      # 保存最后状态
    
    # 计算成本1 (物质匮乏时期: p1=2, p2=1, p3=4)
    # cost1 = m*2 + n*1 + h*4
    sll  $t0, $s4, 1           # m * 2
    add  $t1, $s5, $zero       # n * 1
    sll  $t2, $s6, 2           # h * 4
    add  $t3, $t0, $t1
    add  $t3, $t3, $t2         # 总成本1
    sw   $t3, 0x0014($zero)    # 保存成本1
    
    # 计算成本2 (人力成本增长时期: p1=4, p2=1, p3=2)
    # cost2 = m*4 + n*1 + h*2
    sll  $t0, $s4, 2           # m * 4
    add  $t1, $s5, $zero       # n * 1
    sll  $t2, $s6, 1           # h * 2
    add  $t3, $t0, $t1
    add  $t3, $t3, $t2         # 总成本2
    sw   $t3, 0x0018($zero)    # 保存成本2
    
    # 程序结束
    halt
    
# 程序结束