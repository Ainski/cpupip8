#!/usr/bin/env python3
"""
测试汇编器并使用txt_compare比较结果
"""

import subprocess
import os
import sys

def run_test(test_name):
    """运行单个测试"""
    print(f"Running test: {test_name}")
    
    # 1. 将汇编代码转换为机器码
    asm_file = f"../testdata/{test_name}.txt"
    hex_file = f"../testdata/{test_name}.hex.txt"
    
    if not os.path.exists(asm_file):
        print(f"Assembly file does not exist: {asm_file}")
        return False
        
    if not os.path.exists(hex_file):
        print(f"Hex file does not exist: {hex_file}")
        return False
    
    # 生成临时转换的hex文件
    temp_hex_file = f"../testdata/{test_name}_converted.hex.txt"
    
    try:
        # 使用转换工具将汇编代码转换为机器码
        from convert_asm_to_hex import convert_asm_to_hex
        success = convert_asm_to_hex(asm_file, temp_hex_file)
        if not success:
            print(f"Conversion failed for {test_name}")
            return False
        
        print(f"Successfully converted {asm_file} to {temp_hex_file}")
        
        # 使用txt_compare比较原始hex文件和转换后的hex文件
        result = subprocess.run([
            'txt_compare', 
            '--file1', temp_hex_file, 
            '--file2', hex_file, 
            '--display', 'detailed'
        ], capture_output=True, text=True)
        
        print(f"Comparison result for {test_name}:")
        print(result.stdout)
        if result.stderr:
            print("Errors:", result.stderr)
            
        # 清理临时文件
        if os.path.exists(temp_hex_file):
            os.remove(temp_hex_file)
            print(f"Cleaned up temporary file: {temp_hex_file}")
        
        # 检查比较结果
        if result.returncode == 0 and ("PASS" in result.stdout or "MATCH" in result.stdout):
            print(f"Test {test_name}: PASSED")
            return True
        else:
            print(f"Test {test_name}: FAILED")
            return False
            
    except Exception as e:
        print(f"Error during test {test_name}: {e}")
        # 清理临时文件（如果存在）
        if os.path.exists(temp_hex_file):
            os.remove(temp_hex_file)
        return False

def main():
    # 定义要测试的文件（不包含扩展名）
    test_files = [
        "1_addi",
        "2_addiu", 
        "9_addu",
        "11_beq",
        "12_bne",
        "16.26_lwsw",
        "16.26_lwsw2",
        "20_sll",
        "22_sltu",
        "25_subu"
    ]
    
    print("Starting tests...")
    passed = 0
    total = len(test_files)
    
    for test_file in test_files:
        if run_test(test_file):
            passed += 1
    
    print(f"\nTest Summary: {passed}/{total} tests passed")

if __name__ == "__main__":
    main()