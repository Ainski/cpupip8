module PC(
    input clk,
    input reset,
    output reg [31:0] pc,
    output npc 
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pc <= 0;
        end else begin
            pc <= pc + 4;
        end
    end
    assign npc = pc + 4;

endmodule