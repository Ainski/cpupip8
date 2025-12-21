def convert_hex_to_coe(input_text, radix=16):
    """
    将纯十六进制文本转换为COE格式
    :param input_text: 纯十六进制文本（每行一个十六进制数）
    :param radix: 基数（默认为16）
    :return: COE格式的字符串
    """
    # 分割输入文本为行
    lines = input_text.strip().split('\n')
    
    # 过滤空行并清理每行
    hex_values = []
    for line in lines:
        line = line.strip()
        if line:
            # 移除可能的空白字符和分号
            line = line.replace(';', '').replace(',', '').strip()
            if line:
                # 检查是否为有效的十六进制数
                try:
                    # 尝试解析为十六进制数
                    int(line, 16)
                    hex_values.append(line)
                except ValueError:
                    # 如果不是有效的十六进制，跳过或根据需求处理
                    print(f"警告: 跳过无效的十六进制数: {line}")
                    continue
    
    # 构建COE格式
    coe_content = f"memory_initialization_radix = {radix};\n"
    coe_content += "memory_initialization_vector =\n"
    
    # 添加数据行，除最后一行外都以逗号结尾
    for i, value in enumerate(hex_values):
        if i < len(hex_values) - 1:
            coe_content += f"{value},\n"
        else:
            coe_content += f"{value};\n"
    
    return coe_content

def convert_hex_file(input_file, output_file=None, radix=16):
    """
    将纯十六进制文本文件转换为COE文件
    :param input_file: 输入文件名（纯十六进制文本）
    :param output_file: 输出文件名（COE格式）
    :param radix: 基数（默认为16）
    """
    
    # 读取输入文件
    try:
        with open(input_file, 'r') as f:
            input_text = f.read()
    except FileNotFoundError:
        print(f"错误: 找不到文件 {input_file}")
        return
    
    # 转换为COE格式
    coe_content = convert_hex_to_coe(input_text, radix)
    
    # 输出结果
    if output_file:
        with open(output_file, 'w') as f:
            f.write(coe_content)
        print(f"转换完成！已保存到: {output_file}")
    else:
        # 如果没有指定输出文件，生成默认输出文件名
        if input_file.endswith('.txt'):
            output_file = input_file.replace('.txt', '.coe')
        elif input_file.endswith('.hex'):
            output_file = input_file.replace('.hex', '.coe')
        else:
            output_file = input_file + '.coe'
        
        with open(output_file, 'w') as f:
            f.write(coe_content)
        print(f"转换完成！已保存到: {output_file}")

def direct_convert():
    """直接转换：输入十六进制数，输出COE格式"""
    print("纯十六进制转COE格式工具")
    print("请输入十六进制数（每行一个，输入空行结束）：")
    print("-" * 40)
    
    lines = []
    while True:
        try:
            line = input()
            if line == "":
                # 检查是否应该结束输入
                if not lines:
                    continue
                # 连续两个空行或用户输入结束
                break
            lines.append(line)
        except EOFError:
            break
    
    input_text = '\n'.join(lines)
    coe_content = convert_hex_to_coe(input_text)
    
    print("\n生成的COE格式:")
    print("-" * 40)
    print(coe_content)
    print("-" * 40)
    
    # 询问是否保存到文件
    save = input("\n是否保存到文件？(y/n): ").lower()
    if save == 'y':
        filename = input("请输入文件名: ")
        with open(filename, 'w') as f:
            f.write(coe_content)
        print(f"文件已保存到: {filename}")

def batch_convert():
    """批量转换文件夹中的所有十六进制文本文件"""
    import os
    import glob
    
    print("批量转换十六进制文件为COE格式")
    folder = input("请输入文件夹路径: ")
    pattern = input("请输入文件匹配模式（例如: *.txt, *.hex, 或直接回车匹配所有文件）: ")
    
    if not pattern:
        pattern = "*"
    
    # 查找所有匹配的文件
    search_pattern = os.path.join(folder, pattern)
    files = glob.glob(search_pattern)
    
    if not files:
        print(f"在文件夹 {folder} 中找不到匹配 {pattern} 的文件")
        return
    
    print(f"找到 {len(files)} 个文件:")
    for i, file in enumerate(files, 1):
        print(f"{i}. {os.path.basename(file)}")
    
    proceed = input("\n是否开始转换？(y/n): ").lower()
    if proceed != 'y':
        return
    
    converted_count = 0
    for input_file in files:
        try:
            # 生成输出文件名
            base_name = os.path.basename(input_file)
            if '.' in base_name:
                name_without_ext = '.'.join(base_name.split('.')[:-1])
                output_file = os.path.join(folder, name_without_ext + '.coe')
            else:
                output_file = os.path.join(folder, base_name + '.coe')
            
            # 读取文件内容
            with open(input_file, 'r') as f:
                input_text = f.read()
            
            # 转换为COE格式
            coe_content = convert_hex_to_coe(input_text)
            
            # 保存文件
            with open(output_file, 'w') as f:
                f.write(coe_content)
            
            print(f"✓ 已转换: {base_name} -> {os.path.basename(output_file)}")
            converted_count += 1
            
        except Exception as e:
            print(f"✗ 转换失败 {os.path.basename(input_file)}: {e}")
    
    print(f"\n批量转换完成！成功转换 {converted_count} 个文件")

if __name__ == "__main__":
    import sys
    
    print("十六进制转COE格式转换器")
    print("=" * 50)
    
    if len(sys.argv) > 1:
        # 命令行模式
        if len(sys.argv) == 2:
            # 只有输入文件，自动生成输出文件
            convert_hex_file(sys.argv[1])
        elif len(sys.argv) == 3:
            # 有输入文件和输出文件
            convert_hex_file(sys.argv[1], sys.argv[2])
        elif len(sys.argv) == 4:
            # 有输入文件、输出文件和基数
            try:
                radix = int(sys.argv[3])
                if radix not in [2, 10, 16]:
                    print("警告: 基数通常为 2, 10 或 16")
                convert_hex_file(sys.argv[1], sys.argv[2], radix)
            except ValueError:
                print("错误: 基数必须是整数")
        else:
            print("用法:")
            print("  python hex_to_coe.py <输入文件> [输出文件] [基数]")
            print("\n示例:")
            print("  python hex_to_coe.py input.hex")
            print("  python hex_to_coe.py input.hex output.coe")
            print("  python hex_to_coe.py input.hex output.coe 16")
    else:
        # 交互式菜单
        while True:
            print("\n请选择操作:")
            print("1. 转换单个文件")
            print("2. 直接输入十六进制数并转换")
            print("3. 批量转换文件夹中的文件")
            print("4. 退出")
            
            choice = input("请输入选项 (1-4): ").strip()
            
            if choice == '1':
                input_file = input("请输入输入文件名: ")
                output_file = input("请输入输出文件名 (直接回车则自动生成): ")
                if not output_file:
                    output_file = None
                
                radix_input = input("请输入基数 (16, 10, 2，直接回车默认为16): ")
                radix = 16
                if radix_input:
                    try:
                        radix = int(radix_input)
                    except ValueError:
                        print("无效的基数，使用默认值16")
                
                convert_hex_file(input_file, output_file, radix)
            
            elif choice == '2':
                direct_convert()
            
            elif choice == '3':
                batch_convert()
            
            elif choice == '4':
                print("感谢使用！")
                break
            
            else:
                print("无效的选项，请重新选择")
            
            # 询问是否继续
            continue_option = input("\n是否继续？(y/n): ").lower()
            if continue_option != 'y':
                print("感谢使用！")
                break