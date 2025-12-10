`timescale 1ns / 1ps

module PCreg(
    input pc_clk,
    input reset,           // 低电平有效复位
    input [31:0] npc_in,
    input halt,   
    output [31:0] npc,
    output reg [31:0] pc,
    output [3:0] jpc_head
);

assign jpc_head = pc[31:28];  // 取PC高4位

// 异步复位，上升沿触发
reg Halting;
always @(posedge pc_clk) begin
    if (reset) begin
        Halting <= 1'b0;
    end else if (halt) begin
        Halting <= 1'b1;
    end
end


always @(posedge pc_clk) begin
    if (reset) begin       // 复位时PC清零
        pc <= 32'h00400000;
    end else if (Halting||halt) begin
        pc <= pc;
    end else begin
        pc <= npc_in;
    end
end

assign npc = pc + 32'd4;  // 计算下一条指令地址

endmodule