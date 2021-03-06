`define MEMORY_CONTROLLER_ADDR_SIZE 64
`define MEMORY_CONTROLLER_DATA_SIZE 64
// Number of RAM elements: 9
`define MEMORY_CONTROLLER_TAG_SIZE 9
// @halF33 = internal unnamed_addr constant [2 x float] [float 5.000000e-01, float -5.000000e-01], align 4
`define TAG_g_halF33 `MEMORY_CONTROLLER_TAG_SIZE'd10
`define TAG_g_halF33_a {`TAG_g_halF33, 55'd0}
// @ln2HI31 = internal unnamed_addr constant [2 x float] [float 0x3FE62E3000000000, float 0xBFE62E3000000000], align 4
`define TAG_g_ln2HI31 `MEMORY_CONTROLLER_TAG_SIZE'd8
`define TAG_g_ln2HI31_a {`TAG_g_ln2HI31, 55'd0}
// @ln2LO32 = internal unnamed_addr constant [2 x float] [float 0x3EE2FEFA20000000, float 0xBEE2FEFA20000000], align 4
`define TAG_g_ln2LO32 `MEMORY_CONTROLLER_TAG_SIZE'd9
`define TAG_g_ln2LO32_a {`TAG_g_ln2LO32, 55'd0}
// @param0 = internal global [10 x float] zeroinitializer, align 8
`define TAG_g_param0 `MEMORY_CONTROLLER_TAG_SIZE'd7
`define TAG_g_param0_a {`TAG_g_param0, 55'd0}
// @param1 = internal global [784 x [10 x float]] zeroinitializer, align 8
`define TAG_g_param1 `MEMORY_CONTROLLER_TAG_SIZE'd6
`define TAG_g_param1_a {`TAG_g_param1, 55'd0}
// @param2 = internal global [1 x [784 x float]] zeroinitializer, align 8
`define TAG_g_param2 `MEMORY_CONTROLLER_TAG_SIZE'd5
`define TAG_g_param2_a {`TAG_g_param2, 55'd0}
// @temp0 = internal unnamed_addr global [1 x [10 x float]] zeroinitializer, align 8
`define TAG_g_temp0 `MEMORY_CONTROLLER_TAG_SIZE'd4
`define TAG_g_temp0_a {`TAG_g_temp0, 55'd0}
// @temp1 = internal unnamed_addr global [1 x [10 x float]] zeroinitializer, align 8
`define TAG_g_temp1 `MEMORY_CONTROLLER_TAG_SIZE'd3
`define TAG_g_temp1_a {`TAG_g_temp1, 55'd0}
// @temp3 = internal global [10 x float] zeroinitializer, align 8
`define TAG_g_temp3 `MEMORY_CONTROLLER_TAG_SIZE'd2
`define TAG_g_temp3_a {`TAG_g_temp3, 55'd0}

// Turn off warning 'ignoring unsupported system task'
// altera message_off 10175

`timescale 1 ns / 1 ns
module top
	(
		clk,
		reset,
		start,
		finish,
		waitrequest,
		return_val
	);
input clk;
input reset;
input start;
output wire finish;
input waitrequest;
output wire [31:0] return_val;
wire memory_controller_waitrequest;
wire memory_controller_enable_a;
wire [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] memory_controller_address_a;
wire memory_controller_write_enable_a;
wire [`MEMORY_CONTROLLER_DATA_SIZE-1:0] memory_controller_in_a;
wire [1:0] memory_controller_size_a;
wire [`MEMORY_CONTROLLER_DATA_SIZE-1:0] memory_controller_out_a;

wire memory_controller_enable_b;
wire [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] memory_controller_address_b;
wire memory_controller_write_enable_b;
wire [`MEMORY_CONTROLLER_DATA_SIZE-1:0] memory_controller_in_b;
wire [1:0] memory_controller_size_b;
wire [`MEMORY_CONTROLLER_DATA_SIZE-1:0] memory_controller_out_b;

/* synthesis translate_off */
assign memory_controller_waitrequest = waitrequest;
/* synthesis translate_on */

memory_controller memory_controller_inst (
	.clk( clk ),
	.memory_controller_enable_a( memory_controller_enable_a ),
	.memory_controller_enable_b( memory_controller_enable_b ),
	.memory_controller_address_a( memory_controller_address_a ),
	.memory_controller_address_b( memory_controller_address_b ),
	.memory_controller_write_enable_a( memory_controller_write_enable_a ),
	.memory_controller_write_enable_b( memory_controller_write_enable_b ),
	.memory_controller_in_a( memory_controller_in_a ),
	.memory_controller_in_b( memory_controller_in_b ),
	.memory_controller_size_a( memory_controller_size_a ),
	.memory_controller_size_b( memory_controller_size_b ),
	.memory_controller_waitrequest( memory_controller_waitrequest ),
	.memory_controller_out_reg_a( memory_controller_out_a ),
	.memory_controller_out_reg_b( memory_controller_out_b )
);

main main_inst(
	.clk( clk ),
	.clk2x( clk2x ),
	.clk1x_follower( clk1x_follower ),
	.reset( reset ),
	.start( start ),
	.finish( finish ),
	.return_val( return_val ),
	.memory_controller_waitrequest(memory_controller_waitrequest),
	.memory_controller_enable_a(memory_controller_enable_a),
	.memory_controller_address_a(memory_controller_address_a),
	.memory_controller_write_enable_a(memory_controller_write_enable_a),
	.memory_controller_in_a(memory_controller_in_a),
	.memory_controller_size_a(memory_controller_size_a),
	.memory_controller_out_a(memory_controller_out_a),
	.memory_controller_enable_b(memory_controller_enable_b),
	.memory_controller_address_b(memory_controller_address_b),
	.memory_controller_write_enable_b(memory_controller_write_enable_b),
	.memory_controller_in_b(memory_controller_in_b),
	.memory_controller_size_b(memory_controller_size_b),
	.memory_controller_out_b(memory_controller_out_b)
);

endmodule

`timescale 1 ns / 1 ns
module memory_controller
(
	clk,
	memory_controller_address_a,
	memory_controller_address_b,
	memory_controller_enable_a,
	memory_controller_enable_b,
	memory_controller_write_enable_a,
	memory_controller_write_enable_b,
	memory_controller_in_a,
	memory_controller_in_b,
	memory_controller_size_a,
	memory_controller_size_b,
	memory_controller_waitrequest,
	memory_controller_out_reg_a,
	memory_controller_out_reg_b
);

parameter latency = 2;

parameter ram_latency = latency-1;

integer j;

input clk;
input memory_controller_waitrequest;
input [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] memory_controller_address_a;
input memory_controller_enable_a;
input memory_controller_write_enable_a;
input [64-1:0] memory_controller_in_a;
input [1:0] memory_controller_size_a;
output reg [64-1:0] memory_controller_out_reg_a;
reg [64-1:0] memory_controller_out_prev_a;
reg [64-1:0] memory_controller_out_a;

reg memory_controller_enable_reg_a;
input [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] memory_controller_address_b;
input memory_controller_enable_b;
input memory_controller_write_enable_b;
input [64-1:0] memory_controller_in_b;
input [1:0] memory_controller_size_b;
output reg [64-1:0] memory_controller_out_reg_b;
reg [64-1:0] memory_controller_out_prev_b;
reg [64-1:0] memory_controller_out_b;

reg memory_controller_enable_reg_b;

reg [3:0] temp3_address_a;
reg [3:0] temp3_address_b;
reg temp3_write_enable_a;
reg temp3_write_enable_b;
reg [31:0] temp3_in_a;
reg [31:0] temp3_in_b;
wire [31:0] temp3_out_a;
wire [31:0] temp3_out_b;

// @temp3 = internal global [10 x float] zeroinitializer, align 8
ram_dual_port temp3 (
	.clk( clk ),
	.clken( !memory_controller_waitrequest ),
	.address_a( temp3_address_a ),
	.address_b( temp3_address_b ),
	.wren_a( temp3_write_enable_a ),
	.wren_b( temp3_write_enable_b ),
	.data_a( temp3_in_a ),
	.data_b( temp3_in_b ),
	.byteena_a( 1'b1 ),
	.byteena_b( 1'b1 ),
	.q_a( temp3_out_a ),
	.q_b( temp3_out_b)
);
defparam temp3.width_a = 32;
defparam temp3.width_b = 32;
defparam temp3.widthad_a = 4;
defparam temp3.widthad_b = 4;
defparam temp3.width_be_a = 1;
defparam temp3.width_be_b = 1;
defparam temp3.numwords_a = 10;
defparam temp3.numwords_b = 10;
defparam temp3.latency = ram_latency;
defparam temp3.init_file = "temp3.mif";

reg [3:0] temp1_address_a;
reg [3:0] temp1_address_b;
reg temp1_write_enable_a;
reg temp1_write_enable_b;
reg [31:0] temp1_in_a;
reg [31:0] temp1_in_b;
wire [31:0] temp1_out_a;
wire [31:0] temp1_out_b;

// @temp1 = internal unnamed_addr global [1 x [10 x float]] zeroinitializer, align 8
ram_dual_port temp1 (
	.clk( clk ),
	.clken( !memory_controller_waitrequest ),
	.address_a( temp1_address_a ),
	.address_b( temp1_address_b ),
	.wren_a( temp1_write_enable_a ),
	.wren_b( temp1_write_enable_b ),
	.data_a( temp1_in_a ),
	.data_b( temp1_in_b ),
	.byteena_a( 1'b1 ),
	.byteena_b( 1'b1 ),
	.q_a( temp1_out_a ),
	.q_b( temp1_out_b)
);
defparam temp1.width_a = 32;
defparam temp1.width_b = 32;
defparam temp1.widthad_a = 4;
defparam temp1.widthad_b = 4;
defparam temp1.width_be_a = 1;
defparam temp1.width_be_b = 1;
defparam temp1.numwords_a = 10;
defparam temp1.numwords_b = 10;
defparam temp1.latency = ram_latency;
defparam temp1.init_file = "temp1.mif";

reg [3:0] temp0_address_a;
reg [3:0] temp0_address_b;
reg temp0_write_enable_a;
reg temp0_write_enable_b;
reg [31:0] temp0_in_a;
reg [31:0] temp0_in_b;
wire [31:0] temp0_out_a;
wire [31:0] temp0_out_b;

// @temp0 = internal unnamed_addr global [1 x [10 x float]] zeroinitializer, align 8
ram_dual_port temp0 (
	.clk( clk ),
	.clken( !memory_controller_waitrequest ),
	.address_a( temp0_address_a ),
	.address_b( temp0_address_b ),
	.wren_a( temp0_write_enable_a ),
	.wren_b( temp0_write_enable_b ),
	.data_a( temp0_in_a ),
	.data_b( temp0_in_b ),
	.byteena_a( 1'b1 ),
	.byteena_b( 1'b1 ),
	.q_a( temp0_out_a ),
	.q_b( temp0_out_b)
);
defparam temp0.width_a = 32;
defparam temp0.width_b = 32;
defparam temp0.widthad_a = 4;
defparam temp0.widthad_b = 4;
defparam temp0.width_be_a = 1;
defparam temp0.width_be_b = 1;
defparam temp0.numwords_a = 10;
defparam temp0.numwords_b = 10;
defparam temp0.latency = ram_latency;
defparam temp0.init_file = "temp0.mif";

reg [9:0] param2_address_a;
reg [9:0] param2_address_b;
reg param2_write_enable_a;
reg param2_write_enable_b;
reg [31:0] param2_in_a;
reg [31:0] param2_in_b;
wire [31:0] param2_out_a;
wire [31:0] param2_out_b;

// @param2 = internal global [1 x [784 x float]] zeroinitializer, align 8
ram_dual_port param2 (
	.clk( clk ),
	.clken( !memory_controller_waitrequest ),
	.address_a( param2_address_a ),
	.address_b( param2_address_b ),
	.wren_a( param2_write_enable_a ),
	.wren_b( param2_write_enable_b ),
	.data_a( param2_in_a ),
	.data_b( param2_in_b ),
	.byteena_a( 1'b1 ),
	.byteena_b( 1'b1 ),
	.q_a( param2_out_a ),
	.q_b( param2_out_b)
);
defparam param2.width_a = 32;
defparam param2.width_b = 32;
defparam param2.widthad_a = 10;
defparam param2.widthad_b = 10;
defparam param2.width_be_a = 1;
defparam param2.width_be_b = 1;
defparam param2.numwords_a = 784;
defparam param2.numwords_b = 784;
defparam param2.latency = ram_latency;
defparam param2.init_file = "param2.mif";

reg [12:0] param1_address_a;
reg [12:0] param1_address_b;
reg param1_write_enable_a;
reg param1_write_enable_b;
reg [31:0] param1_in_a;
reg [31:0] param1_in_b;
wire [31:0] param1_out_a;
wire [31:0] param1_out_b;

// @param1 = internal global [784 x [10 x float]] zeroinitializer, align 8
ram_dual_port param1 (
	.clk( clk ),
	.clken( !memory_controller_waitrequest ),
	.address_a( param1_address_a ),
	.address_b( param1_address_b ),
	.wren_a( param1_write_enable_a ),
	.wren_b( param1_write_enable_b ),
	.data_a( param1_in_a ),
	.data_b( param1_in_b ),
	.byteena_a( 1'b1 ),
	.byteena_b( 1'b1 ),
	.q_a( param1_out_a ),
	.q_b( param1_out_b)
);
defparam param1.width_a = 32;
defparam param1.width_b = 32;
defparam param1.widthad_a = 13;
defparam param1.widthad_b = 13;
defparam param1.width_be_a = 1;
defparam param1.width_be_b = 1;
defparam param1.numwords_a = 7840;
defparam param1.numwords_b = 7840;
defparam param1.latency = ram_latency;
defparam param1.init_file = "param1.mif";

reg [3:0] param0_address_a;
reg [3:0] param0_address_b;
reg param0_write_enable_a;
reg param0_write_enable_b;
reg [31:0] param0_in_a;
reg [31:0] param0_in_b;
wire [31:0] param0_out_a;
wire [31:0] param0_out_b;

// @param0 = internal global [10 x float] zeroinitializer, align 8
ram_dual_port param0 (
	.clk( clk ),
	.clken( !memory_controller_waitrequest ),
	.address_a( param0_address_a ),
	.address_b( param0_address_b ),
	.wren_a( param0_write_enable_a ),
	.wren_b( param0_write_enable_b ),
	.data_a( param0_in_a ),
	.data_b( param0_in_b ),
	.byteena_a( 1'b1 ),
	.byteena_b( 1'b1 ),
	.q_a( param0_out_a ),
	.q_b( param0_out_b)
);
defparam param0.width_a = 32;
defparam param0.width_b = 32;
defparam param0.widthad_a = 4;
defparam param0.widthad_b = 4;
defparam param0.width_be_a = 1;
defparam param0.width_be_b = 1;
defparam param0.numwords_a = 10;
defparam param0.numwords_b = 10;
defparam param0.latency = ram_latency;
defparam param0.init_file = "param0.mif";

reg [0:0] ln2HI31_address_a;
reg [0:0] ln2HI31_address_b;
reg ln2HI31_write_enable_a;
reg ln2HI31_write_enable_b;
reg [31:0] ln2HI31_in_a;
reg [31:0] ln2HI31_in_b;
wire [31:0] ln2HI31_out_a;
wire [31:0] ln2HI31_out_b;

// @ln2HI31 = internal unnamed_addr constant [2 x float] [float 0x3FE62E3000000000, float 0xBFE62E3000000000], align 4
rom_dual_port ln2HI31 (
	.clk( clk ),
	.clken( !memory_controller_waitrequest ),
	.address_a( ln2HI31_address_a ),
	.address_b( ln2HI31_address_b ),
	.q_a( ln2HI31_out_a ),
	.q_b( ln2HI31_out_b)
);
defparam ln2HI31.width_a = 32;
defparam ln2HI31.width_b = 32;
defparam ln2HI31.widthad_a = 1;
defparam ln2HI31.widthad_b = 1;
defparam ln2HI31.numwords_a = 2;
defparam ln2HI31.numwords_b = 2;
defparam ln2HI31.latency = ram_latency;
defparam ln2HI31.init_file = "ln2HI31.mif";

reg [0:0] ln2LO32_address_a;
reg [0:0] ln2LO32_address_b;
reg ln2LO32_write_enable_a;
reg ln2LO32_write_enable_b;
reg [31:0] ln2LO32_in_a;
reg [31:0] ln2LO32_in_b;
wire [31:0] ln2LO32_out_a;
wire [31:0] ln2LO32_out_b;

// @ln2LO32 = internal unnamed_addr constant [2 x float] [float 0x3EE2FEFA20000000, float 0xBEE2FEFA20000000], align 4
rom_dual_port ln2LO32 (
	.clk( clk ),
	.clken( !memory_controller_waitrequest ),
	.address_a( ln2LO32_address_a ),
	.address_b( ln2LO32_address_b ),
	.q_a( ln2LO32_out_a ),
	.q_b( ln2LO32_out_b)
);
defparam ln2LO32.width_a = 32;
defparam ln2LO32.width_b = 32;
defparam ln2LO32.widthad_a = 1;
defparam ln2LO32.widthad_b = 1;
defparam ln2LO32.numwords_a = 2;
defparam ln2LO32.numwords_b = 2;
defparam ln2LO32.latency = ram_latency;
defparam ln2LO32.init_file = "ln2LO32.mif";

reg [0:0] halF33_address_a;
reg [0:0] halF33_address_b;
reg halF33_write_enable_a;
reg halF33_write_enable_b;
reg [31:0] halF33_in_a;
reg [31:0] halF33_in_b;
wire [31:0] halF33_out_a;
wire [31:0] halF33_out_b;

// @halF33 = internal unnamed_addr constant [2 x float] [float 5.000000e-01, float -5.000000e-01], align 4
rom_dual_port halF33 (
	.clk( clk ),
	.clken( !memory_controller_waitrequest ),
	.address_a( halF33_address_a ),
	.address_b( halF33_address_b ),
	.q_a( halF33_out_a ),
	.q_b( halF33_out_b)
);
defparam halF33.width_a = 32;
defparam halF33.width_b = 32;
defparam halF33.widthad_a = 1;
defparam halF33.widthad_b = 1;
defparam halF33.numwords_a = 2;
defparam halF33.numwords_b = 2;
defparam halF33.latency = ram_latency;
defparam halF33.init_file = "halF33.mif";
wire [`MEMORY_CONTROLLER_TAG_SIZE-1:0] tag_a;
assign tag_a = memory_controller_address_a[`MEMORY_CONTROLLER_ADDR_SIZE-1:`MEMORY_CONTROLLER_ADDR_SIZE-`MEMORY_CONTROLLER_TAG_SIZE];
reg [2:0] prevAddr_a;
reg [1:0] prevSize_a;
reg [2:0] prevSize_a_and;

always @(posedge clk)
if (!memory_controller_waitrequest)
begin
	prevAddr_a <= memory_controller_address_a[2:0];
	prevSize_a <= memory_controller_size_a;
end
wire [`MEMORY_CONTROLLER_TAG_SIZE-1:0] tag_b;
assign tag_b = memory_controller_address_b[`MEMORY_CONTROLLER_ADDR_SIZE-1:`MEMORY_CONTROLLER_ADDR_SIZE-`MEMORY_CONTROLLER_TAG_SIZE];
reg [2:0] prevAddr_b;
reg [1:0] prevSize_b;
reg [2:0] prevSize_b_and;

always @(posedge clk)
if (!memory_controller_waitrequest)
begin
	prevAddr_b <= memory_controller_address_b[2:0];
	prevSize_b <= memory_controller_size_b;
end

reg [2:0] select_not_struct_a;

wire select_temp3_a;
assign select_temp3_a = (tag_a == `TAG_g_temp3);
reg [ram_latency:0] select_temp3_reg_a;
wire [31:0] memory_controller_temp3_out_a;
assign memory_controller_temp3_out_a = {32{ select_temp3_reg_a[ram_latency]}} & temp3_out_a;

wire select_temp1_a;
assign select_temp1_a = (tag_a == `TAG_g_temp1);
reg [ram_latency:0] select_temp1_reg_a;
wire [31:0] memory_controller_temp1_out_a;
assign memory_controller_temp1_out_a = {32{ select_temp1_reg_a[ram_latency]}} & temp1_out_a;

wire select_temp0_a;
assign select_temp0_a = (tag_a == `TAG_g_temp0);
reg [ram_latency:0] select_temp0_reg_a;
wire [31:0] memory_controller_temp0_out_a;
assign memory_controller_temp0_out_a = {32{ select_temp0_reg_a[ram_latency]}} & temp0_out_a;

wire select_param2_a;
assign select_param2_a = (tag_a == `TAG_g_param2);
reg [ram_latency:0] select_param2_reg_a;
wire [31:0] memory_controller_param2_out_a;
assign memory_controller_param2_out_a = {32{ select_param2_reg_a[ram_latency]}} & param2_out_a;

wire select_param1_a;
assign select_param1_a = (tag_a == `TAG_g_param1);
reg [ram_latency:0] select_param1_reg_a;
wire [31:0] memory_controller_param1_out_a;
assign memory_controller_param1_out_a = {32{ select_param1_reg_a[ram_latency]}} & param1_out_a;

wire select_param0_a;
assign select_param0_a = (tag_a == `TAG_g_param0);
reg [ram_latency:0] select_param0_reg_a;
wire [31:0] memory_controller_param0_out_a;
assign memory_controller_param0_out_a = {32{ select_param0_reg_a[ram_latency]}} & param0_out_a;

wire select_ln2HI31_a;
assign select_ln2HI31_a = (tag_a == `TAG_g_ln2HI31);
reg [ram_latency:0] select_ln2HI31_reg_a;
wire [31:0] memory_controller_ln2HI31_out_a;
assign memory_controller_ln2HI31_out_a = {32{ select_ln2HI31_reg_a[ram_latency]}} & ln2HI31_out_a;

wire select_ln2LO32_a;
assign select_ln2LO32_a = (tag_a == `TAG_g_ln2LO32);
reg [ram_latency:0] select_ln2LO32_reg_a;
wire [31:0] memory_controller_ln2LO32_out_a;
assign memory_controller_ln2LO32_out_a = {32{ select_ln2LO32_reg_a[ram_latency]}} & ln2LO32_out_a;

wire select_halF33_a;
assign select_halF33_a = (tag_a == `TAG_g_halF33);
reg [ram_latency:0] select_halF33_reg_a;
wire [31:0] memory_controller_halF33_out_a;
assign memory_controller_halF33_out_a = {32{ select_halF33_reg_a[ram_latency]}} & halF33_out_a;

always @(*)
begin
	temp3_address_a = memory_controller_address_a [4-1+2:2] & {4{select_temp3_a}};
	temp3_write_enable_a = memory_controller_write_enable_a & select_temp3_a;
	temp3_in_a [32-1:0] = memory_controller_in_a[32-1:0];

	temp1_address_a = memory_controller_address_a [4-1+2:2] & {4{select_temp1_a}};
	temp1_write_enable_a = memory_controller_write_enable_a & select_temp1_a;
	temp1_in_a [32-1:0] = memory_controller_in_a[32-1:0];

	temp0_address_a = memory_controller_address_a [4-1+2:2] & {4{select_temp0_a}};
	temp0_write_enable_a = memory_controller_write_enable_a & select_temp0_a;
	temp0_in_a [32-1:0] = memory_controller_in_a[32-1:0];

	param2_address_a = memory_controller_address_a [10-1+2:2] & {10{select_param2_a}};
	param2_write_enable_a = memory_controller_write_enable_a & select_param2_a;
	param2_in_a [32-1:0] = memory_controller_in_a[32-1:0];

	param1_address_a = memory_controller_address_a [13-1+2:2] & {13{select_param1_a}};
	param1_write_enable_a = memory_controller_write_enable_a & select_param1_a;
	param1_in_a [32-1:0] = memory_controller_in_a[32-1:0];

	param0_address_a = memory_controller_address_a [4-1+2:2] & {4{select_param0_a}};
	param0_write_enable_a = memory_controller_write_enable_a & select_param0_a;
	param0_in_a [32-1:0] = memory_controller_in_a[32-1:0];

	ln2HI31_address_a = memory_controller_address_a [1-1+2:2] & {1{select_ln2HI31_a}};
	ln2HI31_write_enable_a = memory_controller_write_enable_a & select_ln2HI31_a;
	ln2HI31_in_a [32-1:0] = memory_controller_in_a[32-1:0];

	ln2LO32_address_a = memory_controller_address_a [1-1+2:2] & {1{select_ln2LO32_a}};
	ln2LO32_write_enable_a = memory_controller_write_enable_a & select_ln2LO32_a;
	ln2LO32_in_a [32-1:0] = memory_controller_in_a[32-1:0];

	halF33_address_a = memory_controller_address_a [1-1+2:2] & {1{select_halF33_a}};
	halF33_write_enable_a = memory_controller_write_enable_a & select_halF33_a;
	halF33_in_a [32-1:0] = memory_controller_in_a[32-1:0];

end
always @(*)
begin
	select_not_struct_a [2:0] = 3'b0 | {2{select_temp3_reg_a[ram_latency]}} | {2{select_temp1_reg_a[ram_latency]}} | {2{select_temp0_reg_a[ram_latency]}} | {2{select_param2_reg_a[ram_latency]}} | {2{select_param1_reg_a[ram_latency]}} | {2{select_param0_reg_a[ram_latency]}} | {2{select_ln2HI31_reg_a[ram_latency]}} | {2{select_ln2LO32_reg_a[ram_latency]}} | {2{select_halF33_reg_a[ram_latency]}};
	if (prevAddr_a[2:0] & select_not_struct_a[2:0] != 0 && memory_controller_enable_a)
	begin
		$display("Error: memory address not aligned to ram word size!");
		$finish;
	end

	prevSize_a_and[0] = prevSize_a[1] | prevSize_a[0];
	prevSize_a_and[1] = prevSize_a[1];
	prevSize_a_and[2] = prevSize_a[1] & prevSize_a[0];
	if ((prevAddr_a & prevSize_a_and) != 0 && memory_controller_enable_a)
	begin
		$display("Error: memory address not aligned to ram word size!");
		$finish;
	end
	memory_controller_out_prev_a = memory_controller_out_reg_a & { 64{!memory_controller_enable_reg_a}};
	memory_controller_out_a = 1'b0 | memory_controller_out_prev_a | memory_controller_temp3_out_a | memory_controller_temp1_out_a | memory_controller_temp0_out_a | memory_controller_param2_out_a | memory_controller_param1_out_a | memory_controller_param0_out_a | memory_controller_ln2HI31_out_a | memory_controller_ln2LO32_out_a | memory_controller_halF33_out_a;
end

always @(posedge clk)
if (!memory_controller_waitrequest)
begin
memory_controller_out_reg_a <= memory_controller_out_a;
memory_controller_enable_reg_a <= memory_controller_enable_a;
end

always @(posedge clk)
if (!memory_controller_waitrequest)
for (j = 0; j < ram_latency; j=j+1)
begin
select_temp3_reg_a[j+1] <= select_temp3_reg_a[j];
select_temp1_reg_a[j+1] <= select_temp1_reg_a[j];
select_temp0_reg_a[j+1] <= select_temp0_reg_a[j];
select_param2_reg_a[j+1] <= select_param2_reg_a[j];
select_param1_reg_a[j+1] <= select_param1_reg_a[j];
select_param0_reg_a[j+1] <= select_param0_reg_a[j];
select_ln2HI31_reg_a[j+1] <= select_ln2HI31_reg_a[j];
select_ln2LO32_reg_a[j+1] <= select_ln2LO32_reg_a[j];
select_halF33_reg_a[j+1] <= select_halF33_reg_a[j];
end
always @(*)
begin
select_temp3_reg_a[0] <= select_temp3_a;
select_temp1_reg_a[0] <= select_temp1_a;
select_temp0_reg_a[0] <= select_temp0_a;
select_param2_reg_a[0] <= select_param2_a;
select_param1_reg_a[0] <= select_param1_a;
select_param0_reg_a[0] <= select_param0_a;
select_ln2HI31_reg_a[0] <= select_ln2HI31_a;
select_ln2LO32_reg_a[0] <= select_ln2LO32_a;
select_halF33_reg_a[0] <= select_halF33_a;
end

reg [2:0] select_not_struct_b;

wire select_temp3_b;
assign select_temp3_b = (tag_b == `TAG_g_temp3);
reg [ram_latency:0] select_temp3_reg_b;
wire [31:0] memory_controller_temp3_out_b;
assign memory_controller_temp3_out_b = {32{ select_temp3_reg_b[ram_latency]}} & temp3_out_b;

wire select_temp1_b;
assign select_temp1_b = (tag_b == `TAG_g_temp1);
reg [ram_latency:0] select_temp1_reg_b;
wire [31:0] memory_controller_temp1_out_b;
assign memory_controller_temp1_out_b = {32{ select_temp1_reg_b[ram_latency]}} & temp1_out_b;

wire select_temp0_b;
assign select_temp0_b = (tag_b == `TAG_g_temp0);
reg [ram_latency:0] select_temp0_reg_b;
wire [31:0] memory_controller_temp0_out_b;
assign memory_controller_temp0_out_b = {32{ select_temp0_reg_b[ram_latency]}} & temp0_out_b;

wire select_param2_b;
assign select_param2_b = (tag_b == `TAG_g_param2);
reg [ram_latency:0] select_param2_reg_b;
wire [31:0] memory_controller_param2_out_b;
assign memory_controller_param2_out_b = {32{ select_param2_reg_b[ram_latency]}} & param2_out_b;

wire select_param1_b;
assign select_param1_b = (tag_b == `TAG_g_param1);
reg [ram_latency:0] select_param1_reg_b;
wire [31:0] memory_controller_param1_out_b;
assign memory_controller_param1_out_b = {32{ select_param1_reg_b[ram_latency]}} & param1_out_b;

wire select_param0_b;
assign select_param0_b = (tag_b == `TAG_g_param0);
reg [ram_latency:0] select_param0_reg_b;
wire [31:0] memory_controller_param0_out_b;
assign memory_controller_param0_out_b = {32{ select_param0_reg_b[ram_latency]}} & param0_out_b;

wire select_ln2HI31_b;
assign select_ln2HI31_b = (tag_b == `TAG_g_ln2HI31);
reg [ram_latency:0] select_ln2HI31_reg_b;
wire [31:0] memory_controller_ln2HI31_out_b;
assign memory_controller_ln2HI31_out_b = {32{ select_ln2HI31_reg_b[ram_latency]}} & ln2HI31_out_b;

wire select_ln2LO32_b;
assign select_ln2LO32_b = (tag_b == `TAG_g_ln2LO32);
reg [ram_latency:0] select_ln2LO32_reg_b;
wire [31:0] memory_controller_ln2LO32_out_b;
assign memory_controller_ln2LO32_out_b = {32{ select_ln2LO32_reg_b[ram_latency]}} & ln2LO32_out_b;

wire select_halF33_b;
assign select_halF33_b = (tag_b == `TAG_g_halF33);
reg [ram_latency:0] select_halF33_reg_b;
wire [31:0] memory_controller_halF33_out_b;
assign memory_controller_halF33_out_b = {32{ select_halF33_reg_b[ram_latency]}} & halF33_out_b;

always @(*)
begin
	temp3_address_b = memory_controller_address_b [4-1+2:2] & {4{select_temp3_b}};
	temp3_write_enable_b = memory_controller_write_enable_b & select_temp3_b;
	temp3_in_b [32-1:0] = memory_controller_in_b[32-1:0];

	temp1_address_b = memory_controller_address_b [4-1+2:2] & {4{select_temp1_b}};
	temp1_write_enable_b = memory_controller_write_enable_b & select_temp1_b;
	temp1_in_b [32-1:0] = memory_controller_in_b[32-1:0];

	temp0_address_b = memory_controller_address_b [4-1+2:2] & {4{select_temp0_b}};
	temp0_write_enable_b = memory_controller_write_enable_b & select_temp0_b;
	temp0_in_b [32-1:0] = memory_controller_in_b[32-1:0];

	param2_address_b = memory_controller_address_b [10-1+2:2] & {10{select_param2_b}};
	param2_write_enable_b = memory_controller_write_enable_b & select_param2_b;
	param2_in_b [32-1:0] = memory_controller_in_b[32-1:0];

	param1_address_b = memory_controller_address_b [13-1+2:2] & {13{select_param1_b}};
	param1_write_enable_b = memory_controller_write_enable_b & select_param1_b;
	param1_in_b [32-1:0] = memory_controller_in_b[32-1:0];

	param0_address_b = memory_controller_address_b [4-1+2:2] & {4{select_param0_b}};
	param0_write_enable_b = memory_controller_write_enable_b & select_param0_b;
	param0_in_b [32-1:0] = memory_controller_in_b[32-1:0];

	ln2HI31_address_b = memory_controller_address_b [1-1+2:2] & {1{select_ln2HI31_b}};
	ln2HI31_write_enable_b = memory_controller_write_enable_b & select_ln2HI31_b;
	ln2HI31_in_b [32-1:0] = memory_controller_in_b[32-1:0];

	ln2LO32_address_b = memory_controller_address_b [1-1+2:2] & {1{select_ln2LO32_b}};
	ln2LO32_write_enable_b = memory_controller_write_enable_b & select_ln2LO32_b;
	ln2LO32_in_b [32-1:0] = memory_controller_in_b[32-1:0];

	halF33_address_b = memory_controller_address_b [1-1+2:2] & {1{select_halF33_b}};
	halF33_write_enable_b = memory_controller_write_enable_b & select_halF33_b;
	halF33_in_b [32-1:0] = memory_controller_in_b[32-1:0];

end
always @(*)
begin
	select_not_struct_b [2:0] = 3'b0 | {2{select_temp3_reg_b[ram_latency]}} | {2{select_temp1_reg_b[ram_latency]}} | {2{select_temp0_reg_b[ram_latency]}} | {2{select_param2_reg_b[ram_latency]}} | {2{select_param1_reg_b[ram_latency]}} | {2{select_param0_reg_b[ram_latency]}} | {2{select_ln2HI31_reg_b[ram_latency]}} | {2{select_ln2LO32_reg_b[ram_latency]}} | {2{select_halF33_reg_b[ram_latency]}};
	if (prevAddr_b[2:0] & select_not_struct_b[2:0] != 0 && memory_controller_enable_b)
	begin
		$display("Error: memory address not aligned to ram word size!");
		$finish;
	end

	prevSize_b_and[0] = prevSize_b[1] | prevSize_b[0];
	prevSize_b_and[1] = prevSize_b[1];
	prevSize_b_and[2] = prevSize_b[1] & prevSize_b[0];
	if ((prevAddr_b & prevSize_b_and) != 0 && memory_controller_enable_b)
	begin
		$display("Error: memory address not aligned to ram word size!");
		$finish;
	end
	memory_controller_out_prev_b = memory_controller_out_reg_b & { 64{!memory_controller_enable_reg_b}};
	memory_controller_out_b = 1'b0 | memory_controller_out_prev_b | memory_controller_temp3_out_b | memory_controller_temp1_out_b | memory_controller_temp0_out_b | memory_controller_param2_out_b | memory_controller_param1_out_b | memory_controller_param0_out_b | memory_controller_ln2HI31_out_b | memory_controller_ln2LO32_out_b | memory_controller_halF33_out_b;
end

always @(posedge clk)
if (!memory_controller_waitrequest)
begin
memory_controller_out_reg_b <= memory_controller_out_b;
memory_controller_enable_reg_b <= memory_controller_enable_b;
end

always @(posedge clk)
if (!memory_controller_waitrequest)
for (j = 0; j < ram_latency; j=j+1)
begin
select_temp3_reg_b[j+1] <= select_temp3_reg_b[j];
select_temp1_reg_b[j+1] <= select_temp1_reg_b[j];
select_temp0_reg_b[j+1] <= select_temp0_reg_b[j];
select_param2_reg_b[j+1] <= select_param2_reg_b[j];
select_param1_reg_b[j+1] <= select_param1_reg_b[j];
select_param0_reg_b[j+1] <= select_param0_reg_b[j];
select_ln2HI31_reg_b[j+1] <= select_ln2HI31_reg_b[j];
select_ln2LO32_reg_b[j+1] <= select_ln2LO32_reg_b[j];
select_halF33_reg_b[j+1] <= select_halF33_reg_b[j];
end
always @(*)
begin
select_temp3_reg_b[0] <= select_temp3_b;
select_temp1_reg_b[0] <= select_temp1_b;
select_temp0_reg_b[0] <= select_temp0_b;
select_param2_reg_b[0] <= select_param2_b;
select_param1_reg_b[0] <= select_param1_b;
select_param0_reg_b[0] <= select_param0_b;
select_ln2HI31_reg_b[0] <= select_ln2HI31_b;
select_ln2LO32_reg_b[0] <= select_ln2LO32_b;
select_halF33_reg_b[0] <= select_halF33_b;
end

endmodule 

`timescale 1 ns / 1 ns
module main
(
	clk,
	clk2x,
	clk1x_follower,
	reset,
	start,
	finish,
	memory_controller_waitrequest,
	memory_controller_enable_a,
	memory_controller_address_a,
	memory_controller_write_enable_a,
	memory_controller_in_a,
	memory_controller_size_a,
	memory_controller_out_a,
	memory_controller_enable_b,
	memory_controller_address_b,
	memory_controller_write_enable_b,
	memory_controller_in_b,
	memory_controller_size_b,
	memory_controller_out_b,
	return_val
);

parameter [9:0] LEGUP_0 = 10'd0;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreductionlrph_1 = 10'd1;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_2 = 10'd2;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_3 = 10'd3;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_4 = 10'd4;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_5 = 10'd5;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_6 = 10'd6;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_7 = 10'd7;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_8 = 10'd8;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_9 = 10'd9;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_10 = 10'd10;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_11 = 10'd11;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_12 = 10'd12;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_13 = 10'd13;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_14 = 10'd14;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_15 = 10'd15;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_16 = 10'd16;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_17 = 10'd17;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_18 = 10'd18;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_19 = 10'd19;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_20 = 10'd20;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_21 = 10'd21;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_22 = 10'd22;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_23 = 10'd23;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_24 = 10'd24;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_25 = 10'd25;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_26 = 10'd26;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_27 = 10'd27;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_28 = 10'd28;
parameter [9:0] LEGUP_F_main_BB_dotloop_bodyreduction_29 = 10'd29;
parameter [9:0] LEGUP_F_main_BB_dotloop_exitreduction_30 = 10'd30;
parameter [9:0] LEGUP_F_main_BB_dotloop_exitreduction_31 = 10'd31;
parameter [9:0] LEGUP_F_main_BB_fusion2loop_bodydim1preheader_32 = 10'd32;
parameter [9:0] LEGUP_F_main_BB_fusion2loop_bodydim1_33 = 10'd33;
parameter [9:0] LEGUP_F_main_BB_fusion2loop_bodydim1_34 = 10'd34;
parameter [9:0] LEGUP_F_main_BB_fusion2loop_bodydim1_35 = 10'd35;
parameter [9:0] LEGUP_F_main_BB_fusion2loop_bodydim1_36 = 10'd36;
parameter [9:0] LEGUP_F_main_BB_fusion2loop_bodydim1_37 = 10'd37;
parameter [9:0] LEGUP_F_main_BB_fusion2loop_bodydim1_38 = 10'd38;
parameter [9:0] LEGUP_F_main_BB_fusion2loop_bodydim1_39 = 10'd39;
parameter [9:0] LEGUP_F_main_BB_fusion2loop_bodydim1_40 = 10'd40;
parameter [9:0] LEGUP_F_main_BB_fusion2loop_bodydim1_41 = 10'd41;
parameter [9:0] LEGUP_F_main_BB_fusion2loop_bodydim1_42 = 10'd42;
parameter [9:0] LEGUP_F_main_BB_fusion2loop_bodydim1_43 = 10'd43;
parameter [9:0] LEGUP_F_main_BB_fusion2loop_bodydim1_44 = 10'd44;
parameter [9:0] LEGUP_F_main_BB_fusion2loop_bodydim1_45 = 10'd45;
parameter [9:0] LEGUP_F_main_BB_fusion2loop_bodydim1_46 = 10'd46;
parameter [9:0] LEGUP_F_main_BB_fusion2loop_bodydim1_47 = 10'd47;
parameter [9:0] LEGUP_F_main_BB_fusion2loop_bodydim1_48 = 10'd48;
parameter [9:0] LEGUP_F_main_BB_fusion2loop_bodydim1_49 = 10'd49;
parameter [9:0] LEGUP_F_main_BB_fusion2loop_bodydim1_50 = 10'd50;
parameter [9:0] LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1preheader_51 = 10'd51;
parameter [9:0] LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_52 = 10'd52;
parameter [9:0] LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_53 = 10'd53;
parameter [9:0] LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_54 = 10'd54;
parameter [9:0] LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_55 = 10'd55;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1preheader_56 = 10'd56;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_57 = 10'd57;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_58 = 10'd58;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_59 = 10'd59;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_60 = 10'd60;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_61 = 10'd61;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_62 = 10'd62;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_63 = 10'd63;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_64 = 10'd64;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_65 = 10'd65;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_66 = 10'd66;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_67 = 10'd67;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_68 = 10'd68;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_69 = 10'd69;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_70 = 10'd70;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_71 = 10'd71;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_72 = 10'd72;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_73 = 10'd73;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_74 = 10'd74;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_75 = 10'd75;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_76 = 10'd76;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_77 = 10'd77;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_78 = 10'd78;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_79 = 10'd79;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_80 = 10'd80;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_81 = 10'd81;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_82 = 10'd82;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_83 = 10'd83;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_84 = 10'd84;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_85 = 10'd85;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_86 = 10'd86;
parameter [9:0] LEGUP_F_main_BB_fusion1loop_bodydim1_87 = 10'd87;
parameter [9:0] LEGUP_F_main_BB__26_88 = 10'd88;
parameter [9:0] LEGUP_F_main_BB__26_89 = 10'd89;
parameter [9:0] LEGUP_F_main_BB__26_90 = 10'd90;
parameter [9:0] LEGUP_F_main_BB__26_91 = 10'd91;
parameter [9:0] LEGUP_F_main_BB__26_92 = 10'd92;
parameter [9:0] LEGUP_F_main_BB__26_93 = 10'd93;
parameter [9:0] LEGUP_F_main_BB__26_94 = 10'd94;
parameter [9:0] LEGUP_F_main_BB__26_95 = 10'd95;
parameter [9:0] LEGUP_F_main_BB__26_96 = 10'd96;
parameter [9:0] LEGUP_F_main_BB__26_97 = 10'd97;
parameter [9:0] LEGUP_F_main_BB__26_98 = 10'd98;
parameter [9:0] LEGUP_F_main_BB__26_99 = 10'd99;
parameter [9:0] LEGUP_F_main_BB__26_100 = 10'd100;
parameter [9:0] LEGUP_F_main_BB__26_101 = 10'd101;
parameter [9:0] LEGUP_F_main_BB__26_102 = 10'd102;
parameter [9:0] LEGUP_F_main_BB__28_103 = 10'd103;
parameter [9:0] LEGUP_F_main_BB__30_104 = 10'd104;
parameter [9:0] LEGUP_F_main_BB__32_105 = 10'd105;
parameter [9:0] LEGUP_F_main_BB__34_106 = 10'd106;
parameter [9:0] LEGUP_F_main_BB_threadpresplit_107 = 10'd107;
parameter [9:0] LEGUP_F_main_BB__38_108 = 10'd108;
parameter [9:0] LEGUP_F_main_BB__40_109 = 10'd109;
parameter [9:0] LEGUP_F_main_BB__40_110 = 10'd110;
parameter [9:0] LEGUP_F_main_BB__40_111 = 10'd111;
parameter [9:0] LEGUP_F_main_BB__48_112 = 10'd112;
parameter [9:0] LEGUP_F_main_BB__48_113 = 10'd113;
parameter [9:0] LEGUP_F_main_BB__48_114 = 10'd114;
parameter [9:0] LEGUP_F_main_BB__48_115 = 10'd115;
parameter [9:0] LEGUP_F_main_BB__48_116 = 10'd116;
parameter [9:0] LEGUP_F_main_BB__48_117 = 10'd117;
parameter [9:0] LEGUP_F_main_BB__48_118 = 10'd118;
parameter [9:0] LEGUP_F_main_BB__48_119 = 10'd119;
parameter [9:0] LEGUP_F_main_BB__48_120 = 10'd120;
parameter [9:0] LEGUP_F_main_BB__48_121 = 10'd121;
parameter [9:0] LEGUP_F_main_BB__48_122 = 10'd122;
parameter [9:0] LEGUP_F_main_BB__48_123 = 10'd123;
parameter [9:0] LEGUP_F_main_BB__48_124 = 10'd124;
parameter [9:0] LEGUP_F_main_BB__48_125 = 10'd125;
parameter [9:0] LEGUP_F_main_BB__48_126 = 10'd126;
parameter [9:0] LEGUP_F_main_BB__48_127 = 10'd127;
parameter [9:0] LEGUP_F_main_BB__48_128 = 10'd128;
parameter [9:0] LEGUP_F_main_BB__48_129 = 10'd129;
parameter [9:0] LEGUP_F_main_BB__48_130 = 10'd130;
parameter [9:0] LEGUP_F_main_BB__48_131 = 10'd131;
parameter [9:0] LEGUP_F_main_BB__48_132 = 10'd132;
parameter [9:0] LEGUP_F_main_BB__48_133 = 10'd133;
parameter [9:0] LEGUP_F_main_BB__48_134 = 10'd134;
parameter [9:0] LEGUP_F_main_BB__48_135 = 10'd135;
parameter [9:0] LEGUP_F_main_BB__48_136 = 10'd136;
parameter [9:0] LEGUP_F_main_BB__48_137 = 10'd137;
parameter [9:0] LEGUP_F_main_BB__48_138 = 10'd138;
parameter [9:0] LEGUP_F_main_BB__48_139 = 10'd139;
parameter [9:0] LEGUP_F_main_BB__48_140 = 10'd140;
parameter [9:0] LEGUP_F_main_BB__48_141 = 10'd141;
parameter [9:0] LEGUP_F_main_BB__48_142 = 10'd142;
parameter [9:0] LEGUP_F_main_BB__48_143 = 10'd143;
parameter [9:0] LEGUP_F_main_BB__48_144 = 10'd144;
parameter [9:0] LEGUP_F_main_BB__48_145 = 10'd145;
parameter [9:0] LEGUP_F_main_BB__48_146 = 10'd146;
parameter [9:0] LEGUP_F_main_BB__48_147 = 10'd147;
parameter [9:0] LEGUP_F_main_BB__48_148 = 10'd148;
parameter [9:0] LEGUP_F_main_BB__48_149 = 10'd149;
parameter [9:0] LEGUP_F_main_BB__48_150 = 10'd150;
parameter [9:0] LEGUP_F_main_BB__48_151 = 10'd151;
parameter [9:0] LEGUP_F_main_BB__48_152 = 10'd152;
parameter [9:0] LEGUP_F_main_BB__48_153 = 10'd153;
parameter [9:0] LEGUP_F_main_BB__48_154 = 10'd154;
parameter [9:0] LEGUP_F_main_BB__48_155 = 10'd155;
parameter [9:0] LEGUP_F_main_BB__48_156 = 10'd156;
parameter [9:0] LEGUP_F_main_BB__48_157 = 10'd157;
parameter [9:0] LEGUP_F_main_BB__48_158 = 10'd158;
parameter [9:0] LEGUP_F_main_BB__48_159 = 10'd159;
parameter [9:0] LEGUP_F_main_BB__48_160 = 10'd160;
parameter [9:0] LEGUP_F_main_BB__48_161 = 10'd161;
parameter [9:0] LEGUP_F_main_BB__58_162 = 10'd162;
parameter [9:0] LEGUP_F_main_BB__58_163 = 10'd163;
parameter [9:0] LEGUP_F_main_BB__58_164 = 10'd164;
parameter [9:0] LEGUP_F_main_BB__58_165 = 10'd165;
parameter [9:0] LEGUP_F_main_BB__58_166 = 10'd166;
parameter [9:0] LEGUP_F_main_BB__58_167 = 10'd167;
parameter [9:0] LEGUP_F_main_BB__58_168 = 10'd168;
parameter [9:0] LEGUP_F_main_BB__58_169 = 10'd169;
parameter [9:0] LEGUP_F_main_BB__58_170 = 10'd170;
parameter [9:0] LEGUP_F_main_BB__58_171 = 10'd171;
parameter [9:0] LEGUP_F_main_BB__58_172 = 10'd172;
parameter [9:0] LEGUP_F_main_BB__58_173 = 10'd173;
parameter [9:0] LEGUP_F_main_BB__58_174 = 10'd174;
parameter [9:0] LEGUP_F_main_BB__58_175 = 10'd175;
parameter [9:0] LEGUP_F_main_BB__58_176 = 10'd176;
parameter [9:0] LEGUP_F_main_BB__58_177 = 10'd177;
parameter [9:0] LEGUP_F_main_BB__58_178 = 10'd178;
parameter [9:0] LEGUP_F_main_BB__58_179 = 10'd179;
parameter [9:0] LEGUP_F_main_BB__58_180 = 10'd180;
parameter [9:0] LEGUP_F_main_BB__58_181 = 10'd181;
parameter [9:0] LEGUP_F_main_BB__58_182 = 10'd182;
parameter [9:0] LEGUP_F_main_BB__58_183 = 10'd183;
parameter [9:0] LEGUP_F_main_BB__58_184 = 10'd184;
parameter [9:0] LEGUP_F_main_BB__58_185 = 10'd185;
parameter [9:0] LEGUP_F_main_BB__58_186 = 10'd186;
parameter [9:0] LEGUP_F_main_BB__58_187 = 10'd187;
parameter [9:0] LEGUP_F_main_BB__58_188 = 10'd188;
parameter [9:0] LEGUP_F_main_BB__58_189 = 10'd189;
parameter [9:0] LEGUP_F_main_BB__58_190 = 10'd190;
parameter [9:0] LEGUP_F_main_BB__60_191 = 10'd191;
parameter [9:0] LEGUP_F_main_BB__60_192 = 10'd192;
parameter [9:0] LEGUP_F_main_BB__60_193 = 10'd193;
parameter [9:0] LEGUP_F_main_BB__60_194 = 10'd194;
parameter [9:0] LEGUP_F_main_BB__60_195 = 10'd195;
parameter [9:0] LEGUP_F_main_BB__60_196 = 10'd196;
parameter [9:0] LEGUP_F_main_BB__60_197 = 10'd197;
parameter [9:0] LEGUP_F_main_BB__60_198 = 10'd198;
parameter [9:0] LEGUP_F_main_BB__60_199 = 10'd199;
parameter [9:0] LEGUP_F_main_BB__60_200 = 10'd200;
parameter [9:0] LEGUP_F_main_BB__60_201 = 10'd201;
parameter [9:0] LEGUP_F_main_BB__60_202 = 10'd202;
parameter [9:0] LEGUP_F_main_BB__60_203 = 10'd203;
parameter [9:0] LEGUP_F_main_BB__60_204 = 10'd204;
parameter [9:0] LEGUP_F_main_BB__60_205 = 10'd205;
parameter [9:0] LEGUP_F_main_BB__60_206 = 10'd206;
parameter [9:0] LEGUP_F_main_BB__64_207 = 10'd207;
parameter [9:0] LEGUP_F_main_BB__64_208 = 10'd208;
parameter [9:0] LEGUP_F_main_BB__64_209 = 10'd209;
parameter [9:0] LEGUP_F_main_BB__64_210 = 10'd210;
parameter [9:0] LEGUP_F_main_BB__64_211 = 10'd211;
parameter [9:0] LEGUP_F_main_BB__64_212 = 10'd212;
parameter [9:0] LEGUP_F_main_BB__64_213 = 10'd213;
parameter [9:0] LEGUP_F_main_BB__64_214 = 10'd214;
parameter [9:0] LEGUP_F_main_BB__64_215 = 10'd215;
parameter [9:0] LEGUP_F_main_BB__64_216 = 10'd216;
parameter [9:0] LEGUP_F_main_BB__64_217 = 10'd217;
parameter [9:0] LEGUP_F_main_BB__64_218 = 10'd218;
parameter [9:0] LEGUP_F_main_BB__64_219 = 10'd219;
parameter [9:0] LEGUP_F_main_BB__64_220 = 10'd220;
parameter [9:0] LEGUP_F_main_BB__64_221 = 10'd221;
parameter [9:0] LEGUP_F_main_BB__66_222 = 10'd222;
parameter [9:0] LEGUP_F_main_BB__66_223 = 10'd223;
parameter [9:0] LEGUP_F_main_BB__66_224 = 10'd224;
parameter [9:0] LEGUP_F_main_BB__66_225 = 10'd225;
parameter [9:0] LEGUP_F_main_BB__66_226 = 10'd226;
parameter [9:0] LEGUP_F_main_BB__66_227 = 10'd227;
parameter [9:0] LEGUP_F_main_BB__66_228 = 10'd228;
parameter [9:0] LEGUP_F_main_BB__66_229 = 10'd229;
parameter [9:0] LEGUP_F_main_BB__66_230 = 10'd230;
parameter [9:0] LEGUP_F_main_BB__66_231 = 10'd231;
parameter [9:0] LEGUP_F_main_BB__66_232 = 10'd232;
parameter [9:0] LEGUP_F_main_BB__66_233 = 10'd233;
parameter [9:0] LEGUP_F_main_BB__66_234 = 10'd234;
parameter [9:0] LEGUP_F_main_BB__66_235 = 10'd235;
parameter [9:0] LEGUP_F_main_BB__66_236 = 10'd236;
parameter [9:0] LEGUP_F_main_BB__66_237 = 10'd237;
parameter [9:0] LEGUP_F_main_BB__66_238 = 10'd238;
parameter [9:0] LEGUP_F_main_BB__66_239 = 10'd239;
parameter [9:0] LEGUP_F_main_BB__66_240 = 10'd240;
parameter [9:0] LEGUP_F_main_BB__66_241 = 10'd241;
parameter [9:0] LEGUP_F_main_BB__66_242 = 10'd242;
parameter [9:0] LEGUP_F_main_BB__66_243 = 10'd243;
parameter [9:0] LEGUP_F_main_BB__66_244 = 10'd244;
parameter [9:0] LEGUP_F_main_BB__66_245 = 10'd245;
parameter [9:0] LEGUP_F_main_BB__66_246 = 10'd246;
parameter [9:0] LEGUP_F_main_BB__66_247 = 10'd247;
parameter [9:0] LEGUP_F_main_BB__66_248 = 10'd248;
parameter [9:0] LEGUP_F_main_BB__66_249 = 10'd249;
parameter [9:0] LEGUP_F_main_BB__66_250 = 10'd250;
parameter [9:0] LEGUP_F_main_BB__66_251 = 10'd251;
parameter [9:0] LEGUP_F_main_BB__66_252 = 10'd252;
parameter [9:0] LEGUP_F_main_BB__66_253 = 10'd253;
parameter [9:0] LEGUP_F_main_BB__66_254 = 10'd254;
parameter [9:0] LEGUP_F_main_BB__66_255 = 10'd255;
parameter [9:0] LEGUP_F_main_BB__66_256 = 10'd256;
parameter [9:0] LEGUP_F_main_BB__66_257 = 10'd257;
parameter [9:0] LEGUP_F_main_BB__66_258 = 10'd258;
parameter [9:0] LEGUP_F_main_BB__66_259 = 10'd259;
parameter [9:0] LEGUP_F_main_BB__66_260 = 10'd260;
parameter [9:0] LEGUP_F_main_BB__66_261 = 10'd261;
parameter [9:0] LEGUP_F_main_BB__66_262 = 10'd262;
parameter [9:0] LEGUP_F_main_BB__66_263 = 10'd263;
parameter [9:0] LEGUP_F_main_BB__66_264 = 10'd264;
parameter [9:0] LEGUP_F_main_BB__66_265 = 10'd265;
parameter [9:0] LEGUP_F_main_BB__66_266 = 10'd266;
parameter [9:0] LEGUP_F_main_BB__66_267 = 10'd267;
parameter [9:0] LEGUP_F_main_BB__66_268 = 10'd268;
parameter [9:0] LEGUP_F_main_BB__66_269 = 10'd269;
parameter [9:0] LEGUP_F_main_BB__66_270 = 10'd270;
parameter [9:0] LEGUP_F_main_BB__66_271 = 10'd271;
parameter [9:0] LEGUP_F_main_BB__66_272 = 10'd272;
parameter [9:0] LEGUP_F_main_BB__66_273 = 10'd273;
parameter [9:0] LEGUP_F_main_BB__66_274 = 10'd274;
parameter [9:0] LEGUP_F_main_BB__66_275 = 10'd275;
parameter [9:0] LEGUP_F_main_BB__66_276 = 10'd276;
parameter [9:0] LEGUP_F_main_BB__66_277 = 10'd277;
parameter [9:0] LEGUP_F_main_BB__66_278 = 10'd278;
parameter [9:0] LEGUP_F_main_BB__66_279 = 10'd279;
parameter [9:0] LEGUP_F_main_BB__66_280 = 10'd280;
parameter [9:0] LEGUP_F_main_BB__66_281 = 10'd281;
parameter [9:0] LEGUP_F_main_BB__66_282 = 10'd282;
parameter [9:0] LEGUP_F_main_BB__66_283 = 10'd283;
parameter [9:0] LEGUP_F_main_BB__66_284 = 10'd284;
parameter [9:0] LEGUP_F_main_BB__66_285 = 10'd285;
parameter [9:0] LEGUP_F_main_BB__66_286 = 10'd286;
parameter [9:0] LEGUP_F_main_BB__66_287 = 10'd287;
parameter [9:0] LEGUP_F_main_BB__66_288 = 10'd288;
parameter [9:0] LEGUP_F_main_BB__66_289 = 10'd289;
parameter [9:0] LEGUP_F_main_BB__66_290 = 10'd290;
parameter [9:0] LEGUP_F_main_BB__66_291 = 10'd291;
parameter [9:0] LEGUP_F_main_BB__66_292 = 10'd292;
parameter [9:0] LEGUP_F_main_BB__66_293 = 10'd293;
parameter [9:0] LEGUP_F_main_BB__66_294 = 10'd294;
parameter [9:0] LEGUP_F_main_BB__66_295 = 10'd295;
parameter [9:0] LEGUP_F_main_BB__66_296 = 10'd296;
parameter [9:0] LEGUP_F_main_BB__66_297 = 10'd297;
parameter [9:0] LEGUP_F_main_BB__66_298 = 10'd298;
parameter [9:0] LEGUP_F_main_BB__66_299 = 10'd299;
parameter [9:0] LEGUP_F_main_BB__66_300 = 10'd300;
parameter [9:0] LEGUP_F_main_BB__66_301 = 10'd301;
parameter [9:0] LEGUP_F_main_BB__66_302 = 10'd302;
parameter [9:0] LEGUP_F_main_BB__66_303 = 10'd303;
parameter [9:0] LEGUP_F_main_BB__66_304 = 10'd304;
parameter [9:0] LEGUP_F_main_BB__66_305 = 10'd305;
parameter [9:0] LEGUP_F_main_BB__66_306 = 10'd306;
parameter [9:0] LEGUP_F_main_BB__66_307 = 10'd307;
parameter [9:0] LEGUP_F_main_BB__66_308 = 10'd308;
parameter [9:0] LEGUP_F_main_BB__66_309 = 10'd309;
parameter [9:0] LEGUP_F_main_BB__66_310 = 10'd310;
parameter [9:0] LEGUP_F_main_BB__66_311 = 10'd311;
parameter [9:0] LEGUP_F_main_BB__66_312 = 10'd312;
parameter [9:0] LEGUP_F_main_BB__66_313 = 10'd313;
parameter [9:0] LEGUP_F_main_BB__66_314 = 10'd314;
parameter [9:0] LEGUP_F_main_BB__66_315 = 10'd315;
parameter [9:0] LEGUP_F_main_BB__66_316 = 10'd316;
parameter [9:0] LEGUP_F_main_BB__66_317 = 10'd317;
parameter [9:0] LEGUP_F_main_BB__66_318 = 10'd318;
parameter [9:0] LEGUP_F_main_BB__66_319 = 10'd319;
parameter [9:0] LEGUP_F_main_BB__66_320 = 10'd320;
parameter [9:0] LEGUP_F_main_BB__66_321 = 10'd321;
parameter [9:0] LEGUP_F_main_BB__66_322 = 10'd322;
parameter [9:0] LEGUP_F_main_BB__66_323 = 10'd323;
parameter [9:0] LEGUP_F_main_BB__66_324 = 10'd324;
parameter [9:0] LEGUP_F_main_BB__66_325 = 10'd325;
parameter [9:0] LEGUP_F_main_BB__66_326 = 10'd326;
parameter [9:0] LEGUP_F_main_BB__66_327 = 10'd327;
parameter [9:0] LEGUP_F_main_BB__66_328 = 10'd328;
parameter [9:0] LEGUP_F_main_BB__66_329 = 10'd329;
parameter [9:0] LEGUP_F_main_BB__66_330 = 10'd330;
parameter [9:0] LEGUP_F_main_BB__66_331 = 10'd331;
parameter [9:0] LEGUP_F_main_BB__66_332 = 10'd332;
parameter [9:0] LEGUP_F_main_BB__66_333 = 10'd333;
parameter [9:0] LEGUP_F_main_BB__66_334 = 10'd334;
parameter [9:0] LEGUP_F_main_BB__66_335 = 10'd335;
parameter [9:0] LEGUP_F_main_BB__66_336 = 10'd336;
parameter [9:0] LEGUP_F_main_BB__66_337 = 10'd337;
parameter [9:0] LEGUP_F_main_BB__66_338 = 10'd338;
parameter [9:0] LEGUP_F_main_BB__66_339 = 10'd339;
parameter [9:0] LEGUP_F_main_BB__66_340 = 10'd340;
parameter [9:0] LEGUP_F_main_BB__66_341 = 10'd341;
parameter [9:0] LEGUP_F_main_BB__66_342 = 10'd342;
parameter [9:0] LEGUP_F_main_BB__66_343 = 10'd343;
parameter [9:0] LEGUP_F_main_BB__66_344 = 10'd344;
parameter [9:0] LEGUP_F_main_BB__66_345 = 10'd345;
parameter [9:0] LEGUP_F_main_BB__66_346 = 10'd346;
parameter [9:0] LEGUP_F_main_BB__66_347 = 10'd347;
parameter [9:0] LEGUP_F_main_BB__66_348 = 10'd348;
parameter [9:0] LEGUP_F_main_BB__66_349 = 10'd349;
parameter [9:0] LEGUP_F_main_BB__66_350 = 10'd350;
parameter [9:0] LEGUP_F_main_BB__66_351 = 10'd351;
parameter [9:0] LEGUP_F_main_BB__66_352 = 10'd352;
parameter [9:0] LEGUP_F_main_BB__66_353 = 10'd353;
parameter [9:0] LEGUP_F_main_BB__66_354 = 10'd354;
parameter [9:0] LEGUP_F_main_BB__66_355 = 10'd355;
parameter [9:0] LEGUP_F_main_BB__66_356 = 10'd356;
parameter [9:0] LEGUP_F_main_BB__66_357 = 10'd357;
parameter [9:0] LEGUP_F_main_BB__66_358 = 10'd358;
parameter [9:0] LEGUP_F_main_BB__66_359 = 10'd359;
parameter [9:0] LEGUP_F_main_BB__66_360 = 10'd360;
parameter [9:0] LEGUP_F_main_BB__66_361 = 10'd361;
parameter [9:0] LEGUP_F_main_BB__66_362 = 10'd362;
parameter [9:0] LEGUP_F_main_BB__66_363 = 10'd363;
parameter [9:0] LEGUP_F_main_BB__66_364 = 10'd364;
parameter [9:0] LEGUP_F_main_BB__66_365 = 10'd365;
parameter [9:0] LEGUP_F_main_BB__66_366 = 10'd366;
parameter [9:0] LEGUP_F_main_BB__66_367 = 10'd367;
parameter [9:0] LEGUP_F_main_BB__66_368 = 10'd368;
parameter [9:0] LEGUP_F_main_BB__66_369 = 10'd369;
parameter [9:0] LEGUP_F_main_BB__80_370 = 10'd370;
parameter [9:0] LEGUP_F_main_BB__80_371 = 10'd371;
parameter [9:0] LEGUP_F_main_BB__80_372 = 10'd372;
parameter [9:0] LEGUP_F_main_BB__80_373 = 10'd373;
parameter [9:0] LEGUP_F_main_BB__80_374 = 10'd374;
parameter [9:0] LEGUP_F_main_BB__80_375 = 10'd375;
parameter [9:0] LEGUP_F_main_BB__80_376 = 10'd376;
parameter [9:0] LEGUP_F_main_BB__80_377 = 10'd377;
parameter [9:0] LEGUP_F_main_BB__80_378 = 10'd378;
parameter [9:0] LEGUP_F_main_BB__80_379 = 10'd379;
parameter [9:0] LEGUP_F_main_BB__80_380 = 10'd380;
parameter [9:0] LEGUP_F_main_BB__80_381 = 10'd381;
parameter [9:0] LEGUP_F_main_BB__80_382 = 10'd382;
parameter [9:0] LEGUP_F_main_BB__80_383 = 10'd383;
parameter [9:0] LEGUP_F_main_BB__80_384 = 10'd384;
parameter [9:0] LEGUP_F_main_BB__80_385 = 10'd385;
parameter [9:0] LEGUP_F_main_BB__80_386 = 10'd386;
parameter [9:0] LEGUP_F_main_BB__80_387 = 10'd387;
parameter [9:0] LEGUP_F_main_BB__80_388 = 10'd388;
parameter [9:0] LEGUP_F_main_BB__80_389 = 10'd389;
parameter [9:0] LEGUP_F_main_BB__80_390 = 10'd390;
parameter [9:0] LEGUP_F_main_BB__80_391 = 10'd391;
parameter [9:0] LEGUP_F_main_BB__80_392 = 10'd392;
parameter [9:0] LEGUP_F_main_BB__80_393 = 10'd393;
parameter [9:0] LEGUP_F_main_BB__80_394 = 10'd394;
parameter [9:0] LEGUP_F_main_BB__80_395 = 10'd395;
parameter [9:0] LEGUP_F_main_BB__80_396 = 10'd396;
parameter [9:0] LEGUP_F_main_BB__80_397 = 10'd397;
parameter [9:0] LEGUP_F_main_BB__80_398 = 10'd398;
parameter [9:0] LEGUP_F_main_BB__80_399 = 10'd399;
parameter [9:0] LEGUP_F_main_BB__80_400 = 10'd400;
parameter [9:0] LEGUP_F_main_BB__80_401 = 10'd401;
parameter [9:0] LEGUP_F_main_BB__80_402 = 10'd402;
parameter [9:0] LEGUP_F_main_BB__80_403 = 10'd403;
parameter [9:0] LEGUP_F_main_BB__80_404 = 10'd404;
parameter [9:0] LEGUP_F_main_BB__80_405 = 10'd405;
parameter [9:0] LEGUP_F_main_BB__80_406 = 10'd406;
parameter [9:0] LEGUP_F_main_BB__80_407 = 10'd407;
parameter [9:0] LEGUP_F_main_BB__80_408 = 10'd408;
parameter [9:0] LEGUP_F_main_BB__80_409 = 10'd409;
parameter [9:0] LEGUP_F_main_BB__80_410 = 10'd410;
parameter [9:0] LEGUP_F_main_BB__80_411 = 10'd411;
parameter [9:0] LEGUP_F_main_BB__80_412 = 10'd412;
parameter [9:0] LEGUP_F_main_BB__80_413 = 10'd413;
parameter [9:0] LEGUP_F_main_BB__80_414 = 10'd414;
parameter [9:0] LEGUP_F_main_BB__80_415 = 10'd415;
parameter [9:0] LEGUP_F_main_BB__80_416 = 10'd416;
parameter [9:0] LEGUP_F_main_BB__80_417 = 10'd417;
parameter [9:0] LEGUP_F_main_BB__80_418 = 10'd418;
parameter [9:0] LEGUP_F_main_BB__80_419 = 10'd419;
parameter [9:0] LEGUP_F_main_BB__80_420 = 10'd420;
parameter [9:0] LEGUP_F_main_BB__80_421 = 10'd421;
parameter [9:0] LEGUP_F_main_BB__80_422 = 10'd422;
parameter [9:0] LEGUP_F_main_BB__80_423 = 10'd423;
parameter [9:0] LEGUP_F_main_BB__80_424 = 10'd424;
parameter [9:0] LEGUP_F_main_BB__80_425 = 10'd425;
parameter [9:0] LEGUP_F_main_BB__80_426 = 10'd426;
parameter [9:0] LEGUP_F_main_BB__80_427 = 10'd427;
parameter [9:0] LEGUP_F_main_BB__80_428 = 10'd428;
parameter [9:0] LEGUP_F_main_BB__80_429 = 10'd429;
parameter [9:0] LEGUP_F_main_BB__80_430 = 10'd430;
parameter [9:0] LEGUP_F_main_BB__80_431 = 10'd431;
parameter [9:0] LEGUP_F_main_BB__80_432 = 10'd432;
parameter [9:0] LEGUP_F_main_BB__80_433 = 10'd433;
parameter [9:0] LEGUP_F_main_BB__80_434 = 10'd434;
parameter [9:0] LEGUP_F_main_BB__80_435 = 10'd435;
parameter [9:0] LEGUP_F_main_BB__80_436 = 10'd436;
parameter [9:0] LEGUP_F_main_BB__80_437 = 10'd437;
parameter [9:0] LEGUP_F_main_BB__80_438 = 10'd438;
parameter [9:0] LEGUP_F_main_BB__80_439 = 10'd439;
parameter [9:0] LEGUP_F_main_BB__80_440 = 10'd440;
parameter [9:0] LEGUP_F_main_BB__80_441 = 10'd441;
parameter [9:0] LEGUP_F_main_BB__80_442 = 10'd442;
parameter [9:0] LEGUP_F_main_BB__80_443 = 10'd443;
parameter [9:0] LEGUP_F_main_BB__80_444 = 10'd444;
parameter [9:0] LEGUP_F_main_BB__80_445 = 10'd445;
parameter [9:0] LEGUP_F_main_BB__85_446 = 10'd446;
parameter [9:0] LEGUP_F_main_BB__85_447 = 10'd447;
parameter [9:0] LEGUP_F_main_BB__85_448 = 10'd448;
parameter [9:0] LEGUP_F_main_BB__85_449 = 10'd449;
parameter [9:0] LEGUP_F_main_BB__85_450 = 10'd450;
parameter [9:0] LEGUP_F_main_BB__85_451 = 10'd451;
parameter [9:0] LEGUP_F_main_BB__85_452 = 10'd452;
parameter [9:0] LEGUP_F_main_BB__85_453 = 10'd453;
parameter [9:0] LEGUP_F_main_BB__85_454 = 10'd454;
parameter [9:0] LEGUP_F_main_BB__85_455 = 10'd455;
parameter [9:0] LEGUP_F_main_BB__85_456 = 10'd456;
parameter [9:0] LEGUP_F_main_BB__85_457 = 10'd457;
parameter [9:0] LEGUP_F_main_BB__85_458 = 10'd458;
parameter [9:0] LEGUP_F_main_BB__85_459 = 10'd459;
parameter [9:0] LEGUP_F_main_BB__85_460 = 10'd460;
parameter [9:0] LEGUP_F_main_BB__85_461 = 10'd461;
parameter [9:0] LEGUP_F_main_BB__85_462 = 10'd462;
parameter [9:0] LEGUP_F_main_BB__85_463 = 10'd463;
parameter [9:0] LEGUP_F_main_BB__85_464 = 10'd464;
parameter [9:0] LEGUP_F_main_BB__85_465 = 10'd465;
parameter [9:0] LEGUP_F_main_BB__85_466 = 10'd466;
parameter [9:0] LEGUP_F_main_BB__85_467 = 10'd467;
parameter [9:0] LEGUP_F_main_BB__85_468 = 10'd468;
parameter [9:0] LEGUP_F_main_BB__85_469 = 10'd469;
parameter [9:0] LEGUP_F_main_BB__85_470 = 10'd470;
parameter [9:0] LEGUP_F_main_BB__85_471 = 10'd471;
parameter [9:0] LEGUP_F_main_BB__85_472 = 10'd472;
parameter [9:0] LEGUP_F_main_BB__85_473 = 10'd473;
parameter [9:0] LEGUP_F_main_BB__85_474 = 10'd474;
parameter [9:0] LEGUP_F_main_BB__85_475 = 10'd475;
parameter [9:0] LEGUP_F_main_BB__85_476 = 10'd476;
parameter [9:0] LEGUP_F_main_BB__85_477 = 10'd477;
parameter [9:0] LEGUP_F_main_BB__85_478 = 10'd478;
parameter [9:0] LEGUP_F_main_BB__85_479 = 10'd479;
parameter [9:0] LEGUP_F_main_BB__85_480 = 10'd480;
parameter [9:0] LEGUP_F_main_BB__85_481 = 10'd481;
parameter [9:0] LEGUP_F_main_BB__85_482 = 10'd482;
parameter [9:0] LEGUP_F_main_BB__85_483 = 10'd483;
parameter [9:0] LEGUP_F_main_BB__85_484 = 10'd484;
parameter [9:0] LEGUP_F_main_BB__85_485 = 10'd485;
parameter [9:0] LEGUP_F_main_BB__85_486 = 10'd486;
parameter [9:0] LEGUP_F_main_BB__85_487 = 10'd487;
parameter [9:0] LEGUP_F_main_BB__85_488 = 10'd488;
parameter [9:0] LEGUP_F_main_BB__85_489 = 10'd489;
parameter [9:0] LEGUP_F_main_BB__85_490 = 10'd490;
parameter [9:0] LEGUP_F_main_BB__85_491 = 10'd491;
parameter [9:0] LEGUP_F_main_BB__85_492 = 10'd492;
parameter [9:0] LEGUP_F_main_BB__85_493 = 10'd493;
parameter [9:0] LEGUP_F_main_BB__85_494 = 10'd494;
parameter [9:0] LEGUP_F_main_BB__85_495 = 10'd495;
parameter [9:0] LEGUP_F_main_BB__85_496 = 10'd496;
parameter [9:0] LEGUP_F_main_BB__85_497 = 10'd497;
parameter [9:0] LEGUP_F_main_BB__85_498 = 10'd498;
parameter [9:0] LEGUP_F_main_BB__85_499 = 10'd499;
parameter [9:0] LEGUP_F_main_BB__85_500 = 10'd500;
parameter [9:0] LEGUP_F_main_BB__85_501 = 10'd501;
parameter [9:0] LEGUP_F_main_BB__85_502 = 10'd502;
parameter [9:0] LEGUP_F_main_BB__85_503 = 10'd503;
parameter [9:0] LEGUP_F_main_BB__85_504 = 10'd504;
parameter [9:0] LEGUP_F_main_BB__85_505 = 10'd505;
parameter [9:0] LEGUP_F_main_BB__85_506 = 10'd506;
parameter [9:0] LEGUP_F_main_BB__85_507 = 10'd507;
parameter [9:0] LEGUP_F_main_BB__85_508 = 10'd508;
parameter [9:0] LEGUP_F_main_BB__85_509 = 10'd509;
parameter [9:0] LEGUP_F_main_BB__85_510 = 10'd510;
parameter [9:0] LEGUP_F_main_BB__85_511 = 10'd511;
parameter [9:0] LEGUP_F_main_BB__85_512 = 10'd512;
parameter [9:0] LEGUP_F_main_BB__85_513 = 10'd513;
parameter [9:0] LEGUP_F_main_BB__85_514 = 10'd514;
parameter [9:0] LEGUP_F_main_BB__85_515 = 10'd515;
parameter [9:0] LEGUP_F_main_BB__85_516 = 10'd516;
parameter [9:0] LEGUP_F_main_BB__85_517 = 10'd517;
parameter [9:0] LEGUP_F_main_BB__85_518 = 10'd518;
parameter [9:0] LEGUP_F_main_BB__85_519 = 10'd519;
parameter [9:0] LEGUP_F_main_BB__85_520 = 10'd520;
parameter [9:0] LEGUP_F_main_BB__85_521 = 10'd521;
parameter [9:0] LEGUP_F_main_BB__85_522 = 10'd522;
parameter [9:0] LEGUP_F_main_BB__85_523 = 10'd523;
parameter [9:0] LEGUP_F_main_BB__85_524 = 10'd524;
parameter [9:0] LEGUP_F_main_BB__85_525 = 10'd525;
parameter [9:0] LEGUP_F_main_BB__85_526 = 10'd526;
parameter [9:0] LEGUP_F_main_BB__85_527 = 10'd527;
parameter [9:0] LEGUP_F_main_BB__85_528 = 10'd528;
parameter [9:0] LEGUP_F_main_BB__85_529 = 10'd529;
parameter [9:0] LEGUP_F_main_BB__85_530 = 10'd530;
parameter [9:0] LEGUP_F_main_BB__85_531 = 10'd531;
parameter [9:0] LEGUP_F_main_BB__85_532 = 10'd532;
parameter [9:0] LEGUP_F_main_BB__85_533 = 10'd533;
parameter [9:0] LEGUP_F_main_BB__85_534 = 10'd534;
parameter [9:0] LEGUP_F_main_BB__85_535 = 10'd535;
parameter [9:0] LEGUP_F_main_BB__94_536 = 10'd536;
parameter [9:0] LEGUP_F_main_BB__97_537 = 10'd537;
parameter [9:0] LEGUP_F_main_BB__97_538 = 10'd538;
parameter [9:0] LEGUP_F_main_BB__97_539 = 10'd539;
parameter [9:0] LEGUP_F_main_BB__97_540 = 10'd540;
parameter [9:0] LEGUP_F_main_BB__97_541 = 10'd541;
parameter [9:0] LEGUP_F_main_BB__97_542 = 10'd542;
parameter [9:0] LEGUP_F_main_BB__97_543 = 10'd543;
parameter [9:0] LEGUP_F_main_BB__97_544 = 10'd544;
parameter [9:0] LEGUP_F_main_BB__97_545 = 10'd545;
parameter [9:0] LEGUP_F_main_BB__97_546 = 10'd546;
parameter [9:0] LEGUP_F_main_BB__97_547 = 10'd547;
parameter [9:0] LEGUP_F_main_BB__97_548 = 10'd548;
parameter [9:0] LEGUP_F_main_BB_expfexit_549 = 10'd549;
parameter [9:0] LEGUP_F_main_BB_expfexit_550 = 10'd550;
parameter [9:0] LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1preheader_551 = 10'd551;
parameter [9:0] LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_552 = 10'd552;
parameter [9:0] LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_553 = 10'd553;
parameter [9:0] LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_554 = 10'd554;
parameter [9:0] LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_555 = 10'd555;
parameter [9:0] LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_556 = 10'd556;
parameter [9:0] LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_557 = 10'd557;
parameter [9:0] LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_558 = 10'd558;
parameter [9:0] LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_559 = 10'd559;
parameter [9:0] LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_560 = 10'd560;
parameter [9:0] LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_561 = 10'd561;
parameter [9:0] LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_562 = 10'd562;
parameter [9:0] LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_563 = 10'd563;
parameter [9:0] LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_564 = 10'd564;
parameter [9:0] LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_565 = 10'd565;
parameter [9:0] LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_566 = 10'd566;
parameter [9:0] LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_567 = 10'd567;
parameter [9:0] LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_568 = 10'd568;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0preheader_569 = 10'd569;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_570 = 10'd570;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_571 = 10'd571;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_572 = 10'd572;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_573 = 10'd573;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_574 = 10'd574;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_575 = 10'd575;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_576 = 10'd576;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_577 = 10'd577;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_578 = 10'd578;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_579 = 10'd579;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_580 = 10'd580;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_581 = 10'd581;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_582 = 10'd582;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_583 = 10'd583;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_584 = 10'd584;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_585 = 10'd585;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_586 = 10'd586;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_587 = 10'd587;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_588 = 10'd588;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_589 = 10'd589;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_590 = 10'd590;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_591 = 10'd591;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_592 = 10'd592;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_593 = 10'd593;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_594 = 10'd594;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_595 = 10'd595;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_596 = 10'd596;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_597 = 10'd597;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_598 = 10'd598;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_599 = 10'd599;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_600 = 10'd600;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_601 = 10'd601;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_602 = 10'd602;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_603 = 10'd603;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_604 = 10'd604;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_605 = 10'd605;
parameter [9:0] LEGUP_F_main_BB_fusionloop_bodydim0_606 = 10'd606;
parameter [9:0] LEGUP_F_main_BB_fusionloop_exitdim0_607 = 10'd607;
parameter [9:0] LEGUP_F_main_BB_fusionloop_exitdim0_608 = 10'd608;
parameter [9:0] LEGUP_F_main_BB_fusionloop_exitdim0_609 = 10'd609;
parameter [8:0] tag_offset = 9'd0;
parameter [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] tag_addr_offset = {tag_offset, 55'd0};

input  clk;
input  clk2x;
input  clk1x_follower;
input  reset;
input  start;
output reg  finish;
input  memory_controller_waitrequest;
output reg  memory_controller_enable_a;
output reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] memory_controller_address_a;
output reg  memory_controller_write_enable_a;
output reg [`MEMORY_CONTROLLER_DATA_SIZE-1:0] memory_controller_in_a;
output reg [1:0] memory_controller_size_a;
input [`MEMORY_CONTROLLER_DATA_SIZE-1:0] memory_controller_out_a;
output reg  memory_controller_enable_b;
output reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] memory_controller_address_b;
output reg  memory_controller_write_enable_b;
output reg [`MEMORY_CONTROLLER_DATA_SIZE-1:0] memory_controller_in_b;
output reg [1:0] memory_controller_size_b;
input [`MEMORY_CONTROLLER_DATA_SIZE-1:0] memory_controller_out_b;
output reg [31:0] return_val;
reg [9:0] cur_state;
reg [9:0] next_state;
reg [63:0] main_dotloop_bodyreductionlrph_dotindvarrhs122;
reg [63:0] main_dotloop_bodyreductionlrph_dotindvarrhs122_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_dotloop_bodyreductionlrph_scevgep23;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_dotloop_bodyreductionlrph_scevgep23_reg;
reg [31:0] main_dotloop_bodyreduction_0;
reg [31:0] main_dotloop_bodyreduction_0_reg;
reg [63:0] main_dotloop_bodyreduction_dotindvarreduction20;
reg [63:0] main_dotloop_bodyreduction_dotindvarreduction20_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_dotloop_bodyreduction_scevgep19;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_dotloop_bodyreduction_scevgep20;
reg [31:0] main_dotloop_bodyreduction_1;
reg [31:0] main_dotloop_bodyreduction_2;
reg [31:0] main_dotloop_bodyreduction_3;
reg [31:0] main_dotloop_bodyreduction_3_reg;
reg [31:0] main_dotloop_bodyreduction_4;
reg [31:0] main_dotloop_bodyreduction_4_reg;
reg [63:0] main_dotloop_bodyreduction_5;
reg [63:0] main_dotloop_bodyreduction_5_reg;
reg  main_dotloop_bodyreduction_exitcond18;
reg  main_dotloop_bodyreduction_exitcond18_reg;
reg [63:0] main_dotloop_exitreduction_6;
reg [63:0] main_dotloop_exitreduction_6_reg;
reg  main_dotloop_exitreduction_exitcond21;
reg  main_dotloop_exitreduction_exitcond21_reg;
reg [63:0] main_fusion2loop_bodydim1_fusion2indvardim116;
reg [63:0] main_fusion2loop_bodydim1_fusion2indvardim116_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_fusion2loop_bodydim1_scevgep15;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_fusion2loop_bodydim1_scevgep15_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_fusion2loop_bodydim1_scevgep16;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_fusion2loop_bodydim1_scevgep17;
reg [31:0] main_fusion2loop_bodydim1_7;
reg [31:0] main_fusion2loop_bodydim1_8;
reg [31:0] main_fusion2loop_bodydim1_9;
reg [63:0] main_fusion2loop_bodydim1_10;
reg [63:0] main_fusion2loop_bodydim1_10_reg;
reg  main_fusion2loop_bodydim1_exitcond14;
reg  main_fusion2loop_bodydim1_exitcond14_reg;
reg [31:0] main_reduceinnerloop_bodyreduction_dim1_11;
reg [31:0] main_reduceinnerloop_bodyreduction_dim1_11_reg;
reg [63:0] main_reduceinnerloop_bodyreduction_dim1_reduceinnerindvarreduction_dim112;
reg [63:0] main_reduceinnerloop_bodyreduction_dim1_reduceinnerindvarreduction_dim112_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_reduceinnerloop_bodyreduction_dim1_scevgep13;
reg [31:0] main_reduceinnerloop_bodyreduction_dim1_12;
reg [31:0] main_reduceinnerloop_bodyreduction_dim1_12_reg;
reg  main_reduceinnerloop_bodyreduction_dim1_13;
reg  main_reduceinnerloop_bodyreduction_dim1_14;
reg  main_reduceinnerloop_bodyreduction_dim1_14_reg;
reg  main_reduceinnerloop_bodyreduction_dim1_15;
reg [31:0] main_reduceinnerloop_bodyreduction_dim1_16;
reg [31:0] main_reduceinnerloop_bodyreduction_dim1_16_reg;
reg [63:0] main_reduceinnerloop_bodyreduction_dim1_17;
reg [63:0] main_reduceinnerloop_bodyreduction_dim1_17_reg;
reg  main_reduceinnerloop_bodyreduction_dim1_exitcond12;
reg  main_reduceinnerloop_bodyreduction_dim1_exitcond12_reg;
reg [31:0] main_fusion1loop_bodydim1_loii0;
reg [31:0] main_fusion1loop_bodydim1_loii0_reg;
reg [31:0] main_fusion1loop_bodydim1_hiii0;
reg [31:0] main_fusion1loop_bodydim1_hiii0_reg;
reg [63:0] main_fusion1loop_bodydim1_fusion1indvardim18;
reg [63:0] main_fusion1loop_bodydim1_fusion1indvardim18_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_fusion1loop_bodydim1_scevgep5;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_fusion1loop_bodydim1_scevgep5_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_fusion1loop_bodydim1_scevgep6;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_fusion1loop_bodydim1_scevgep7;
reg [31:0] main_fusion1loop_bodydim1_18;
reg [31:0] main_fusion1loop_bodydim1_19;
reg [31:0] main_fusion1loop_bodydim1_20;
reg [31:0] main_fusion1loop_bodydim1_21;
reg [31:0] main_fusion1loop_bodydim1_21_reg;
reg [31:0] main_fusion1loop_bodydim1_22;
reg [31:0] main_fusion1loop_bodydim1_22_reg;
reg [31:0] main_fusion1loop_bodydim1_23;
reg [31:0] main_fusion1loop_bodydim1_23_reg;
reg [31:0] main_fusion1loop_bodydim1_24;
reg [31:0] main_fusion1loop_bodydim1_24_reg;
reg  main_fusion1loop_bodydim1_25;
reg [31:0] main_26_27;
reg  main_28_29;
reg  main_30_31;
reg [31:0] main_30_;
reg  main_32_33;
reg  main_34_35;
reg  main_34_36;
reg  main_34_orcond;
reg  main_threadpresplit_37;
reg  main_38_39;
reg [63:0] main_40_41;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_40_42;
reg [31:0] main_40_43;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_40_44;
reg [31:0] main_40_45;
reg [31:0] main_40_46;
reg [31:0] main_40_47;
reg [31:0] main_40_47_reg;
reg [31:0] main_48_49;
reg [63:0] main_48_50;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_48_51;
reg [31:0] main_48_52;
reg [31:0] main_48_52_reg;
reg [31:0] main_48_53;
reg [31:0] main_48_54;
reg [31:0] main_48_54_reg;
reg [31:0] main_48_55;
reg [31:0] main_48_55_reg;
reg [31:0] main_48_56;
reg [31:0] main_48_56_reg;
reg [31:0] main_48_57;
reg [31:0] main_48_57_reg;
reg [31:0] main_58_kii0;
reg [31:0] main_58_kii0_reg;
reg [31:0] main_58_loii1;
reg [31:0] main_58_loii1_reg;
reg [31:0] main_58_pn;
reg [31:0] main_58_pn_reg;
reg [31:0] main_58_hiii1;
reg [31:0] main_58_hiii1_reg;
reg [31:0] main_58_59;
reg [31:0] main_58_59_reg;
reg  main_60_61;
reg  main_60_61_reg;
reg [31:0] main_60_62;
reg  main_60_63;
reg  main_60_orcond54;
reg [31:0] main_64_65;
reg [31:0] main_66_kii1;
reg [31:0] main_66_kii1_reg;
reg [31:0] main_66_loii2;
reg [31:0] main_66_loii2_reg;
reg [31:0] main_66_hiii2;
reg [31:0] main_66_hiii2_reg;
reg [31:0] main_66_048;
reg [31:0] main_66_048_reg;
reg [31:0] main_66_67;
reg [31:0] main_66_67_reg;
reg [31:0] main_66_68;
reg [31:0] main_66_69;
reg [31:0] main_66_70;
reg [31:0] main_66_71;
reg [31:0] main_66_72;
reg [31:0] main_66_73;
reg [31:0] main_66_74;
reg [31:0] main_66_75;
reg [31:0] main_66_76;
reg [31:0] main_66_77;
reg [31:0] main_66_77_reg;
reg  main_66_78;
reg  main_66_78_reg;
reg [31:0] main_66_79;
reg [31:0] main_66_79_reg;
reg [31:0] main_80_81;
reg [31:0] main_80_82;
reg [31:0] main_80_83;
reg [31:0] main_80_84;
reg [31:0] main_85_86;
reg [31:0] main_85_87;
reg [31:0] main_85_88;
reg [31:0] main_85_89;
reg [31:0] main_85_89_reg;
reg [31:0] main_85_90;
reg  main_85_91;
reg  main_85_91_reg;
reg [31:0] main_85_92;
reg [31:0] main_85_92_reg;
reg [31:0] main_85_93;
reg [31:0] main_85_93_reg;
reg [31:0] main_94_95;
reg [31:0] main_94_96;
reg [31:0] main_97_98;
reg [31:0] main_97_99;
reg [31:0] main_97_100;
reg [31:0] main_97_101;
reg [31:0] main_expfexit_loii3;
reg [31:0] main_expfexit_loii3_reg;
reg [31:0] main_expfexit_hiii3;
reg [31:0] main_expfexit_hiii3_reg;
reg [31:0] main_expfexit_0;
reg [31:0] main_expfexit_0_reg;
reg [63:0] main_expfexit_102;
reg [63:0] main_expfexit_102_reg;
reg  main_expfexit_exitcond4;
reg  main_expfexit_exitcond4_reg;
reg [31:0] main_reduce1innerloop_bodyreduction_dim1_103;
reg [31:0] main_reduce1innerloop_bodyreduction_dim1_103_reg;
reg [63:0] main_reduce1innerloop_bodyreduction_dim1_reduce1innerindvarreduction_dim14;
reg [63:0] main_reduce1innerloop_bodyreduction_dim1_reduce1innerindvarreduction_dim14_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_reduce1innerloop_bodyreduction_dim1_scevgep3;
reg [31:0] main_reduce1innerloop_bodyreduction_dim1_104;
reg [31:0] main_reduce1innerloop_bodyreduction_dim1_105;
reg [31:0] main_reduce1innerloop_bodyreduction_dim1_105_reg;
reg [63:0] main_reduce1innerloop_bodyreduction_dim1_106;
reg [63:0] main_reduce1innerloop_bodyreduction_dim1_106_reg;
reg  main_reduce1innerloop_bodyreduction_dim1_exitcond;
reg  main_reduce1innerloop_bodyreduction_dim1_exitcond_reg;
reg [63:0] main_fusionloop_bodydim0_fusionindvardim02;
reg [63:0] main_fusionloop_bodydim0_fusionindvardim02_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_fusionloop_bodydim0_scevgep;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_fusionloop_bodydim0_scevgep_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_fusionloop_bodydim0_scevgep2;
reg [31:0] main_fusionloop_bodydim0_107;
reg [31:0] main_fusionloop_bodydim0_108;
reg [63:0] main_fusionloop_bodydim0_109;
reg [63:0] main_fusionloop_bodydim0_109_reg;
reg  main_fusionloop_bodydim0_exitcond1;
reg  main_fusionloop_bodydim0_exitcond1_reg;
reg [31:0] main_fusionloop_exitdim0_leflow_retval;
reg [31:0] main_altfp_multiply_32_0_op0;
reg [31:0] main_altfp_multiply_32_0_op1;
wire [31:0] altfp_multiplier_main_dotloop_bodyreduction_3_out;
reg  altfp_main_dotloop_bodyreduction_3_en;
reg [31:0] main_altfp_multiply_32_0;
reg [31:0] main_altfp_add_32_0_op0;
reg [31:0] main_altfp_add_32_0_op1;
wire [31:0] altfp_adder_main_dotloop_bodyreduction_4_out;
reg  altfp_main_dotloop_bodyreduction_4_en;
reg [31:0] main_altfp_add_32_0;
reg [31:0] main_altfp_subtract_32_0_op0;
reg [31:0] main_altfp_subtract_32_0_op1;
wire [31:0] altfp_subtractor_main_fusion1loop_bodydim1_21_out;
reg  altfp_main_fusion1loop_bodydim1_21_en;
reg [31:0] main_altfp_subtract_32_0;
reg [31:0] main_altfp_divide_32_0_op0;
reg [31:0] main_altfp_divide_32_0_op1;
wire [31:0] altfp_divider_main_fusionloop_bodydim0_108_out;
reg  altfp_main_fusionloop_bodydim0_108_en;
reg [31:0] main_altfp_divide_32_0;
reg [31:0] main_altfp_fptosi_32_0_op0;
wire [31:0] altfp_fptosi32_main_48_54_out;
reg  altfp_main_48_54_en;
reg [31:0] main_altfp_fptosi_32_0;
reg [31:0] main_altfp_sitofp_32_0_op0;
wire [31:0] altfp_sitofp32_main_48_55_out;
reg  altfp_main_48_55_en;
reg [31:0] main_altfp_sitofp_32_0;
wire  altfp_compare32_1_main_reduceinnerloop_bodyreduction_dim1_14_out;
reg  altfp_main_reduceinnerloop_bodyreduction_dim1_14_en;
wire  main_reduceinnerloop_bodyreduction_dim1_14_unused;
wire  altfp_compare32_1_main_reduceinnerloop_bodyreduction_dim1_13_out;
reg  altfp_main_reduceinnerloop_bodyreduction_dim1_13_en;
wire  main_reduceinnerloop_bodyreduction_dim1_13_unused;
wire  altfp_compare32_1_main_60_63_out;
reg  altfp_main_60_63_en;
wire  main_60_63_unused;

/*   %3 = fmul float %1, %2*/
altfp_multiplier_11 altfp_multiplier_11_main_dotloop_bodyreduction_3 (
	.result (altfp_multiplier_main_dotloop_bodyreduction_3_out),
	.dataa (main_altfp_multiply_32_0_op0),
	.datab (main_altfp_multiply_32_0_op1),
	.clock (clk),
	.clk_en (altfp_main_dotloop_bodyreduction_3_en)
);


/*   %4 = fadd float %0, %3*/
altfp_adder_14 altfp_adder_14_main_dotloop_bodyreduction_4 (
	.result (altfp_adder_main_dotloop_bodyreduction_4_out),
	.dataa (main_altfp_add_32_0_op0),
	.datab (main_altfp_add_32_0_op1),
	.clock (clk),
	.clk_en (altfp_main_dotloop_bodyreduction_4_en)
);


/*   %21 = fsub float %20, %16*/
altfp_subtractor_14 altfp_subtractor_14_main_fusion1loop_bodydim1_21 (
	.result (altfp_subtractor_main_fusion1loop_bodydim1_21_out),
	.dataa (main_altfp_subtract_32_0_op0),
	.datab (main_altfp_subtract_32_0_op1),
	.clock (clk),
	.clk_en (altfp_main_fusion1loop_bodydim1_21_en)
);


/*   %108 = fdiv float %107, %105*/
altfp_divider_33 altfp_divider_33_main_fusionloop_bodydim0_108 (
	.result (altfp_divider_main_fusionloop_bodydim0_108_out),
	.dataa (main_altfp_divide_32_0_op0),
	.datab (main_altfp_divide_32_0_op1),
	.clock (clk),
	.clk_en (altfp_main_fusionloop_bodydim0_108_en)
);


/*   %54 = fptosi float %53 to i32*/
altfp_fptosi32_6 altfp_fptosi32_6_main_48_54 (
	.result (altfp_fptosi32_main_48_54_out),
	.dataa (main_altfp_fptosi_32_0_op0),
	.clock (clk),
	.clk_en (altfp_main_48_54_en)
);


/*   %55 = sitofp i32 %54 to float*/
altfp_sitofp32_6 altfp_sitofp32_6_main_48_55 (
	.result (altfp_sitofp32_main_48_55_out),
	.dataa (main_altfp_sitofp_32_0_op0),
	.clock (clk),
	.clk_en (altfp_main_48_55_en)
);


/*   %14 = fcmp ueq float %11, 0.000000e+00*/
altfp_compare32_1 altfp_compare32_1_main_reduceinnerloop_bodyreduction_dim1_14 (
	.dataa (main_reduceinnerloop_bodyreduction_dim1_11_reg),
	.datab (32'h0),
	.clock (clk),
	.clk_en (altfp_main_reduceinnerloop_bodyreduction_dim1_14_en),
	.aeb (altfp_compare32_1_main_reduceinnerloop_bodyreduction_dim1_14_out),
	.aneb (main_reduceinnerloop_bodyreduction_dim1_14_unused),
	.alb (main_reduceinnerloop_bodyreduction_dim1_14_unused),
	.aleb (main_reduceinnerloop_bodyreduction_dim1_14_unused),
	.agb (main_reduceinnerloop_bodyreduction_dim1_14_unused),
	.ageb (main_reduceinnerloop_bodyreduction_dim1_14_unused),
	.unordered (main_reduceinnerloop_bodyreduction_dim1_14_unused)
);


/*   %13 = fcmp oge float %11, %12*/
altfp_compare32_1 altfp_compare32_1_main_reduceinnerloop_bodyreduction_dim1_13 (
	.dataa (main_reduceinnerloop_bodyreduction_dim1_11_reg),
	.datab (main_reduceinnerloop_bodyreduction_dim1_12),
	.clock (clk),
	.clk_en (altfp_main_reduceinnerloop_bodyreduction_dim1_13_en),
	.aeb (main_reduceinnerloop_bodyreduction_dim1_13_unused),
	.aneb (main_reduceinnerloop_bodyreduction_dim1_13_unused),
	.alb (main_reduceinnerloop_bodyreduction_dim1_13_unused),
	.aleb (main_reduceinnerloop_bodyreduction_dim1_13_unused),
	.agb (main_reduceinnerloop_bodyreduction_dim1_13_unused),
	.ageb (altfp_compare32_1_main_reduceinnerloop_bodyreduction_dim1_13_out),
	.unordered (main_reduceinnerloop_bodyreduction_dim1_13_unused)
);


/*   %63 = fcmp ogt float %62, 1.000000e+00*/
altfp_compare32_1 altfp_compare32_1_main_60_63 (
	.dataa (main_60_62),
	.datab (32'h3F800000),
	.clock (clk),
	.clk_en (altfp_main_60_63_en),
	.aeb (main_60_63_unused),
	.aneb (main_60_63_unused),
	.alb (main_60_63_unused),
	.aleb (main_60_63_unused),
	.agb (altfp_compare32_1_main_60_63_out),
	.ageb (main_60_63_unused),
	.unordered (main_60_63_unused)
);



always @(posedge clk) begin
if (reset == 1'b1)
	cur_state <= LEGUP_0;
else if (memory_controller_waitrequest == 1'd1)
	cur_state <= cur_state;
else
	cur_state <= next_state;
end

always @(*)
begin
next_state = cur_state;
case(cur_state)  // synthesis parallel_case  
LEGUP_0:
	if ((start == 1'd1))
		next_state = LEGUP_F_main_BB_dotloop_bodyreductionlrph_1;
LEGUP_F_main_BB__26_100:
		next_state = LEGUP_F_main_BB__26_101;
LEGUP_F_main_BB__26_101:
		next_state = LEGUP_F_main_BB__26_102;
LEGUP_F_main_BB__26_102:
		next_state = LEGUP_F_main_BB_expfexit_549;
LEGUP_F_main_BB__26_88:
		next_state = LEGUP_F_main_BB__26_89;
LEGUP_F_main_BB__26_89:
		next_state = LEGUP_F_main_BB__26_90;
LEGUP_F_main_BB__26_90:
		next_state = LEGUP_F_main_BB__26_91;
LEGUP_F_main_BB__26_91:
		next_state = LEGUP_F_main_BB__26_92;
LEGUP_F_main_BB__26_92:
		next_state = LEGUP_F_main_BB__26_93;
LEGUP_F_main_BB__26_93:
		next_state = LEGUP_F_main_BB__26_94;
LEGUP_F_main_BB__26_94:
		next_state = LEGUP_F_main_BB__26_95;
LEGUP_F_main_BB__26_95:
		next_state = LEGUP_F_main_BB__26_96;
LEGUP_F_main_BB__26_96:
		next_state = LEGUP_F_main_BB__26_97;
LEGUP_F_main_BB__26_97:
		next_state = LEGUP_F_main_BB__26_98;
LEGUP_F_main_BB__26_98:
		next_state = LEGUP_F_main_BB__26_99;
LEGUP_F_main_BB__26_99:
		next_state = LEGUP_F_main_BB__26_100;
LEGUP_F_main_BB__28_103:
	if ((main_28_29 == 1'd1))
		next_state = LEGUP_F_main_BB__30_104;
	else if ((main_28_29 == 1'd0))
		next_state = LEGUP_F_main_BB__32_105;
LEGUP_F_main_BB__30_104:
		next_state = LEGUP_F_main_BB_expfexit_549;
LEGUP_F_main_BB__32_105:
	if ((main_32_33 == 1'd1))
		next_state = LEGUP_F_main_BB_expfexit_549;
	else if ((main_32_33 == 1'd0))
		next_state = LEGUP_F_main_BB__34_106;
LEGUP_F_main_BB__34_106:
	if ((main_34_orcond == 1'd1))
		next_state = LEGUP_F_main_BB_expfexit_549;
	else if ((main_34_orcond == 1'd0))
		next_state = LEGUP_F_main_BB_threadpresplit_107;
LEGUP_F_main_BB__38_108:
	if ((main_38_39 == 1'd1))
		next_state = LEGUP_F_main_BB__40_109;
	else if ((main_38_39 == 1'd0))
		next_state = LEGUP_F_main_BB__48_112;
LEGUP_F_main_BB__40_109:
		next_state = LEGUP_F_main_BB__40_110;
LEGUP_F_main_BB__40_110:
		next_state = LEGUP_F_main_BB__40_111;
LEGUP_F_main_BB__40_111:
		next_state = LEGUP_F_main_BB__58_162;
LEGUP_F_main_BB__48_112:
		next_state = LEGUP_F_main_BB__48_113;
LEGUP_F_main_BB__48_113:
		next_state = LEGUP_F_main_BB__48_114;
LEGUP_F_main_BB__48_114:
		next_state = LEGUP_F_main_BB__48_115;
LEGUP_F_main_BB__48_115:
		next_state = LEGUP_F_main_BB__48_116;
LEGUP_F_main_BB__48_116:
		next_state = LEGUP_F_main_BB__48_117;
LEGUP_F_main_BB__48_117:
		next_state = LEGUP_F_main_BB__48_118;
LEGUP_F_main_BB__48_118:
		next_state = LEGUP_F_main_BB__48_119;
LEGUP_F_main_BB__48_119:
		next_state = LEGUP_F_main_BB__48_120;
LEGUP_F_main_BB__48_120:
		next_state = LEGUP_F_main_BB__48_121;
LEGUP_F_main_BB__48_121:
		next_state = LEGUP_F_main_BB__48_122;
LEGUP_F_main_BB__48_122:
		next_state = LEGUP_F_main_BB__48_123;
LEGUP_F_main_BB__48_123:
		next_state = LEGUP_F_main_BB__48_124;
LEGUP_F_main_BB__48_124:
		next_state = LEGUP_F_main_BB__48_125;
LEGUP_F_main_BB__48_125:
		next_state = LEGUP_F_main_BB__48_126;
LEGUP_F_main_BB__48_126:
		next_state = LEGUP_F_main_BB__48_127;
LEGUP_F_main_BB__48_127:
		next_state = LEGUP_F_main_BB__48_128;
LEGUP_F_main_BB__48_128:
		next_state = LEGUP_F_main_BB__48_129;
LEGUP_F_main_BB__48_129:
		next_state = LEGUP_F_main_BB__48_130;
LEGUP_F_main_BB__48_130:
		next_state = LEGUP_F_main_BB__48_131;
LEGUP_F_main_BB__48_131:
		next_state = LEGUP_F_main_BB__48_132;
LEGUP_F_main_BB__48_132:
		next_state = LEGUP_F_main_BB__48_133;
LEGUP_F_main_BB__48_133:
		next_state = LEGUP_F_main_BB__48_134;
LEGUP_F_main_BB__48_134:
		next_state = LEGUP_F_main_BB__48_135;
LEGUP_F_main_BB__48_135:
		next_state = LEGUP_F_main_BB__48_136;
LEGUP_F_main_BB__48_136:
		next_state = LEGUP_F_main_BB__48_137;
LEGUP_F_main_BB__48_137:
		next_state = LEGUP_F_main_BB__48_138;
LEGUP_F_main_BB__48_138:
		next_state = LEGUP_F_main_BB__48_139;
LEGUP_F_main_BB__48_139:
		next_state = LEGUP_F_main_BB__48_140;
LEGUP_F_main_BB__48_140:
		next_state = LEGUP_F_main_BB__48_141;
LEGUP_F_main_BB__48_141:
		next_state = LEGUP_F_main_BB__48_142;
LEGUP_F_main_BB__48_142:
		next_state = LEGUP_F_main_BB__48_143;
LEGUP_F_main_BB__48_143:
		next_state = LEGUP_F_main_BB__48_144;
LEGUP_F_main_BB__48_144:
		next_state = LEGUP_F_main_BB__48_145;
LEGUP_F_main_BB__48_145:
		next_state = LEGUP_F_main_BB__48_146;
LEGUP_F_main_BB__48_146:
		next_state = LEGUP_F_main_BB__48_147;
LEGUP_F_main_BB__48_147:
		next_state = LEGUP_F_main_BB__48_148;
LEGUP_F_main_BB__48_148:
		next_state = LEGUP_F_main_BB__48_149;
LEGUP_F_main_BB__48_149:
		next_state = LEGUP_F_main_BB__48_150;
LEGUP_F_main_BB__48_150:
		next_state = LEGUP_F_main_BB__48_151;
LEGUP_F_main_BB__48_151:
		next_state = LEGUP_F_main_BB__48_152;
LEGUP_F_main_BB__48_152:
		next_state = LEGUP_F_main_BB__48_153;
LEGUP_F_main_BB__48_153:
		next_state = LEGUP_F_main_BB__48_154;
LEGUP_F_main_BB__48_154:
		next_state = LEGUP_F_main_BB__48_155;
LEGUP_F_main_BB__48_155:
		next_state = LEGUP_F_main_BB__48_156;
LEGUP_F_main_BB__48_156:
		next_state = LEGUP_F_main_BB__48_157;
LEGUP_F_main_BB__48_157:
		next_state = LEGUP_F_main_BB__48_158;
LEGUP_F_main_BB__48_158:
		next_state = LEGUP_F_main_BB__48_159;
LEGUP_F_main_BB__48_159:
		next_state = LEGUP_F_main_BB__48_160;
LEGUP_F_main_BB__48_160:
		next_state = LEGUP_F_main_BB__48_161;
LEGUP_F_main_BB__48_161:
		next_state = LEGUP_F_main_BB__58_162;
LEGUP_F_main_BB__58_162:
		next_state = LEGUP_F_main_BB__58_163;
LEGUP_F_main_BB__58_163:
		next_state = LEGUP_F_main_BB__58_164;
LEGUP_F_main_BB__58_164:
		next_state = LEGUP_F_main_BB__58_165;
LEGUP_F_main_BB__58_165:
		next_state = LEGUP_F_main_BB__58_166;
LEGUP_F_main_BB__58_166:
		next_state = LEGUP_F_main_BB__58_167;
LEGUP_F_main_BB__58_167:
		next_state = LEGUP_F_main_BB__58_168;
LEGUP_F_main_BB__58_168:
		next_state = LEGUP_F_main_BB__58_169;
LEGUP_F_main_BB__58_169:
		next_state = LEGUP_F_main_BB__58_170;
LEGUP_F_main_BB__58_170:
		next_state = LEGUP_F_main_BB__58_171;
LEGUP_F_main_BB__58_171:
		next_state = LEGUP_F_main_BB__58_172;
LEGUP_F_main_BB__58_172:
		next_state = LEGUP_F_main_BB__58_173;
LEGUP_F_main_BB__58_173:
		next_state = LEGUP_F_main_BB__58_174;
LEGUP_F_main_BB__58_174:
		next_state = LEGUP_F_main_BB__58_175;
LEGUP_F_main_BB__58_175:
		next_state = LEGUP_F_main_BB__58_176;
LEGUP_F_main_BB__58_176:
		next_state = LEGUP_F_main_BB__58_177;
LEGUP_F_main_BB__58_177:
		next_state = LEGUP_F_main_BB__58_178;
LEGUP_F_main_BB__58_178:
		next_state = LEGUP_F_main_BB__58_179;
LEGUP_F_main_BB__58_179:
		next_state = LEGUP_F_main_BB__58_180;
LEGUP_F_main_BB__58_180:
		next_state = LEGUP_F_main_BB__58_181;
LEGUP_F_main_BB__58_181:
		next_state = LEGUP_F_main_BB__58_182;
LEGUP_F_main_BB__58_182:
		next_state = LEGUP_F_main_BB__58_183;
LEGUP_F_main_BB__58_183:
		next_state = LEGUP_F_main_BB__58_184;
LEGUP_F_main_BB__58_184:
		next_state = LEGUP_F_main_BB__58_185;
LEGUP_F_main_BB__58_185:
		next_state = LEGUP_F_main_BB__58_186;
LEGUP_F_main_BB__58_186:
		next_state = LEGUP_F_main_BB__58_187;
LEGUP_F_main_BB__58_187:
		next_state = LEGUP_F_main_BB__58_188;
LEGUP_F_main_BB__58_188:
		next_state = LEGUP_F_main_BB__58_189;
LEGUP_F_main_BB__58_189:
		next_state = LEGUP_F_main_BB__58_190;
LEGUP_F_main_BB__58_190:
		next_state = LEGUP_F_main_BB__66_222;
LEGUP_F_main_BB__60_191:
		next_state = LEGUP_F_main_BB__60_192;
LEGUP_F_main_BB__60_192:
		next_state = LEGUP_F_main_BB__60_193;
LEGUP_F_main_BB__60_193:
		next_state = LEGUP_F_main_BB__60_194;
LEGUP_F_main_BB__60_194:
		next_state = LEGUP_F_main_BB__60_195;
LEGUP_F_main_BB__60_195:
		next_state = LEGUP_F_main_BB__60_196;
LEGUP_F_main_BB__60_196:
		next_state = LEGUP_F_main_BB__60_197;
LEGUP_F_main_BB__60_197:
		next_state = LEGUP_F_main_BB__60_198;
LEGUP_F_main_BB__60_198:
		next_state = LEGUP_F_main_BB__60_199;
LEGUP_F_main_BB__60_199:
		next_state = LEGUP_F_main_BB__60_200;
LEGUP_F_main_BB__60_200:
		next_state = LEGUP_F_main_BB__60_201;
LEGUP_F_main_BB__60_201:
		next_state = LEGUP_F_main_BB__60_202;
LEGUP_F_main_BB__60_202:
		next_state = LEGUP_F_main_BB__60_203;
LEGUP_F_main_BB__60_203:
		next_state = LEGUP_F_main_BB__60_204;
LEGUP_F_main_BB__60_204:
		next_state = LEGUP_F_main_BB__60_205;
LEGUP_F_main_BB__60_205:
		next_state = LEGUP_F_main_BB__60_206;
LEGUP_F_main_BB__60_206:
	if ((main_60_orcond54 == 1'd1))
		next_state = LEGUP_F_main_BB__64_207;
	else if ((main_60_orcond54 == 1'd0))
		next_state = LEGUP_F_main_BB__66_222;
LEGUP_F_main_BB__64_207:
		next_state = LEGUP_F_main_BB__64_208;
LEGUP_F_main_BB__64_208:
		next_state = LEGUP_F_main_BB__64_209;
LEGUP_F_main_BB__64_209:
		next_state = LEGUP_F_main_BB__64_210;
LEGUP_F_main_BB__64_210:
		next_state = LEGUP_F_main_BB__64_211;
LEGUP_F_main_BB__64_211:
		next_state = LEGUP_F_main_BB__64_212;
LEGUP_F_main_BB__64_212:
		next_state = LEGUP_F_main_BB__64_213;
LEGUP_F_main_BB__64_213:
		next_state = LEGUP_F_main_BB__64_214;
LEGUP_F_main_BB__64_214:
		next_state = LEGUP_F_main_BB__64_215;
LEGUP_F_main_BB__64_215:
		next_state = LEGUP_F_main_BB__64_216;
LEGUP_F_main_BB__64_216:
		next_state = LEGUP_F_main_BB__64_217;
LEGUP_F_main_BB__64_217:
		next_state = LEGUP_F_main_BB__64_218;
LEGUP_F_main_BB__64_218:
		next_state = LEGUP_F_main_BB__64_219;
LEGUP_F_main_BB__64_219:
		next_state = LEGUP_F_main_BB__64_220;
LEGUP_F_main_BB__64_220:
		next_state = LEGUP_F_main_BB__64_221;
LEGUP_F_main_BB__64_221:
		next_state = LEGUP_F_main_BB_expfexit_549;
LEGUP_F_main_BB__66_222:
		next_state = LEGUP_F_main_BB__66_223;
LEGUP_F_main_BB__66_223:
		next_state = LEGUP_F_main_BB__66_224;
LEGUP_F_main_BB__66_224:
		next_state = LEGUP_F_main_BB__66_225;
LEGUP_F_main_BB__66_225:
		next_state = LEGUP_F_main_BB__66_226;
LEGUP_F_main_BB__66_226:
		next_state = LEGUP_F_main_BB__66_227;
LEGUP_F_main_BB__66_227:
		next_state = LEGUP_F_main_BB__66_228;
LEGUP_F_main_BB__66_228:
		next_state = LEGUP_F_main_BB__66_229;
LEGUP_F_main_BB__66_229:
		next_state = LEGUP_F_main_BB__66_230;
LEGUP_F_main_BB__66_230:
		next_state = LEGUP_F_main_BB__66_231;
LEGUP_F_main_BB__66_231:
		next_state = LEGUP_F_main_BB__66_232;
LEGUP_F_main_BB__66_232:
		next_state = LEGUP_F_main_BB__66_233;
LEGUP_F_main_BB__66_233:
		next_state = LEGUP_F_main_BB__66_234;
LEGUP_F_main_BB__66_234:
		next_state = LEGUP_F_main_BB__66_235;
LEGUP_F_main_BB__66_235:
		next_state = LEGUP_F_main_BB__66_236;
LEGUP_F_main_BB__66_236:
		next_state = LEGUP_F_main_BB__66_237;
LEGUP_F_main_BB__66_237:
		next_state = LEGUP_F_main_BB__66_238;
LEGUP_F_main_BB__66_238:
		next_state = LEGUP_F_main_BB__66_239;
LEGUP_F_main_BB__66_239:
		next_state = LEGUP_F_main_BB__66_240;
LEGUP_F_main_BB__66_240:
		next_state = LEGUP_F_main_BB__66_241;
LEGUP_F_main_BB__66_241:
		next_state = LEGUP_F_main_BB__66_242;
LEGUP_F_main_BB__66_242:
		next_state = LEGUP_F_main_BB__66_243;
LEGUP_F_main_BB__66_243:
		next_state = LEGUP_F_main_BB__66_244;
LEGUP_F_main_BB__66_244:
		next_state = LEGUP_F_main_BB__66_245;
LEGUP_F_main_BB__66_245:
		next_state = LEGUP_F_main_BB__66_246;
LEGUP_F_main_BB__66_246:
		next_state = LEGUP_F_main_BB__66_247;
LEGUP_F_main_BB__66_247:
		next_state = LEGUP_F_main_BB__66_248;
LEGUP_F_main_BB__66_248:
		next_state = LEGUP_F_main_BB__66_249;
LEGUP_F_main_BB__66_249:
		next_state = LEGUP_F_main_BB__66_250;
LEGUP_F_main_BB__66_250:
		next_state = LEGUP_F_main_BB__66_251;
LEGUP_F_main_BB__66_251:
		next_state = LEGUP_F_main_BB__66_252;
LEGUP_F_main_BB__66_252:
		next_state = LEGUP_F_main_BB__66_253;
LEGUP_F_main_BB__66_253:
		next_state = LEGUP_F_main_BB__66_254;
LEGUP_F_main_BB__66_254:
		next_state = LEGUP_F_main_BB__66_255;
LEGUP_F_main_BB__66_255:
		next_state = LEGUP_F_main_BB__66_256;
LEGUP_F_main_BB__66_256:
		next_state = LEGUP_F_main_BB__66_257;
LEGUP_F_main_BB__66_257:
		next_state = LEGUP_F_main_BB__66_258;
LEGUP_F_main_BB__66_258:
		next_state = LEGUP_F_main_BB__66_259;
LEGUP_F_main_BB__66_259:
		next_state = LEGUP_F_main_BB__66_260;
LEGUP_F_main_BB__66_260:
		next_state = LEGUP_F_main_BB__66_261;
LEGUP_F_main_BB__66_261:
		next_state = LEGUP_F_main_BB__66_262;
LEGUP_F_main_BB__66_262:
		next_state = LEGUP_F_main_BB__66_263;
LEGUP_F_main_BB__66_263:
		next_state = LEGUP_F_main_BB__66_264;
LEGUP_F_main_BB__66_264:
		next_state = LEGUP_F_main_BB__66_265;
LEGUP_F_main_BB__66_265:
		next_state = LEGUP_F_main_BB__66_266;
LEGUP_F_main_BB__66_266:
		next_state = LEGUP_F_main_BB__66_267;
LEGUP_F_main_BB__66_267:
		next_state = LEGUP_F_main_BB__66_268;
LEGUP_F_main_BB__66_268:
		next_state = LEGUP_F_main_BB__66_269;
LEGUP_F_main_BB__66_269:
		next_state = LEGUP_F_main_BB__66_270;
LEGUP_F_main_BB__66_270:
		next_state = LEGUP_F_main_BB__66_271;
LEGUP_F_main_BB__66_271:
		next_state = LEGUP_F_main_BB__66_272;
LEGUP_F_main_BB__66_272:
		next_state = LEGUP_F_main_BB__66_273;
LEGUP_F_main_BB__66_273:
		next_state = LEGUP_F_main_BB__66_274;
LEGUP_F_main_BB__66_274:
		next_state = LEGUP_F_main_BB__66_275;
LEGUP_F_main_BB__66_275:
		next_state = LEGUP_F_main_BB__66_276;
LEGUP_F_main_BB__66_276:
		next_state = LEGUP_F_main_BB__66_277;
LEGUP_F_main_BB__66_277:
		next_state = LEGUP_F_main_BB__66_278;
LEGUP_F_main_BB__66_278:
		next_state = LEGUP_F_main_BB__66_279;
LEGUP_F_main_BB__66_279:
		next_state = LEGUP_F_main_BB__66_280;
LEGUP_F_main_BB__66_280:
		next_state = LEGUP_F_main_BB__66_281;
LEGUP_F_main_BB__66_281:
		next_state = LEGUP_F_main_BB__66_282;
LEGUP_F_main_BB__66_282:
		next_state = LEGUP_F_main_BB__66_283;
LEGUP_F_main_BB__66_283:
		next_state = LEGUP_F_main_BB__66_284;
LEGUP_F_main_BB__66_284:
		next_state = LEGUP_F_main_BB__66_285;
LEGUP_F_main_BB__66_285:
		next_state = LEGUP_F_main_BB__66_286;
LEGUP_F_main_BB__66_286:
		next_state = LEGUP_F_main_BB__66_287;
LEGUP_F_main_BB__66_287:
		next_state = LEGUP_F_main_BB__66_288;
LEGUP_F_main_BB__66_288:
		next_state = LEGUP_F_main_BB__66_289;
LEGUP_F_main_BB__66_289:
		next_state = LEGUP_F_main_BB__66_290;
LEGUP_F_main_BB__66_290:
		next_state = LEGUP_F_main_BB__66_291;
LEGUP_F_main_BB__66_291:
		next_state = LEGUP_F_main_BB__66_292;
LEGUP_F_main_BB__66_292:
		next_state = LEGUP_F_main_BB__66_293;
LEGUP_F_main_BB__66_293:
		next_state = LEGUP_F_main_BB__66_294;
LEGUP_F_main_BB__66_294:
		next_state = LEGUP_F_main_BB__66_295;
LEGUP_F_main_BB__66_295:
		next_state = LEGUP_F_main_BB__66_296;
LEGUP_F_main_BB__66_296:
		next_state = LEGUP_F_main_BB__66_297;
LEGUP_F_main_BB__66_297:
		next_state = LEGUP_F_main_BB__66_298;
LEGUP_F_main_BB__66_298:
		next_state = LEGUP_F_main_BB__66_299;
LEGUP_F_main_BB__66_299:
		next_state = LEGUP_F_main_BB__66_300;
LEGUP_F_main_BB__66_300:
		next_state = LEGUP_F_main_BB__66_301;
LEGUP_F_main_BB__66_301:
		next_state = LEGUP_F_main_BB__66_302;
LEGUP_F_main_BB__66_302:
		next_state = LEGUP_F_main_BB__66_303;
LEGUP_F_main_BB__66_303:
		next_state = LEGUP_F_main_BB__66_304;
LEGUP_F_main_BB__66_304:
		next_state = LEGUP_F_main_BB__66_305;
LEGUP_F_main_BB__66_305:
		next_state = LEGUP_F_main_BB__66_306;
LEGUP_F_main_BB__66_306:
		next_state = LEGUP_F_main_BB__66_307;
LEGUP_F_main_BB__66_307:
		next_state = LEGUP_F_main_BB__66_308;
LEGUP_F_main_BB__66_308:
		next_state = LEGUP_F_main_BB__66_309;
LEGUP_F_main_BB__66_309:
		next_state = LEGUP_F_main_BB__66_310;
LEGUP_F_main_BB__66_310:
		next_state = LEGUP_F_main_BB__66_311;
LEGUP_F_main_BB__66_311:
		next_state = LEGUP_F_main_BB__66_312;
LEGUP_F_main_BB__66_312:
		next_state = LEGUP_F_main_BB__66_313;
LEGUP_F_main_BB__66_313:
		next_state = LEGUP_F_main_BB__66_314;
LEGUP_F_main_BB__66_314:
		next_state = LEGUP_F_main_BB__66_315;
LEGUP_F_main_BB__66_315:
		next_state = LEGUP_F_main_BB__66_316;
LEGUP_F_main_BB__66_316:
		next_state = LEGUP_F_main_BB__66_317;
LEGUP_F_main_BB__66_317:
		next_state = LEGUP_F_main_BB__66_318;
LEGUP_F_main_BB__66_318:
		next_state = LEGUP_F_main_BB__66_319;
LEGUP_F_main_BB__66_319:
		next_state = LEGUP_F_main_BB__66_320;
LEGUP_F_main_BB__66_320:
		next_state = LEGUP_F_main_BB__66_321;
LEGUP_F_main_BB__66_321:
		next_state = LEGUP_F_main_BB__66_322;
LEGUP_F_main_BB__66_322:
		next_state = LEGUP_F_main_BB__66_323;
LEGUP_F_main_BB__66_323:
		next_state = LEGUP_F_main_BB__66_324;
LEGUP_F_main_BB__66_324:
		next_state = LEGUP_F_main_BB__66_325;
LEGUP_F_main_BB__66_325:
		next_state = LEGUP_F_main_BB__66_326;
LEGUP_F_main_BB__66_326:
		next_state = LEGUP_F_main_BB__66_327;
LEGUP_F_main_BB__66_327:
		next_state = LEGUP_F_main_BB__66_328;
LEGUP_F_main_BB__66_328:
		next_state = LEGUP_F_main_BB__66_329;
LEGUP_F_main_BB__66_329:
		next_state = LEGUP_F_main_BB__66_330;
LEGUP_F_main_BB__66_330:
		next_state = LEGUP_F_main_BB__66_331;
LEGUP_F_main_BB__66_331:
		next_state = LEGUP_F_main_BB__66_332;
LEGUP_F_main_BB__66_332:
		next_state = LEGUP_F_main_BB__66_333;
LEGUP_F_main_BB__66_333:
		next_state = LEGUP_F_main_BB__66_334;
LEGUP_F_main_BB__66_334:
		next_state = LEGUP_F_main_BB__66_335;
LEGUP_F_main_BB__66_335:
		next_state = LEGUP_F_main_BB__66_336;
LEGUP_F_main_BB__66_336:
		next_state = LEGUP_F_main_BB__66_337;
LEGUP_F_main_BB__66_337:
		next_state = LEGUP_F_main_BB__66_338;
LEGUP_F_main_BB__66_338:
		next_state = LEGUP_F_main_BB__66_339;
LEGUP_F_main_BB__66_339:
		next_state = LEGUP_F_main_BB__66_340;
LEGUP_F_main_BB__66_340:
		next_state = LEGUP_F_main_BB__66_341;
LEGUP_F_main_BB__66_341:
		next_state = LEGUP_F_main_BB__66_342;
LEGUP_F_main_BB__66_342:
		next_state = LEGUP_F_main_BB__66_343;
LEGUP_F_main_BB__66_343:
		next_state = LEGUP_F_main_BB__66_344;
LEGUP_F_main_BB__66_344:
		next_state = LEGUP_F_main_BB__66_345;
LEGUP_F_main_BB__66_345:
		next_state = LEGUP_F_main_BB__66_346;
LEGUP_F_main_BB__66_346:
		next_state = LEGUP_F_main_BB__66_347;
LEGUP_F_main_BB__66_347:
		next_state = LEGUP_F_main_BB__66_348;
LEGUP_F_main_BB__66_348:
		next_state = LEGUP_F_main_BB__66_349;
LEGUP_F_main_BB__66_349:
		next_state = LEGUP_F_main_BB__66_350;
LEGUP_F_main_BB__66_350:
		next_state = LEGUP_F_main_BB__66_351;
LEGUP_F_main_BB__66_351:
		next_state = LEGUP_F_main_BB__66_352;
LEGUP_F_main_BB__66_352:
		next_state = LEGUP_F_main_BB__66_353;
LEGUP_F_main_BB__66_353:
		next_state = LEGUP_F_main_BB__66_354;
LEGUP_F_main_BB__66_354:
		next_state = LEGUP_F_main_BB__66_355;
LEGUP_F_main_BB__66_355:
		next_state = LEGUP_F_main_BB__66_356;
LEGUP_F_main_BB__66_356:
		next_state = LEGUP_F_main_BB__66_357;
LEGUP_F_main_BB__66_357:
		next_state = LEGUP_F_main_BB__66_358;
LEGUP_F_main_BB__66_358:
		next_state = LEGUP_F_main_BB__66_359;
LEGUP_F_main_BB__66_359:
		next_state = LEGUP_F_main_BB__66_360;
LEGUP_F_main_BB__66_360:
		next_state = LEGUP_F_main_BB__66_361;
LEGUP_F_main_BB__66_361:
		next_state = LEGUP_F_main_BB__66_362;
LEGUP_F_main_BB__66_362:
		next_state = LEGUP_F_main_BB__66_363;
LEGUP_F_main_BB__66_363:
		next_state = LEGUP_F_main_BB__66_364;
LEGUP_F_main_BB__66_364:
		next_state = LEGUP_F_main_BB__66_365;
LEGUP_F_main_BB__66_365:
		next_state = LEGUP_F_main_BB__66_366;
LEGUP_F_main_BB__66_366:
		next_state = LEGUP_F_main_BB__66_367;
LEGUP_F_main_BB__66_367:
		next_state = LEGUP_F_main_BB__66_368;
LEGUP_F_main_BB__66_368:
		next_state = LEGUP_F_main_BB__66_369;
LEGUP_F_main_BB__66_369:
	if ((main_66_78_reg == 1'd1))
		next_state = LEGUP_F_main_BB__80_370;
	else if ((main_66_78_reg == 1'd0))
		next_state = LEGUP_F_main_BB__85_446;
LEGUP_F_main_BB__80_370:
		next_state = LEGUP_F_main_BB__80_371;
LEGUP_F_main_BB__80_371:
		next_state = LEGUP_F_main_BB__80_372;
LEGUP_F_main_BB__80_372:
		next_state = LEGUP_F_main_BB__80_373;
LEGUP_F_main_BB__80_373:
		next_state = LEGUP_F_main_BB__80_374;
LEGUP_F_main_BB__80_374:
		next_state = LEGUP_F_main_BB__80_375;
LEGUP_F_main_BB__80_375:
		next_state = LEGUP_F_main_BB__80_376;
LEGUP_F_main_BB__80_376:
		next_state = LEGUP_F_main_BB__80_377;
LEGUP_F_main_BB__80_377:
		next_state = LEGUP_F_main_BB__80_378;
LEGUP_F_main_BB__80_378:
		next_state = LEGUP_F_main_BB__80_379;
LEGUP_F_main_BB__80_379:
		next_state = LEGUP_F_main_BB__80_380;
LEGUP_F_main_BB__80_380:
		next_state = LEGUP_F_main_BB__80_381;
LEGUP_F_main_BB__80_381:
		next_state = LEGUP_F_main_BB__80_382;
LEGUP_F_main_BB__80_382:
		next_state = LEGUP_F_main_BB__80_383;
LEGUP_F_main_BB__80_383:
		next_state = LEGUP_F_main_BB__80_384;
LEGUP_F_main_BB__80_384:
		next_state = LEGUP_F_main_BB__80_385;
LEGUP_F_main_BB__80_385:
		next_state = LEGUP_F_main_BB__80_386;
LEGUP_F_main_BB__80_386:
		next_state = LEGUP_F_main_BB__80_387;
LEGUP_F_main_BB__80_387:
		next_state = LEGUP_F_main_BB__80_388;
LEGUP_F_main_BB__80_388:
		next_state = LEGUP_F_main_BB__80_389;
LEGUP_F_main_BB__80_389:
		next_state = LEGUP_F_main_BB__80_390;
LEGUP_F_main_BB__80_390:
		next_state = LEGUP_F_main_BB__80_391;
LEGUP_F_main_BB__80_391:
		next_state = LEGUP_F_main_BB__80_392;
LEGUP_F_main_BB__80_392:
		next_state = LEGUP_F_main_BB__80_393;
LEGUP_F_main_BB__80_393:
		next_state = LEGUP_F_main_BB__80_394;
LEGUP_F_main_BB__80_394:
		next_state = LEGUP_F_main_BB__80_395;
LEGUP_F_main_BB__80_395:
		next_state = LEGUP_F_main_BB__80_396;
LEGUP_F_main_BB__80_396:
		next_state = LEGUP_F_main_BB__80_397;
LEGUP_F_main_BB__80_397:
		next_state = LEGUP_F_main_BB__80_398;
LEGUP_F_main_BB__80_398:
		next_state = LEGUP_F_main_BB__80_399;
LEGUP_F_main_BB__80_399:
		next_state = LEGUP_F_main_BB__80_400;
LEGUP_F_main_BB__80_400:
		next_state = LEGUP_F_main_BB__80_401;
LEGUP_F_main_BB__80_401:
		next_state = LEGUP_F_main_BB__80_402;
LEGUP_F_main_BB__80_402:
		next_state = LEGUP_F_main_BB__80_403;
LEGUP_F_main_BB__80_403:
		next_state = LEGUP_F_main_BB__80_404;
LEGUP_F_main_BB__80_404:
		next_state = LEGUP_F_main_BB__80_405;
LEGUP_F_main_BB__80_405:
		next_state = LEGUP_F_main_BB__80_406;
LEGUP_F_main_BB__80_406:
		next_state = LEGUP_F_main_BB__80_407;
LEGUP_F_main_BB__80_407:
		next_state = LEGUP_F_main_BB__80_408;
LEGUP_F_main_BB__80_408:
		next_state = LEGUP_F_main_BB__80_409;
LEGUP_F_main_BB__80_409:
		next_state = LEGUP_F_main_BB__80_410;
LEGUP_F_main_BB__80_410:
		next_state = LEGUP_F_main_BB__80_411;
LEGUP_F_main_BB__80_411:
		next_state = LEGUP_F_main_BB__80_412;
LEGUP_F_main_BB__80_412:
		next_state = LEGUP_F_main_BB__80_413;
LEGUP_F_main_BB__80_413:
		next_state = LEGUP_F_main_BB__80_414;
LEGUP_F_main_BB__80_414:
		next_state = LEGUP_F_main_BB__80_415;
LEGUP_F_main_BB__80_415:
		next_state = LEGUP_F_main_BB__80_416;
LEGUP_F_main_BB__80_416:
		next_state = LEGUP_F_main_BB__80_417;
LEGUP_F_main_BB__80_417:
		next_state = LEGUP_F_main_BB__80_418;
LEGUP_F_main_BB__80_418:
		next_state = LEGUP_F_main_BB__80_419;
LEGUP_F_main_BB__80_419:
		next_state = LEGUP_F_main_BB__80_420;
LEGUP_F_main_BB__80_420:
		next_state = LEGUP_F_main_BB__80_421;
LEGUP_F_main_BB__80_421:
		next_state = LEGUP_F_main_BB__80_422;
LEGUP_F_main_BB__80_422:
		next_state = LEGUP_F_main_BB__80_423;
LEGUP_F_main_BB__80_423:
		next_state = LEGUP_F_main_BB__80_424;
LEGUP_F_main_BB__80_424:
		next_state = LEGUP_F_main_BB__80_425;
LEGUP_F_main_BB__80_425:
		next_state = LEGUP_F_main_BB__80_426;
LEGUP_F_main_BB__80_426:
		next_state = LEGUP_F_main_BB__80_427;
LEGUP_F_main_BB__80_427:
		next_state = LEGUP_F_main_BB__80_428;
LEGUP_F_main_BB__80_428:
		next_state = LEGUP_F_main_BB__80_429;
LEGUP_F_main_BB__80_429:
		next_state = LEGUP_F_main_BB__80_430;
LEGUP_F_main_BB__80_430:
		next_state = LEGUP_F_main_BB__80_431;
LEGUP_F_main_BB__80_431:
		next_state = LEGUP_F_main_BB__80_432;
LEGUP_F_main_BB__80_432:
		next_state = LEGUP_F_main_BB__80_433;
LEGUP_F_main_BB__80_433:
		next_state = LEGUP_F_main_BB__80_434;
LEGUP_F_main_BB__80_434:
		next_state = LEGUP_F_main_BB__80_435;
LEGUP_F_main_BB__80_435:
		next_state = LEGUP_F_main_BB__80_436;
LEGUP_F_main_BB__80_436:
		next_state = LEGUP_F_main_BB__80_437;
LEGUP_F_main_BB__80_437:
		next_state = LEGUP_F_main_BB__80_438;
LEGUP_F_main_BB__80_438:
		next_state = LEGUP_F_main_BB__80_439;
LEGUP_F_main_BB__80_439:
		next_state = LEGUP_F_main_BB__80_440;
LEGUP_F_main_BB__80_440:
		next_state = LEGUP_F_main_BB__80_441;
LEGUP_F_main_BB__80_441:
		next_state = LEGUP_F_main_BB__80_442;
LEGUP_F_main_BB__80_442:
		next_state = LEGUP_F_main_BB__80_443;
LEGUP_F_main_BB__80_443:
		next_state = LEGUP_F_main_BB__80_444;
LEGUP_F_main_BB__80_444:
		next_state = LEGUP_F_main_BB__80_445;
LEGUP_F_main_BB__80_445:
		next_state = LEGUP_F_main_BB_expfexit_549;
LEGUP_F_main_BB__85_446:
		next_state = LEGUP_F_main_BB__85_447;
LEGUP_F_main_BB__85_447:
		next_state = LEGUP_F_main_BB__85_448;
LEGUP_F_main_BB__85_448:
		next_state = LEGUP_F_main_BB__85_449;
LEGUP_F_main_BB__85_449:
		next_state = LEGUP_F_main_BB__85_450;
LEGUP_F_main_BB__85_450:
		next_state = LEGUP_F_main_BB__85_451;
LEGUP_F_main_BB__85_451:
		next_state = LEGUP_F_main_BB__85_452;
LEGUP_F_main_BB__85_452:
		next_state = LEGUP_F_main_BB__85_453;
LEGUP_F_main_BB__85_453:
		next_state = LEGUP_F_main_BB__85_454;
LEGUP_F_main_BB__85_454:
		next_state = LEGUP_F_main_BB__85_455;
LEGUP_F_main_BB__85_455:
		next_state = LEGUP_F_main_BB__85_456;
LEGUP_F_main_BB__85_456:
		next_state = LEGUP_F_main_BB__85_457;
LEGUP_F_main_BB__85_457:
		next_state = LEGUP_F_main_BB__85_458;
LEGUP_F_main_BB__85_458:
		next_state = LEGUP_F_main_BB__85_459;
LEGUP_F_main_BB__85_459:
		next_state = LEGUP_F_main_BB__85_460;
LEGUP_F_main_BB__85_460:
		next_state = LEGUP_F_main_BB__85_461;
LEGUP_F_main_BB__85_461:
		next_state = LEGUP_F_main_BB__85_462;
LEGUP_F_main_BB__85_462:
		next_state = LEGUP_F_main_BB__85_463;
LEGUP_F_main_BB__85_463:
		next_state = LEGUP_F_main_BB__85_464;
LEGUP_F_main_BB__85_464:
		next_state = LEGUP_F_main_BB__85_465;
LEGUP_F_main_BB__85_465:
		next_state = LEGUP_F_main_BB__85_466;
LEGUP_F_main_BB__85_466:
		next_state = LEGUP_F_main_BB__85_467;
LEGUP_F_main_BB__85_467:
		next_state = LEGUP_F_main_BB__85_468;
LEGUP_F_main_BB__85_468:
		next_state = LEGUP_F_main_BB__85_469;
LEGUP_F_main_BB__85_469:
		next_state = LEGUP_F_main_BB__85_470;
LEGUP_F_main_BB__85_470:
		next_state = LEGUP_F_main_BB__85_471;
LEGUP_F_main_BB__85_471:
		next_state = LEGUP_F_main_BB__85_472;
LEGUP_F_main_BB__85_472:
		next_state = LEGUP_F_main_BB__85_473;
LEGUP_F_main_BB__85_473:
		next_state = LEGUP_F_main_BB__85_474;
LEGUP_F_main_BB__85_474:
		next_state = LEGUP_F_main_BB__85_475;
LEGUP_F_main_BB__85_475:
		next_state = LEGUP_F_main_BB__85_476;
LEGUP_F_main_BB__85_476:
		next_state = LEGUP_F_main_BB__85_477;
LEGUP_F_main_BB__85_477:
		next_state = LEGUP_F_main_BB__85_478;
LEGUP_F_main_BB__85_478:
		next_state = LEGUP_F_main_BB__85_479;
LEGUP_F_main_BB__85_479:
		next_state = LEGUP_F_main_BB__85_480;
LEGUP_F_main_BB__85_480:
		next_state = LEGUP_F_main_BB__85_481;
LEGUP_F_main_BB__85_481:
		next_state = LEGUP_F_main_BB__85_482;
LEGUP_F_main_BB__85_482:
		next_state = LEGUP_F_main_BB__85_483;
LEGUP_F_main_BB__85_483:
		next_state = LEGUP_F_main_BB__85_484;
LEGUP_F_main_BB__85_484:
		next_state = LEGUP_F_main_BB__85_485;
LEGUP_F_main_BB__85_485:
		next_state = LEGUP_F_main_BB__85_486;
LEGUP_F_main_BB__85_486:
		next_state = LEGUP_F_main_BB__85_487;
LEGUP_F_main_BB__85_487:
		next_state = LEGUP_F_main_BB__85_488;
LEGUP_F_main_BB__85_488:
		next_state = LEGUP_F_main_BB__85_489;
LEGUP_F_main_BB__85_489:
		next_state = LEGUP_F_main_BB__85_490;
LEGUP_F_main_BB__85_490:
		next_state = LEGUP_F_main_BB__85_491;
LEGUP_F_main_BB__85_491:
		next_state = LEGUP_F_main_BB__85_492;
LEGUP_F_main_BB__85_492:
		next_state = LEGUP_F_main_BB__85_493;
LEGUP_F_main_BB__85_493:
		next_state = LEGUP_F_main_BB__85_494;
LEGUP_F_main_BB__85_494:
		next_state = LEGUP_F_main_BB__85_495;
LEGUP_F_main_BB__85_495:
		next_state = LEGUP_F_main_BB__85_496;
LEGUP_F_main_BB__85_496:
		next_state = LEGUP_F_main_BB__85_497;
LEGUP_F_main_BB__85_497:
		next_state = LEGUP_F_main_BB__85_498;
LEGUP_F_main_BB__85_498:
		next_state = LEGUP_F_main_BB__85_499;
LEGUP_F_main_BB__85_499:
		next_state = LEGUP_F_main_BB__85_500;
LEGUP_F_main_BB__85_500:
		next_state = LEGUP_F_main_BB__85_501;
LEGUP_F_main_BB__85_501:
		next_state = LEGUP_F_main_BB__85_502;
LEGUP_F_main_BB__85_502:
		next_state = LEGUP_F_main_BB__85_503;
LEGUP_F_main_BB__85_503:
		next_state = LEGUP_F_main_BB__85_504;
LEGUP_F_main_BB__85_504:
		next_state = LEGUP_F_main_BB__85_505;
LEGUP_F_main_BB__85_505:
		next_state = LEGUP_F_main_BB__85_506;
LEGUP_F_main_BB__85_506:
		next_state = LEGUP_F_main_BB__85_507;
LEGUP_F_main_BB__85_507:
		next_state = LEGUP_F_main_BB__85_508;
LEGUP_F_main_BB__85_508:
		next_state = LEGUP_F_main_BB__85_509;
LEGUP_F_main_BB__85_509:
		next_state = LEGUP_F_main_BB__85_510;
LEGUP_F_main_BB__85_510:
		next_state = LEGUP_F_main_BB__85_511;
LEGUP_F_main_BB__85_511:
		next_state = LEGUP_F_main_BB__85_512;
LEGUP_F_main_BB__85_512:
		next_state = LEGUP_F_main_BB__85_513;
LEGUP_F_main_BB__85_513:
		next_state = LEGUP_F_main_BB__85_514;
LEGUP_F_main_BB__85_514:
		next_state = LEGUP_F_main_BB__85_515;
LEGUP_F_main_BB__85_515:
		next_state = LEGUP_F_main_BB__85_516;
LEGUP_F_main_BB__85_516:
		next_state = LEGUP_F_main_BB__85_517;
LEGUP_F_main_BB__85_517:
		next_state = LEGUP_F_main_BB__85_518;
LEGUP_F_main_BB__85_518:
		next_state = LEGUP_F_main_BB__85_519;
LEGUP_F_main_BB__85_519:
		next_state = LEGUP_F_main_BB__85_520;
LEGUP_F_main_BB__85_520:
		next_state = LEGUP_F_main_BB__85_521;
LEGUP_F_main_BB__85_521:
		next_state = LEGUP_F_main_BB__85_522;
LEGUP_F_main_BB__85_522:
		next_state = LEGUP_F_main_BB__85_523;
LEGUP_F_main_BB__85_523:
		next_state = LEGUP_F_main_BB__85_524;
LEGUP_F_main_BB__85_524:
		next_state = LEGUP_F_main_BB__85_525;
LEGUP_F_main_BB__85_525:
		next_state = LEGUP_F_main_BB__85_526;
LEGUP_F_main_BB__85_526:
		next_state = LEGUP_F_main_BB__85_527;
LEGUP_F_main_BB__85_527:
		next_state = LEGUP_F_main_BB__85_528;
LEGUP_F_main_BB__85_528:
		next_state = LEGUP_F_main_BB__85_529;
LEGUP_F_main_BB__85_529:
		next_state = LEGUP_F_main_BB__85_530;
LEGUP_F_main_BB__85_530:
		next_state = LEGUP_F_main_BB__85_531;
LEGUP_F_main_BB__85_531:
		next_state = LEGUP_F_main_BB__85_532;
LEGUP_F_main_BB__85_532:
		next_state = LEGUP_F_main_BB__85_533;
LEGUP_F_main_BB__85_533:
		next_state = LEGUP_F_main_BB__85_534;
LEGUP_F_main_BB__85_534:
		next_state = LEGUP_F_main_BB__85_535;
LEGUP_F_main_BB__85_535:
	if ((main_85_91_reg == 1'd1))
		next_state = LEGUP_F_main_BB__94_536;
	else if ((main_85_91_reg == 1'd0))
		next_state = LEGUP_F_main_BB__97_537;
LEGUP_F_main_BB__94_536:
		next_state = LEGUP_F_main_BB_expfexit_549;
LEGUP_F_main_BB__97_537:
		next_state = LEGUP_F_main_BB__97_538;
LEGUP_F_main_BB__97_538:
		next_state = LEGUP_F_main_BB__97_539;
LEGUP_F_main_BB__97_539:
		next_state = LEGUP_F_main_BB__97_540;
LEGUP_F_main_BB__97_540:
		next_state = LEGUP_F_main_BB__97_541;
LEGUP_F_main_BB__97_541:
		next_state = LEGUP_F_main_BB__97_542;
LEGUP_F_main_BB__97_542:
		next_state = LEGUP_F_main_BB__97_543;
LEGUP_F_main_BB__97_543:
		next_state = LEGUP_F_main_BB__97_544;
LEGUP_F_main_BB__97_544:
		next_state = LEGUP_F_main_BB__97_545;
LEGUP_F_main_BB__97_545:
		next_state = LEGUP_F_main_BB__97_546;
LEGUP_F_main_BB__97_546:
		next_state = LEGUP_F_main_BB__97_547;
LEGUP_F_main_BB__97_547:
		next_state = LEGUP_F_main_BB__97_548;
LEGUP_F_main_BB__97_548:
		next_state = LEGUP_F_main_BB_expfexit_549;
LEGUP_F_main_BB_dotloop_bodyreduction_10:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_11;
LEGUP_F_main_BB_dotloop_bodyreduction_11:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_12;
LEGUP_F_main_BB_dotloop_bodyreduction_12:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_13;
LEGUP_F_main_BB_dotloop_bodyreduction_13:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_14;
LEGUP_F_main_BB_dotloop_bodyreduction_14:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_15;
LEGUP_F_main_BB_dotloop_bodyreduction_15:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_16;
LEGUP_F_main_BB_dotloop_bodyreduction_16:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_17;
LEGUP_F_main_BB_dotloop_bodyreduction_17:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_18;
LEGUP_F_main_BB_dotloop_bodyreduction_18:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_19;
LEGUP_F_main_BB_dotloop_bodyreduction_19:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_20;
LEGUP_F_main_BB_dotloop_bodyreduction_2:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_3;
LEGUP_F_main_BB_dotloop_bodyreduction_20:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_21;
LEGUP_F_main_BB_dotloop_bodyreduction_21:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_22;
LEGUP_F_main_BB_dotloop_bodyreduction_22:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_23;
LEGUP_F_main_BB_dotloop_bodyreduction_23:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_24;
LEGUP_F_main_BB_dotloop_bodyreduction_24:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_25;
LEGUP_F_main_BB_dotloop_bodyreduction_25:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_26;
LEGUP_F_main_BB_dotloop_bodyreduction_26:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_27;
LEGUP_F_main_BB_dotloop_bodyreduction_27:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_28;
LEGUP_F_main_BB_dotloop_bodyreduction_28:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_29;
LEGUP_F_main_BB_dotloop_bodyreduction_29:
	if ((main_dotloop_bodyreduction_exitcond18_reg == 1'd1))
		next_state = LEGUP_F_main_BB_dotloop_exitreduction_30;
	else if ((main_dotloop_bodyreduction_exitcond18_reg == 1'd0))
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_2;
LEGUP_F_main_BB_dotloop_bodyreduction_3:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_4;
LEGUP_F_main_BB_dotloop_bodyreduction_4:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_5;
LEGUP_F_main_BB_dotloop_bodyreduction_5:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_6;
LEGUP_F_main_BB_dotloop_bodyreduction_6:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_7;
LEGUP_F_main_BB_dotloop_bodyreduction_7:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_8;
LEGUP_F_main_BB_dotloop_bodyreduction_8:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_9;
LEGUP_F_main_BB_dotloop_bodyreduction_9:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_10;
LEGUP_F_main_BB_dotloop_bodyreductionlrph_1:
		next_state = LEGUP_F_main_BB_dotloop_bodyreduction_2;
LEGUP_F_main_BB_dotloop_exitreduction_30:
		next_state = LEGUP_F_main_BB_dotloop_exitreduction_31;
LEGUP_F_main_BB_dotloop_exitreduction_31:
	if ((main_dotloop_exitreduction_exitcond21_reg == 1'd1))
		next_state = LEGUP_F_main_BB_fusion2loop_bodydim1preheader_32;
	else if ((main_dotloop_exitreduction_exitcond21_reg == 1'd0))
		next_state = LEGUP_F_main_BB_dotloop_bodyreductionlrph_1;
LEGUP_F_main_BB_expfexit_549:
		next_state = LEGUP_F_main_BB_expfexit_550;
LEGUP_F_main_BB_expfexit_550:
	if ((main_expfexit_exitcond4_reg == 1'd1))
		next_state = LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1preheader_551;
	else if ((main_expfexit_exitcond4_reg == 1'd0))
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_57;
LEGUP_F_main_BB_fusion1loop_bodydim1_57:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_58;
LEGUP_F_main_BB_fusion1loop_bodydim1_58:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_59;
LEGUP_F_main_BB_fusion1loop_bodydim1_59:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_60;
LEGUP_F_main_BB_fusion1loop_bodydim1_60:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_61;
LEGUP_F_main_BB_fusion1loop_bodydim1_61:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_62;
LEGUP_F_main_BB_fusion1loop_bodydim1_62:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_63;
LEGUP_F_main_BB_fusion1loop_bodydim1_63:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_64;
LEGUP_F_main_BB_fusion1loop_bodydim1_64:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_65;
LEGUP_F_main_BB_fusion1loop_bodydim1_65:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_66;
LEGUP_F_main_BB_fusion1loop_bodydim1_66:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_67;
LEGUP_F_main_BB_fusion1loop_bodydim1_67:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_68;
LEGUP_F_main_BB_fusion1loop_bodydim1_68:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_69;
LEGUP_F_main_BB_fusion1loop_bodydim1_69:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_70;
LEGUP_F_main_BB_fusion1loop_bodydim1_70:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_71;
LEGUP_F_main_BB_fusion1loop_bodydim1_71:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_72;
LEGUP_F_main_BB_fusion1loop_bodydim1_72:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_73;
LEGUP_F_main_BB_fusion1loop_bodydim1_73:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_74;
LEGUP_F_main_BB_fusion1loop_bodydim1_74:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_75;
LEGUP_F_main_BB_fusion1loop_bodydim1_75:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_76;
LEGUP_F_main_BB_fusion1loop_bodydim1_76:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_77;
LEGUP_F_main_BB_fusion1loop_bodydim1_77:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_78;
LEGUP_F_main_BB_fusion1loop_bodydim1_78:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_79;
LEGUP_F_main_BB_fusion1loop_bodydim1_79:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_80;
LEGUP_F_main_BB_fusion1loop_bodydim1_80:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_81;
LEGUP_F_main_BB_fusion1loop_bodydim1_81:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_82;
LEGUP_F_main_BB_fusion1loop_bodydim1_82:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_83;
LEGUP_F_main_BB_fusion1loop_bodydim1_83:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_84;
LEGUP_F_main_BB_fusion1loop_bodydim1_84:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_85;
LEGUP_F_main_BB_fusion1loop_bodydim1_85:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_86;
LEGUP_F_main_BB_fusion1loop_bodydim1_86:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_87;
LEGUP_F_main_BB_fusion1loop_bodydim1_87:
	if ((main_fusion1loop_bodydim1_25 == 1'd1))
		next_state = LEGUP_F_main_BB__26_88;
	else if ((main_fusion1loop_bodydim1_25 == 1'd0))
		next_state = LEGUP_F_main_BB__28_103;
LEGUP_F_main_BB_fusion1loop_bodydim1preheader_56:
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1_57;
LEGUP_F_main_BB_fusion2loop_bodydim1_33:
		next_state = LEGUP_F_main_BB_fusion2loop_bodydim1_34;
LEGUP_F_main_BB_fusion2loop_bodydim1_34:
		next_state = LEGUP_F_main_BB_fusion2loop_bodydim1_35;
LEGUP_F_main_BB_fusion2loop_bodydim1_35:
		next_state = LEGUP_F_main_BB_fusion2loop_bodydim1_36;
LEGUP_F_main_BB_fusion2loop_bodydim1_36:
		next_state = LEGUP_F_main_BB_fusion2loop_bodydim1_37;
LEGUP_F_main_BB_fusion2loop_bodydim1_37:
		next_state = LEGUP_F_main_BB_fusion2loop_bodydim1_38;
LEGUP_F_main_BB_fusion2loop_bodydim1_38:
		next_state = LEGUP_F_main_BB_fusion2loop_bodydim1_39;
LEGUP_F_main_BB_fusion2loop_bodydim1_39:
		next_state = LEGUP_F_main_BB_fusion2loop_bodydim1_40;
LEGUP_F_main_BB_fusion2loop_bodydim1_40:
		next_state = LEGUP_F_main_BB_fusion2loop_bodydim1_41;
LEGUP_F_main_BB_fusion2loop_bodydim1_41:
		next_state = LEGUP_F_main_BB_fusion2loop_bodydim1_42;
LEGUP_F_main_BB_fusion2loop_bodydim1_42:
		next_state = LEGUP_F_main_BB_fusion2loop_bodydim1_43;
LEGUP_F_main_BB_fusion2loop_bodydim1_43:
		next_state = LEGUP_F_main_BB_fusion2loop_bodydim1_44;
LEGUP_F_main_BB_fusion2loop_bodydim1_44:
		next_state = LEGUP_F_main_BB_fusion2loop_bodydim1_45;
LEGUP_F_main_BB_fusion2loop_bodydim1_45:
		next_state = LEGUP_F_main_BB_fusion2loop_bodydim1_46;
LEGUP_F_main_BB_fusion2loop_bodydim1_46:
		next_state = LEGUP_F_main_BB_fusion2loop_bodydim1_47;
LEGUP_F_main_BB_fusion2loop_bodydim1_47:
		next_state = LEGUP_F_main_BB_fusion2loop_bodydim1_48;
LEGUP_F_main_BB_fusion2loop_bodydim1_48:
		next_state = LEGUP_F_main_BB_fusion2loop_bodydim1_49;
LEGUP_F_main_BB_fusion2loop_bodydim1_49:
		next_state = LEGUP_F_main_BB_fusion2loop_bodydim1_50;
LEGUP_F_main_BB_fusion2loop_bodydim1_50:
	if ((main_fusion2loop_bodydim1_exitcond14_reg == 1'd1))
		next_state = LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1preheader_51;
	else if ((main_fusion2loop_bodydim1_exitcond14_reg == 1'd0))
		next_state = LEGUP_F_main_BB_fusion2loop_bodydim1_33;
LEGUP_F_main_BB_fusion2loop_bodydim1preheader_32:
		next_state = LEGUP_F_main_BB_fusion2loop_bodydim1_33;
LEGUP_F_main_BB_fusionloop_bodydim0_570:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_571;
LEGUP_F_main_BB_fusionloop_bodydim0_571:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_572;
LEGUP_F_main_BB_fusionloop_bodydim0_572:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_573;
LEGUP_F_main_BB_fusionloop_bodydim0_573:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_574;
LEGUP_F_main_BB_fusionloop_bodydim0_574:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_575;
LEGUP_F_main_BB_fusionloop_bodydim0_575:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_576;
LEGUP_F_main_BB_fusionloop_bodydim0_576:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_577;
LEGUP_F_main_BB_fusionloop_bodydim0_577:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_578;
LEGUP_F_main_BB_fusionloop_bodydim0_578:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_579;
LEGUP_F_main_BB_fusionloop_bodydim0_579:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_580;
LEGUP_F_main_BB_fusionloop_bodydim0_580:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_581;
LEGUP_F_main_BB_fusionloop_bodydim0_581:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_582;
LEGUP_F_main_BB_fusionloop_bodydim0_582:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_583;
LEGUP_F_main_BB_fusionloop_bodydim0_583:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_584;
LEGUP_F_main_BB_fusionloop_bodydim0_584:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_585;
LEGUP_F_main_BB_fusionloop_bodydim0_585:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_586;
LEGUP_F_main_BB_fusionloop_bodydim0_586:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_587;
LEGUP_F_main_BB_fusionloop_bodydim0_587:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_588;
LEGUP_F_main_BB_fusionloop_bodydim0_588:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_589;
LEGUP_F_main_BB_fusionloop_bodydim0_589:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_590;
LEGUP_F_main_BB_fusionloop_bodydim0_590:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_591;
LEGUP_F_main_BB_fusionloop_bodydim0_591:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_592;
LEGUP_F_main_BB_fusionloop_bodydim0_592:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_593;
LEGUP_F_main_BB_fusionloop_bodydim0_593:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_594;
LEGUP_F_main_BB_fusionloop_bodydim0_594:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_595;
LEGUP_F_main_BB_fusionloop_bodydim0_595:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_596;
LEGUP_F_main_BB_fusionloop_bodydim0_596:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_597;
LEGUP_F_main_BB_fusionloop_bodydim0_597:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_598;
LEGUP_F_main_BB_fusionloop_bodydim0_598:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_599;
LEGUP_F_main_BB_fusionloop_bodydim0_599:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_600;
LEGUP_F_main_BB_fusionloop_bodydim0_600:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_601;
LEGUP_F_main_BB_fusionloop_bodydim0_601:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_602;
LEGUP_F_main_BB_fusionloop_bodydim0_602:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_603;
LEGUP_F_main_BB_fusionloop_bodydim0_603:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_604;
LEGUP_F_main_BB_fusionloop_bodydim0_604:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_605;
LEGUP_F_main_BB_fusionloop_bodydim0_605:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_606;
LEGUP_F_main_BB_fusionloop_bodydim0_606:
	if ((main_fusionloop_bodydim0_exitcond1_reg == 1'd1))
		next_state = LEGUP_F_main_BB_fusionloop_exitdim0_607;
	else if ((main_fusionloop_bodydim0_exitcond1_reg == 1'd0))
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_570;
LEGUP_F_main_BB_fusionloop_bodydim0preheader_569:
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0_570;
LEGUP_F_main_BB_fusionloop_exitdim0_607:
		next_state = LEGUP_F_main_BB_fusionloop_exitdim0_608;
LEGUP_F_main_BB_fusionloop_exitdim0_608:
		next_state = LEGUP_F_main_BB_fusionloop_exitdim0_609;
LEGUP_F_main_BB_fusionloop_exitdim0_609:
		next_state = LEGUP_0;
LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_552:
		next_state = LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_553;
LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_553:
		next_state = LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_554;
LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_554:
		next_state = LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_555;
LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_555:
		next_state = LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_556;
LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_556:
		next_state = LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_557;
LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_557:
		next_state = LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_558;
LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_558:
		next_state = LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_559;
LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_559:
		next_state = LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_560;
LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_560:
		next_state = LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_561;
LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_561:
		next_state = LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_562;
LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_562:
		next_state = LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_563;
LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_563:
		next_state = LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_564;
LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_564:
		next_state = LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_565;
LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_565:
		next_state = LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_566;
LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_566:
		next_state = LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_567;
LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_567:
		next_state = LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_568;
LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_568:
	if ((main_reduce1innerloop_bodyreduction_dim1_exitcond_reg == 1'd1))
		next_state = LEGUP_F_main_BB_fusionloop_bodydim0preheader_569;
	else if ((main_reduce1innerloop_bodyreduction_dim1_exitcond_reg == 1'd0))
		next_state = LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_552;
LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1preheader_551:
		next_state = LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_552;
LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_52:
		next_state = LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_53;
LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_53:
		next_state = LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_54;
LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_54:
		next_state = LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_55;
LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_55:
	if ((main_reduceinnerloop_bodyreduction_dim1_exitcond12_reg == 1'd1))
		next_state = LEGUP_F_main_BB_fusion1loop_bodydim1preheader_56;
	else if ((main_reduceinnerloop_bodyreduction_dim1_exitcond12_reg == 1'd0))
		next_state = LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_52;
LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1preheader_51:
		next_state = LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_52;
LEGUP_F_main_BB_threadpresplit_107:
	if ((main_threadpresplit_37 == 1'd1))
		next_state = LEGUP_F_main_BB__38_108;
	else if ((main_threadpresplit_37 == 1'd0))
		next_state = LEGUP_F_main_BB__60_191;
default:
	next_state = cur_state;
endcase

end
always @(*) begin
	/* main: %dot.loop_body.reduction.lr.ph*/
	/*   %dot.indvar.rhs.122 = phi i64 [ 0, %dot.loop_body.rhs.1.lr.ph ], [ %6, %dot.loop_exit.reduction ]*/
	if ((((cur_state == LEGUP_0) & (memory_controller_waitrequest == 1'd0)) & (start == 1'd1))) begin
		main_dotloop_bodyreductionlrph_dotindvarrhs122 = 64'd0;
	end
	/* main: %dot.loop_body.reduction.lr.ph*/
	/*   %dot.indvar.rhs.122 = phi i64 [ 0, %dot.loop_body.rhs.1.lr.ph ], [ %6, %dot.loop_exit.reduction ]*/
	else /* if ((((cur_state == LEGUP_F_main_BB_dotloop_exitreduction_31) & (memory_controller_waitrequest == 1'd0)) & (main_dotloop_exitreduction_exitcond21_reg == 1'd0))) */ begin
		main_dotloop_bodyreductionlrph_dotindvarrhs122 = main_dotloop_exitreduction_6_reg;
	end
end
always @(posedge clk) begin
	/* main: %dot.loop_body.reduction.lr.ph*/
	/*   %dot.indvar.rhs.122 = phi i64 [ 0, %dot.loop_body.rhs.1.lr.ph ], [ %6, %dot.loop_exit.reduction ]*/
	if ((((cur_state == LEGUP_0) & (memory_controller_waitrequest == 1'd0)) & (start == 1'd1))) begin
		main_dotloop_bodyreductionlrph_dotindvarrhs122_reg <= main_dotloop_bodyreductionlrph_dotindvarrhs122;
		if (start == 1'b0 && ^(main_dotloop_bodyreductionlrph_dotindvarrhs122) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreductionlrph_dotindvarrhs122_reg"); $finish; end
	end
	/* main: %dot.loop_body.reduction.lr.ph*/
	/*   %dot.indvar.rhs.122 = phi i64 [ 0, %dot.loop_body.rhs.1.lr.ph ], [ %6, %dot.loop_exit.reduction ]*/
	if ((((cur_state == LEGUP_F_main_BB_dotloop_exitreduction_31) & (memory_controller_waitrequest == 1'd0)) & (main_dotloop_exitreduction_exitcond21_reg == 1'd0))) begin
		main_dotloop_bodyreductionlrph_dotindvarrhs122_reg <= main_dotloop_bodyreductionlrph_dotindvarrhs122;
		if (start == 1'b0 && ^(main_dotloop_bodyreductionlrph_dotindvarrhs122) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreductionlrph_dotindvarrhs122_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %dot.loop_body.reduction.lr.ph*/
	/*   %scevgep23 = getelementptr [1 x [10 x float]]* @temp0, i64 0, i64 0, i64 %dot.indvar.rhs.122*/
		main_dotloop_bodyreductionlrph_scevgep23 = (`TAG_g_temp0_a + (64'd4 * main_dotloop_bodyreductionlrph_dotindvarrhs122_reg));
end
always @(posedge clk) begin
	/* main: %dot.loop_body.reduction.lr.ph*/
	/*   %scevgep23 = getelementptr [1 x [10 x float]]* @temp0, i64 0, i64 0, i64 %dot.indvar.rhs.122*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_bodyreductionlrph_1)) begin
		main_dotloop_bodyreductionlrph_scevgep23_reg <= main_dotloop_bodyreductionlrph_scevgep23;
		if (start == 1'b0 && ^(main_dotloop_bodyreductionlrph_scevgep23) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreductionlrph_scevgep23_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %dot.loop_body.reduction*/
	/*   %0 = phi float [ 0.000000e+00, %dot.loop_body.reduction.lr.ph ], [ %4, %dot.loop_body.reduction ]*/
	if (((cur_state == LEGUP_F_main_BB_dotloop_bodyreductionlrph_1) & (memory_controller_waitrequest == 1'd0))) begin
		main_dotloop_bodyreduction_0 = 32'h0;
	end
	/* main: %dot.loop_body.reduction*/
	/*   %0 = phi float [ 0.000000e+00, %dot.loop_body.reduction.lr.ph ], [ %4, %dot.loop_body.reduction ]*/
	else /* if ((((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_29) & (memory_controller_waitrequest == 1'd0)) & (main_dotloop_bodyreduction_exitcond18_reg == 1'd0))) */ begin
		main_dotloop_bodyreduction_0 = main_dotloop_bodyreduction_4;
	end
end
always @(posedge clk) begin
	/* main: %dot.loop_body.reduction*/
	/*   %0 = phi float [ 0.000000e+00, %dot.loop_body.reduction.lr.ph ], [ %4, %dot.loop_body.reduction ]*/
	if (((cur_state == LEGUP_F_main_BB_dotloop_bodyreductionlrph_1) & (memory_controller_waitrequest == 1'd0))) begin
		main_dotloop_bodyreduction_0_reg <= main_dotloop_bodyreduction_0;
		if (start == 1'b0 && ^(main_dotloop_bodyreduction_0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_0_reg"); $finish; end
	end
	/* main: %dot.loop_body.reduction*/
	/*   %0 = phi float [ 0.000000e+00, %dot.loop_body.reduction.lr.ph ], [ %4, %dot.loop_body.reduction ]*/
	if ((((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_29) & (memory_controller_waitrequest == 1'd0)) & (main_dotloop_bodyreduction_exitcond18_reg == 1'd0))) begin
		main_dotloop_bodyreduction_0_reg <= main_dotloop_bodyreduction_0;
		if (start == 1'b0 && ^(main_dotloop_bodyreduction_0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_0_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %dot.loop_body.reduction*/
	/*   %dot.indvar.reduction20 = phi i64 [ 0, %dot.loop_body.reduction.lr.ph ], [ %5, %dot.loop_body.reduction ]*/
	if (((cur_state == LEGUP_F_main_BB_dotloop_bodyreductionlrph_1) & (memory_controller_waitrequest == 1'd0))) begin
		main_dotloop_bodyreduction_dotindvarreduction20 = 64'd0;
	end
	/* main: %dot.loop_body.reduction*/
	/*   %dot.indvar.reduction20 = phi i64 [ 0, %dot.loop_body.reduction.lr.ph ], [ %5, %dot.loop_body.reduction ]*/
	else /* if ((((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_29) & (memory_controller_waitrequest == 1'd0)) & (main_dotloop_bodyreduction_exitcond18_reg == 1'd0))) */ begin
		main_dotloop_bodyreduction_dotindvarreduction20 = main_dotloop_bodyreduction_5_reg;
	end
end
always @(posedge clk) begin
	/* main: %dot.loop_body.reduction*/
	/*   %dot.indvar.reduction20 = phi i64 [ 0, %dot.loop_body.reduction.lr.ph ], [ %5, %dot.loop_body.reduction ]*/
	if (((cur_state == LEGUP_F_main_BB_dotloop_bodyreductionlrph_1) & (memory_controller_waitrequest == 1'd0))) begin
		main_dotloop_bodyreduction_dotindvarreduction20_reg <= main_dotloop_bodyreduction_dotindvarreduction20;
		if (start == 1'b0 && ^(main_dotloop_bodyreduction_dotindvarreduction20) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_dotindvarreduction20_reg"); $finish; end
	end
	/* main: %dot.loop_body.reduction*/
	/*   %dot.indvar.reduction20 = phi i64 [ 0, %dot.loop_body.reduction.lr.ph ], [ %5, %dot.loop_body.reduction ]*/
	if ((((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_29) & (memory_controller_waitrequest == 1'd0)) & (main_dotloop_bodyreduction_exitcond18_reg == 1'd0))) begin
		main_dotloop_bodyreduction_dotindvarreduction20_reg <= main_dotloop_bodyreduction_dotindvarreduction20;
		if (start == 1'b0 && ^(main_dotloop_bodyreduction_dotindvarreduction20) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_dotindvarreduction20_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %dot.loop_body.reduction*/
	/*   %scevgep19 = getelementptr [784 x [10 x float]]* @param1, i64 0, i64 %dot.indvar.reduction20, i64 %dot.indvar.rhs.122*/
		main_dotloop_bodyreduction_scevgep19 = (`TAG_g_param1_a + ((64'd40 * main_dotloop_bodyreduction_dotindvarreduction20_reg) + (64'd4 * main_dotloop_bodyreductionlrph_dotindvarrhs122_reg)));
end
always @(*) begin
	/* main: %dot.loop_body.reduction*/
	/*   %scevgep20 = getelementptr [1 x [784 x float]]* @param2, i64 0, i64 0, i64 %dot.indvar.reduction20*/
		main_dotloop_bodyreduction_scevgep20 = (`TAG_g_param2_a + (64'd4 * main_dotloop_bodyreduction_dotindvarreduction20_reg));
end
always @(*) begin
	/* main: %dot.loop_body.reduction*/
	/*   %1 = load volatile float* %scevgep20, align 4*/
		main_dotloop_bodyreduction_1 = memory_controller_out_a[31:0];
end
always @(*) begin
	/* main: %dot.loop_body.reduction*/
	/*   %2 = load volatile float* %scevgep19, align 4*/
		main_dotloop_bodyreduction_2 = memory_controller_out_b[31:0];
end
always @(*) begin
	main_dotloop_bodyreduction_3 = main_altfp_multiply_32_0;
end
always @(posedge clk) begin
	/* main: %dot.loop_body.reduction*/
	/*   %3 = fmul float %1, %2*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_15)) begin
		main_dotloop_bodyreduction_3_reg <= main_dotloop_bodyreduction_3;
		if (start == 1'b0 && ^(main_dotloop_bodyreduction_3) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_3_reg"); $finish; end
	end
	/* main: %dot.loop_body.reduction*/
	/*   %3 = fmul float %1, %2*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_15)) begin
		main_dotloop_bodyreduction_3_reg <= main_dotloop_bodyreduction_3;
		if (start == 1'b0 && ^(main_dotloop_bodyreduction_3) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_3_reg"); $finish; end
	end
	/* main: %48*/
	/*   %49 = fmul float %21, 0x3FF7154760000000*/
	if ((cur_state == LEGUP_F_main_BB__48_123)) begin
		main_dotloop_bodyreduction_3_reg <= main_48_49;
		if (start == 1'b0 && ^(main_48_49) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_3_reg"); $finish; end
	end
	/* main: %66*/
	/*   %67 = fmul float %.048, %.048*/
	if ((cur_state == LEGUP_F_main_BB__66_233)) begin
		main_dotloop_bodyreduction_3_reg <= main_66_67;
		if (start == 1'b0 && ^(main_66_67) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_3_reg"); $finish; end
	end
	/* main: %97*/
	/*   %101 = fmul float %100, 0x39B0000000000000*/
	if ((cur_state == LEGUP_F_main_BB__97_548)) begin
		main_dotloop_bodyreduction_3_reg <= main_97_101;
		if (start == 1'b0 && ^(main_97_101) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_3_reg"); $finish; end
	end
end
always @(*) begin
	main_dotloop_bodyreduction_4 = main_altfp_add_32_0;
end
always @(posedge clk) begin
	/* main: %dot.loop_body.reduction*/
	/*   %4 = fadd float %0, %3*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_29)) begin
		main_dotloop_bodyreduction_4_reg <= main_dotloop_bodyreduction_4;
		if (start == 1'b0 && ^(main_dotloop_bodyreduction_4) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_4_reg"); $finish; end
	end
	/* main: %dot.loop_body.reduction*/
	/*   %4 = fadd float %0, %3*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_29)) begin
		main_dotloop_bodyreduction_4_reg <= main_dotloop_bodyreduction_4;
		if (start == 1'b0 && ^(main_dotloop_bodyreduction_4) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_4_reg"); $finish; end
	end
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %20 = fadd float %18, %19*/
	if ((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1_73)) begin
		main_dotloop_bodyreduction_4_reg <= main_fusion1loop_bodydim1_20;
		if (start == 1'b0 && ^(main_fusion1loop_bodydim1_20) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_4_reg"); $finish; end
	end
	/* main: %26*/
	/*   %27 = fadd float %21, %21*/
	if ((cur_state == LEGUP_F_main_BB__26_102)) begin
		main_dotloop_bodyreduction_4_reg <= main_26_27;
		if (start == 1'b0 && ^(main_26_27) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_4_reg"); $finish; end
	end
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %9 = fadd float %7, %8*/
	if ((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_49)) begin
		main_dotloop_bodyreduction_4_reg <= main_fusion2loop_bodydim1_9;
		if (start == 1'b0 && ^(main_fusion2loop_bodydim1_9) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_4_reg"); $finish; end
	end
	/* main: %48*/
	/*   %53 = fadd float %49, %52*/
	if ((cur_state == LEGUP_F_main_BB__48_137)) begin
		main_dotloop_bodyreduction_4_reg <= main_48_53;
		if (start == 1'b0 && ^(main_48_53) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_4_reg"); $finish; end
	end
	/* main: %60*/
	/*   %62 = fadd float %21, 0x46293E5940000000*/
	if ((cur_state == LEGUP_F_main_BB__60_205)) begin
		main_dotloop_bodyreduction_4_reg <= main_60_62;
		if (start == 1'b0 && ^(main_60_62) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_4_reg"); $finish; end
	end
	/* main: %66*/
	/*   %69 = fadd float %68, 0xBEBBBD41C0000000*/
	if ((cur_state == LEGUP_F_main_BB__66_258)) begin
		main_dotloop_bodyreduction_4_reg <= main_66_69;
		if (start == 1'b0 && ^(main_66_69) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_4_reg"); $finish; end
	end
	/* main: %66*/
	/*   %71 = fadd float %70, 0x3F11566AA0000000*/
	if ((cur_state == LEGUP_F_main_BB__66_283)) begin
		main_dotloop_bodyreduction_4_reg <= main_66_71;
		if (start == 1'b0 && ^(main_66_71) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_4_reg"); $finish; end
	end
	/* main: %66*/
	/*   %73 = fadd float %72, 0xBF66C16C20000000*/
	if ((cur_state == LEGUP_F_main_BB__66_308)) begin
		main_dotloop_bodyreduction_4_reg <= main_66_73;
		if (start == 1'b0 && ^(main_66_73) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_4_reg"); $finish; end
	end
	/* main: %66*/
	/*   %75 = fadd float %74, 0x3FC5555560000000*/
	if ((cur_state == LEGUP_F_main_BB__66_333)) begin
		main_dotloop_bodyreduction_4_reg <= main_66_75;
		if (start == 1'b0 && ^(main_66_75) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_4_reg"); $finish; end
	end
	/* main: %80*/
	/*   %81 = fadd float %77, -2.000000e+00*/
	if ((cur_state == LEGUP_F_main_BB__80_384)) begin
		main_dotloop_bodyreduction_4_reg <= main_80_81;
		if (start == 1'b0 && ^(main_80_81) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_4_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %dot.loop_body.reduction*/
	/*   %5 = add nuw nsw i64 %dot.indvar.reduction20, 1*/
		main_dotloop_bodyreduction_5 = (main_dotloop_bodyreduction_dotindvarreduction20_reg + 64'd1);
end
always @(posedge clk) begin
	/* main: %dot.loop_body.reduction*/
	/*   %5 = add nuw nsw i64 %dot.indvar.reduction20, 1*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_2)) begin
		main_dotloop_bodyreduction_5_reg <= main_dotloop_bodyreduction_5;
		if (start == 1'b0 && ^(main_dotloop_bodyreduction_5) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_5_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %dot.loop_body.reduction*/
	/*   %exitcond18 = icmp eq i64 %5, 784*/
		main_dotloop_bodyreduction_exitcond18 = (main_dotloop_bodyreduction_5 == 64'd784);
end
always @(posedge clk) begin
	/* main: %dot.loop_body.reduction*/
	/*   %exitcond18 = icmp eq i64 %5, 784*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_2)) begin
		main_dotloop_bodyreduction_exitcond18_reg <= main_dotloop_bodyreduction_exitcond18;
		if (start == 1'b0 && ^(main_dotloop_bodyreduction_exitcond18) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_bodyreduction_exitcond18_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %dot.loop_exit.reduction*/
	/*   %6 = add nuw nsw i64 %dot.indvar.rhs.122, 1*/
		main_dotloop_exitreduction_6 = (main_dotloop_bodyreductionlrph_dotindvarrhs122_reg + 64'd1);
end
always @(posedge clk) begin
	/* main: %dot.loop_exit.reduction*/
	/*   %6 = add nuw nsw i64 %dot.indvar.rhs.122, 1*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_exitreduction_30)) begin
		main_dotloop_exitreduction_6_reg <= main_dotloop_exitreduction_6;
		if (start == 1'b0 && ^(main_dotloop_exitreduction_6) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_exitreduction_6_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %dot.loop_exit.reduction*/
	/*   %exitcond21 = icmp eq i64 %6, 10*/
		main_dotloop_exitreduction_exitcond21 = (main_dotloop_exitreduction_6 == 64'd10);
end
always @(posedge clk) begin
	/* main: %dot.loop_exit.reduction*/
	/*   %exitcond21 = icmp eq i64 %6, 10*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_exitreduction_30)) begin
		main_dotloop_exitreduction_exitcond21_reg <= main_dotloop_exitreduction_exitcond21;
		if (start == 1'b0 && ^(main_dotloop_exitreduction_exitcond21) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_dotloop_exitreduction_exitcond21_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %fusion.2.indvar.dim.116 = phi i64 [ %10, %fusion.2.loop_body.dim.1 ], [ 0, %fusion.2.loop_body.dim.1.preheader ]*/
	if (((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1preheader_32) & (memory_controller_waitrequest == 1'd0))) begin
		main_fusion2loop_bodydim1_fusion2indvardim116 = 64'd0;
	end
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %fusion.2.indvar.dim.116 = phi i64 [ %10, %fusion.2.loop_body.dim.1 ], [ 0, %fusion.2.loop_body.dim.1.preheader ]*/
	else /* if ((((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_50) & (memory_controller_waitrequest == 1'd0)) & (main_fusion2loop_bodydim1_exitcond14_reg == 1'd0))) */ begin
		main_fusion2loop_bodydim1_fusion2indvardim116 = main_fusion2loop_bodydim1_10_reg;
	end
end
always @(posedge clk) begin
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %fusion.2.indvar.dim.116 = phi i64 [ %10, %fusion.2.loop_body.dim.1 ], [ 0, %fusion.2.loop_body.dim.1.preheader ]*/
	if (((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1preheader_32) & (memory_controller_waitrequest == 1'd0))) begin
		main_fusion2loop_bodydim1_fusion2indvardim116_reg <= main_fusion2loop_bodydim1_fusion2indvardim116;
		if (start == 1'b0 && ^(main_fusion2loop_bodydim1_fusion2indvardim116) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion2loop_bodydim1_fusion2indvardim116_reg"); $finish; end
	end
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %fusion.2.indvar.dim.116 = phi i64 [ %10, %fusion.2.loop_body.dim.1 ], [ 0, %fusion.2.loop_body.dim.1.preheader ]*/
	if ((((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_50) & (memory_controller_waitrequest == 1'd0)) & (main_fusion2loop_bodydim1_exitcond14_reg == 1'd0))) begin
		main_fusion2loop_bodydim1_fusion2indvardim116_reg <= main_fusion2loop_bodydim1_fusion2indvardim116;
		if (start == 1'b0 && ^(main_fusion2loop_bodydim1_fusion2indvardim116) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion2loop_bodydim1_fusion2indvardim116_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %scevgep15 = getelementptr [1 x [10 x float]]* @temp1, i64 0, i64 0, i64 %fusion.2.indvar.dim.116*/
		main_fusion2loop_bodydim1_scevgep15 = (`TAG_g_temp1_a + (64'd4 * main_fusion2loop_bodydim1_fusion2indvardim116_reg));
end
always @(posedge clk) begin
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %scevgep15 = getelementptr [1 x [10 x float]]* @temp1, i64 0, i64 0, i64 %fusion.2.indvar.dim.116*/
	if ((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_33)) begin
		main_fusion2loop_bodydim1_scevgep15_reg <= main_fusion2loop_bodydim1_scevgep15;
		if (start == 1'b0 && ^(main_fusion2loop_bodydim1_scevgep15) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion2loop_bodydim1_scevgep15_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %scevgep16 = getelementptr [10 x float]* @param0, i64 0, i64 %fusion.2.indvar.dim.116*/
		main_fusion2loop_bodydim1_scevgep16 = (`TAG_g_param0_a + (64'd4 * main_fusion2loop_bodydim1_fusion2indvardim116_reg));
end
always @(*) begin
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %scevgep17 = getelementptr [1 x [10 x float]]* @temp0, i64 0, i64 0, i64 %fusion.2.indvar.dim.116*/
		main_fusion2loop_bodydim1_scevgep17 = (`TAG_g_temp0_a + (64'd4 * main_fusion2loop_bodydim1_fusion2indvardim116_reg));
end
always @(*) begin
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %7 = load float* %scevgep17, align 4*/
		main_fusion2loop_bodydim1_7 = memory_controller_out_a[31:0];
end
always @(*) begin
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %8 = load volatile float* %scevgep16, align 4*/
		main_fusion2loop_bodydim1_8 = memory_controller_out_b[31:0];
end
always @(*) begin
	main_fusion2loop_bodydim1_9 = main_altfp_add_32_0;
end
always @(*) begin
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %10 = add nuw nsw i64 %fusion.2.indvar.dim.116, 1*/
		main_fusion2loop_bodydim1_10 = (main_fusion2loop_bodydim1_fusion2indvardim116_reg + 64'd1);
end
always @(posedge clk) begin
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %10 = add nuw nsw i64 %fusion.2.indvar.dim.116, 1*/
	if ((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_33)) begin
		main_fusion2loop_bodydim1_10_reg <= main_fusion2loop_bodydim1_10;
		if (start == 1'b0 && ^(main_fusion2loop_bodydim1_10) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion2loop_bodydim1_10_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %exitcond14 = icmp eq i64 %10, 10*/
		main_fusion2loop_bodydim1_exitcond14 = (main_fusion2loop_bodydim1_10 == 64'd10);
end
always @(posedge clk) begin
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %exitcond14 = icmp eq i64 %10, 10*/
	if ((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_33)) begin
		main_fusion2loop_bodydim1_exitcond14_reg <= main_fusion2loop_bodydim1_exitcond14;
		if (start == 1'b0 && ^(main_fusion2loop_bodydim1_exitcond14) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion2loop_bodydim1_exitcond14_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %11 = phi float [ %16, %reduce.inner.loop_body.reduction_dim.1 ], [ 0xFFF0000000000000, %reduce.inner.loop_body.reduction_dim.1.preheader ]*/
	if (((cur_state == LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1preheader_51) & (memory_controller_waitrequest == 1'd0))) begin
		main_reduceinnerloop_bodyreduction_dim1_11 = 32'hFF800000;
	end
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %11 = phi float [ %16, %reduce.inner.loop_body.reduction_dim.1 ], [ 0xFFF0000000000000, %reduce.inner.loop_body.reduction_dim.1.preheader ]*/
	else /* if ((((cur_state == LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_55) & (memory_controller_waitrequest == 1'd0)) & (main_reduceinnerloop_bodyreduction_dim1_exitcond12_reg == 1'd0))) */ begin
		main_reduceinnerloop_bodyreduction_dim1_11 = main_reduceinnerloop_bodyreduction_dim1_16;
	end
end
always @(posedge clk) begin
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %11 = phi float [ %16, %reduce.inner.loop_body.reduction_dim.1 ], [ 0xFFF0000000000000, %reduce.inner.loop_body.reduction_dim.1.preheader ]*/
	if (((cur_state == LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1preheader_51) & (memory_controller_waitrequest == 1'd0))) begin
		main_reduceinnerloop_bodyreduction_dim1_11_reg <= main_reduceinnerloop_bodyreduction_dim1_11;
		if (start == 1'b0 && ^(main_reduceinnerloop_bodyreduction_dim1_11) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_reduceinnerloop_bodyreduction_dim1_11_reg"); $finish; end
	end
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %11 = phi float [ %16, %reduce.inner.loop_body.reduction_dim.1 ], [ 0xFFF0000000000000, %reduce.inner.loop_body.reduction_dim.1.preheader ]*/
	if ((((cur_state == LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_55) & (memory_controller_waitrequest == 1'd0)) & (main_reduceinnerloop_bodyreduction_dim1_exitcond12_reg == 1'd0))) begin
		main_reduceinnerloop_bodyreduction_dim1_11_reg <= main_reduceinnerloop_bodyreduction_dim1_11;
		if (start == 1'b0 && ^(main_reduceinnerloop_bodyreduction_dim1_11) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_reduceinnerloop_bodyreduction_dim1_11_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %reduce.inner.indvar.reduction_dim.112 = phi i64 [ %17, %reduce.inner.loop_body.reduction_dim.1 ], [ 0, %reduce.inner.loop_body.reduction_dim.1.preheader ]*/
	if (((cur_state == LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1preheader_51) & (memory_controller_waitrequest == 1'd0))) begin
		main_reduceinnerloop_bodyreduction_dim1_reduceinnerindvarreduction_dim112 = 64'd0;
	end
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %reduce.inner.indvar.reduction_dim.112 = phi i64 [ %17, %reduce.inner.loop_body.reduction_dim.1 ], [ 0, %reduce.inner.loop_body.reduction_dim.1.preheader ]*/
	else /* if ((((cur_state == LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_55) & (memory_controller_waitrequest == 1'd0)) & (main_reduceinnerloop_bodyreduction_dim1_exitcond12_reg == 1'd0))) */ begin
		main_reduceinnerloop_bodyreduction_dim1_reduceinnerindvarreduction_dim112 = main_reduceinnerloop_bodyreduction_dim1_17_reg;
	end
end
always @(posedge clk) begin
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %reduce.inner.indvar.reduction_dim.112 = phi i64 [ %17, %reduce.inner.loop_body.reduction_dim.1 ], [ 0, %reduce.inner.loop_body.reduction_dim.1.preheader ]*/
	if (((cur_state == LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1preheader_51) & (memory_controller_waitrequest == 1'd0))) begin
		main_reduceinnerloop_bodyreduction_dim1_reduceinnerindvarreduction_dim112_reg <= main_reduceinnerloop_bodyreduction_dim1_reduceinnerindvarreduction_dim112;
		if (start == 1'b0 && ^(main_reduceinnerloop_bodyreduction_dim1_reduceinnerindvarreduction_dim112) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_reduceinnerloop_bodyreduction_dim1_reduceinnerindvarreduction_dim112_reg"); $finish; end
	end
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %reduce.inner.indvar.reduction_dim.112 = phi i64 [ %17, %reduce.inner.loop_body.reduction_dim.1 ], [ 0, %reduce.inner.loop_body.reduction_dim.1.preheader ]*/
	if ((((cur_state == LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_55) & (memory_controller_waitrequest == 1'd0)) & (main_reduceinnerloop_bodyreduction_dim1_exitcond12_reg == 1'd0))) begin
		main_reduceinnerloop_bodyreduction_dim1_reduceinnerindvarreduction_dim112_reg <= main_reduceinnerloop_bodyreduction_dim1_reduceinnerindvarreduction_dim112;
		if (start == 1'b0 && ^(main_reduceinnerloop_bodyreduction_dim1_reduceinnerindvarreduction_dim112) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_reduceinnerloop_bodyreduction_dim1_reduceinnerindvarreduction_dim112_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %scevgep13 = getelementptr [1 x [10 x float]]* @temp1, i64 0, i64 0, i64 %reduce.inner.indvar.reduction_dim.112*/
		main_reduceinnerloop_bodyreduction_dim1_scevgep13 = (`TAG_g_temp1_a + (64'd4 * main_reduceinnerloop_bodyreduction_dim1_reduceinnerindvarreduction_dim112_reg));
end
always @(*) begin
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %12 = load float* %scevgep13, align 4*/
		main_reduceinnerloop_bodyreduction_dim1_12 = memory_controller_out_a[31:0];
end
always @(posedge clk) begin
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %12 = load float* %scevgep13, align 4*/
	if ((cur_state == LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_54)) begin
		main_reduceinnerloop_bodyreduction_dim1_12_reg <= main_reduceinnerloop_bodyreduction_dim1_12;
		if (start == 1'b0 && ^(main_reduceinnerloop_bodyreduction_dim1_12) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_reduceinnerloop_bodyreduction_dim1_12_reg"); $finish; end
	end
end
always @(*) begin
	main_reduceinnerloop_bodyreduction_dim1_13 = altfp_compare32_1_main_reduceinnerloop_bodyreduction_dim1_13_out;
end
always @(*) begin
	main_reduceinnerloop_bodyreduction_dim1_14 = altfp_compare32_1_main_reduceinnerloop_bodyreduction_dim1_14_out;
end
always @(posedge clk) begin
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %14 = fcmp ueq float %11, 0.000000e+00*/
	if ((cur_state == LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_53)) begin
		main_reduceinnerloop_bodyreduction_dim1_14_reg <= main_reduceinnerloop_bodyreduction_dim1_14;
		if (start == 1'b0 && ^(main_reduceinnerloop_bodyreduction_dim1_14) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_reduceinnerloop_bodyreduction_dim1_14_reg"); $finish; end
	end
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %14 = fcmp ueq float %11, 0.000000e+00*/
	if ((cur_state == LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_53)) begin
		main_reduceinnerloop_bodyreduction_dim1_14_reg <= main_reduceinnerloop_bodyreduction_dim1_14;
		if (start == 1'b0 && ^(main_reduceinnerloop_bodyreduction_dim1_14) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_reduceinnerloop_bodyreduction_dim1_14_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %15 = or i1 %13, %14*/
		main_reduceinnerloop_bodyreduction_dim1_15 = (main_reduceinnerloop_bodyreduction_dim1_13 | main_reduceinnerloop_bodyreduction_dim1_14_reg);
end
always @(*) begin
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %16 = select i1 %15, float %11, float %12*/
		main_reduceinnerloop_bodyreduction_dim1_16 = (main_reduceinnerloop_bodyreduction_dim1_15 ? main_reduceinnerloop_bodyreduction_dim1_11_reg : main_reduceinnerloop_bodyreduction_dim1_12_reg);
end
always @(posedge clk) begin
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %16 = select i1 %15, float %11, float %12*/
	if ((cur_state == LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_55)) begin
		main_reduceinnerloop_bodyreduction_dim1_16_reg <= main_reduceinnerloop_bodyreduction_dim1_16;
		if (start == 1'b0 && ^(main_reduceinnerloop_bodyreduction_dim1_16) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_reduceinnerloop_bodyreduction_dim1_16_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %17 = add nuw nsw i64 %reduce.inner.indvar.reduction_dim.112, 1*/
		main_reduceinnerloop_bodyreduction_dim1_17 = (main_reduceinnerloop_bodyreduction_dim1_reduceinnerindvarreduction_dim112_reg + 64'd1);
end
always @(posedge clk) begin
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %17 = add nuw nsw i64 %reduce.inner.indvar.reduction_dim.112, 1*/
	if ((cur_state == LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_52)) begin
		main_reduceinnerloop_bodyreduction_dim1_17_reg <= main_reduceinnerloop_bodyreduction_dim1_17;
		if (start == 1'b0 && ^(main_reduceinnerloop_bodyreduction_dim1_17) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_reduceinnerloop_bodyreduction_dim1_17_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %exitcond12 = icmp eq i64 %17, 10*/
		main_reduceinnerloop_bodyreduction_dim1_exitcond12 = (main_reduceinnerloop_bodyreduction_dim1_17 == 64'd10);
end
always @(posedge clk) begin
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %exitcond12 = icmp eq i64 %17, 10*/
	if ((cur_state == LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_52)) begin
		main_reduceinnerloop_bodyreduction_dim1_exitcond12_reg <= main_reduceinnerloop_bodyreduction_dim1_exitcond12;
		if (start == 1'b0 && ^(main_reduceinnerloop_bodyreduction_dim1_exitcond12) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_reduceinnerloop_bodyreduction_dim1_exitcond12_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %lo.i.i.0 = phi float [ %lo.i.i.3, %expf.exit ], [ undef, %fusion.1.loop_body.dim.1.preheader ]*/
	if (((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1preheader_56) & (memory_controller_waitrequest == 1'd0))) begin
		main_fusion1loop_bodydim1_loii0 = 0;
	end
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %lo.i.i.0 = phi float [ %lo.i.i.3, %expf.exit ], [ undef, %fusion.1.loop_body.dim.1.preheader ]*/
	else /* if ((((cur_state == LEGUP_F_main_BB_expfexit_550) & (memory_controller_waitrequest == 1'd0)) & (main_expfexit_exitcond4_reg == 1'd0))) */ begin
		main_fusion1loop_bodydim1_loii0 = main_expfexit_loii3_reg;
	end
end
always @(posedge clk) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %lo.i.i.0 = phi float [ %lo.i.i.3, %expf.exit ], [ undef, %fusion.1.loop_body.dim.1.preheader ]*/
	if (((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1preheader_56) & (memory_controller_waitrequest == 1'd0))) begin
		main_fusion1loop_bodydim1_loii0_reg <= main_fusion1loop_bodydim1_loii0;
		if (start == 1'b0 && ^(main_fusion1loop_bodydim1_loii0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion1loop_bodydim1_loii0_reg"); $finish; end
	end
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %lo.i.i.0 = phi float [ %lo.i.i.3, %expf.exit ], [ undef, %fusion.1.loop_body.dim.1.preheader ]*/
	if ((((cur_state == LEGUP_F_main_BB_expfexit_550) & (memory_controller_waitrequest == 1'd0)) & (main_expfexit_exitcond4_reg == 1'd0))) begin
		main_fusion1loop_bodydim1_loii0_reg <= main_fusion1loop_bodydim1_loii0;
		if (start == 1'b0 && ^(main_fusion1loop_bodydim1_loii0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion1loop_bodydim1_loii0_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %hi.i.i.0 = phi float [ %hi.i.i.3, %expf.exit ], [ undef, %fusion.1.loop_body.dim.1.preheader ]*/
	if (((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1preheader_56) & (memory_controller_waitrequest == 1'd0))) begin
		main_fusion1loop_bodydim1_hiii0 = 0;
	end
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %hi.i.i.0 = phi float [ %hi.i.i.3, %expf.exit ], [ undef, %fusion.1.loop_body.dim.1.preheader ]*/
	else /* if ((((cur_state == LEGUP_F_main_BB_expfexit_550) & (memory_controller_waitrequest == 1'd0)) & (main_expfexit_exitcond4_reg == 1'd0))) */ begin
		main_fusion1loop_bodydim1_hiii0 = main_expfexit_hiii3_reg;
	end
end
always @(posedge clk) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %hi.i.i.0 = phi float [ %hi.i.i.3, %expf.exit ], [ undef, %fusion.1.loop_body.dim.1.preheader ]*/
	if (((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1preheader_56) & (memory_controller_waitrequest == 1'd0))) begin
		main_fusion1loop_bodydim1_hiii0_reg <= main_fusion1loop_bodydim1_hiii0;
		if (start == 1'b0 && ^(main_fusion1loop_bodydim1_hiii0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion1loop_bodydim1_hiii0_reg"); $finish; end
	end
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %hi.i.i.0 = phi float [ %hi.i.i.3, %expf.exit ], [ undef, %fusion.1.loop_body.dim.1.preheader ]*/
	if ((((cur_state == LEGUP_F_main_BB_expfexit_550) & (memory_controller_waitrequest == 1'd0)) & (main_expfexit_exitcond4_reg == 1'd0))) begin
		main_fusion1loop_bodydim1_hiii0_reg <= main_fusion1loop_bodydim1_hiii0;
		if (start == 1'b0 && ^(main_fusion1loop_bodydim1_hiii0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion1loop_bodydim1_hiii0_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %fusion.1.indvar.dim.18 = phi i64 [ %102, %expf.exit ], [ 0, %fusion.1.loop_body.dim.1.preheader ]*/
	if (((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1preheader_56) & (memory_controller_waitrequest == 1'd0))) begin
		main_fusion1loop_bodydim1_fusion1indvardim18 = 64'd0;
	end
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %fusion.1.indvar.dim.18 = phi i64 [ %102, %expf.exit ], [ 0, %fusion.1.loop_body.dim.1.preheader ]*/
	else /* if ((((cur_state == LEGUP_F_main_BB_expfexit_550) & (memory_controller_waitrequest == 1'd0)) & (main_expfexit_exitcond4_reg == 1'd0))) */ begin
		main_fusion1loop_bodydim1_fusion1indvardim18 = main_expfexit_102_reg;
	end
end
always @(posedge clk) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %fusion.1.indvar.dim.18 = phi i64 [ %102, %expf.exit ], [ 0, %fusion.1.loop_body.dim.1.preheader ]*/
	if (((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1preheader_56) & (memory_controller_waitrequest == 1'd0))) begin
		main_fusion1loop_bodydim1_fusion1indvardim18_reg <= main_fusion1loop_bodydim1_fusion1indvardim18;
		if (start == 1'b0 && ^(main_fusion1loop_bodydim1_fusion1indvardim18) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion1loop_bodydim1_fusion1indvardim18_reg"); $finish; end
	end
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %fusion.1.indvar.dim.18 = phi i64 [ %102, %expf.exit ], [ 0, %fusion.1.loop_body.dim.1.preheader ]*/
	if ((((cur_state == LEGUP_F_main_BB_expfexit_550) & (memory_controller_waitrequest == 1'd0)) & (main_expfexit_exitcond4_reg == 1'd0))) begin
		main_fusion1loop_bodydim1_fusion1indvardim18_reg <= main_fusion1loop_bodydim1_fusion1indvardim18;
		if (start == 1'b0 && ^(main_fusion1loop_bodydim1_fusion1indvardim18) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion1loop_bodydim1_fusion1indvardim18_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %scevgep5 = getelementptr [1 x [10 x float]]* @temp1, i64 0, i64 0, i64 %fusion.1.indvar.dim.18*/
		main_fusion1loop_bodydim1_scevgep5 = (`TAG_g_temp1_a + (64'd4 * main_fusion1loop_bodydim1_fusion1indvardim18_reg));
end
always @(posedge clk) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %scevgep5 = getelementptr [1 x [10 x float]]* @temp1, i64 0, i64 0, i64 %fusion.1.indvar.dim.18*/
	if ((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1_57)) begin
		main_fusion1loop_bodydim1_scevgep5_reg <= main_fusion1loop_bodydim1_scevgep5;
		if (start == 1'b0 && ^(main_fusion1loop_bodydim1_scevgep5) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion1loop_bodydim1_scevgep5_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %scevgep6 = getelementptr [10 x float]* @param0, i64 0, i64 %fusion.1.indvar.dim.18*/
		main_fusion1loop_bodydim1_scevgep6 = (`TAG_g_param0_a + (64'd4 * main_fusion1loop_bodydim1_fusion1indvardim18_reg));
end
always @(*) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %scevgep7 = getelementptr [1 x [10 x float]]* @temp0, i64 0, i64 0, i64 %fusion.1.indvar.dim.18*/
		main_fusion1loop_bodydim1_scevgep7 = (`TAG_g_temp0_a + (64'd4 * main_fusion1loop_bodydim1_fusion1indvardim18_reg));
end
always @(*) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %18 = load float* %scevgep7, align 4*/
		main_fusion1loop_bodydim1_18 = memory_controller_out_a[31:0];
end
always @(*) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %19 = load volatile float* %scevgep6, align 4*/
		main_fusion1loop_bodydim1_19 = memory_controller_out_b[31:0];
end
always @(*) begin
	main_fusion1loop_bodydim1_20 = main_altfp_add_32_0;
end
always @(*) begin
	main_fusion1loop_bodydim1_21 = main_altfp_subtract_32_0;
end
always @(posedge clk) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %21 = fsub float %20, %16*/
	if ((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1_87)) begin
		main_fusion1loop_bodydim1_21_reg <= main_fusion1loop_bodydim1_21;
		if (start == 1'b0 && ^(main_fusion1loop_bodydim1_21) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion1loop_bodydim1_21_reg"); $finish; end
	end
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %21 = fsub float %20, %16*/
	if ((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1_87)) begin
		main_fusion1loop_bodydim1_21_reg <= main_fusion1loop_bodydim1_21;
		if (start == 1'b0 && ^(main_fusion1loop_bodydim1_21) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion1loop_bodydim1_21_reg"); $finish; end
	end
	/* main: %85*/
	/*   %86 = fsub float 2.000000e+00, %77*/
	if ((cur_state == LEGUP_F_main_BB__85_460)) begin
		main_fusion1loop_bodydim1_21_reg <= main_85_86;
		if (start == 1'b0 && ^(main_85_86) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion1loop_bodydim1_21_reg"); $finish; end
	end
	/* main: %85*/
	/*   %88 = fsub float %lo.i.i.2, %87*/
	if ((cur_state == LEGUP_F_main_BB__85_507)) begin
		main_fusion1loop_bodydim1_21_reg <= main_85_88;
		if (start == 1'b0 && ^(main_85_88) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion1loop_bodydim1_21_reg"); $finish; end
	end
	/* main: %85*/
	/*   %90 = fsub float 1.000000e+00, %89*/
	if ((cur_state == LEGUP_F_main_BB__85_535)) begin
		main_fusion1loop_bodydim1_21_reg <= main_85_90;
		if (start == 1'b0 && ^(main_85_90) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion1loop_bodydim1_21_reg"); $finish; end
	end
	/* main: %80*/
	/*   %83 = fsub float %82, %.048*/
	if ((cur_state == LEGUP_F_main_BB__80_431)) begin
		main_fusion1loop_bodydim1_21_reg <= main_80_83;
		if (start == 1'b0 && ^(main_80_83) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion1loop_bodydim1_21_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %22 = bitcast float %21 to i32*/
		main_fusion1loop_bodydim1_22 = main_fusion1loop_bodydim1_21;
end
always @(posedge clk) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %22 = bitcast float %21 to i32*/
	if ((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1_87)) begin
		main_fusion1loop_bodydim1_22_reg <= main_fusion1loop_bodydim1_22;
		if (start == 1'b0 && ^(main_fusion1loop_bodydim1_22) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion1loop_bodydim1_22_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %23 = lshr i32 %22, 31*/
		main_fusion1loop_bodydim1_23 = (main_fusion1loop_bodydim1_22 >>> (32'd31 % 32));
end
always @(posedge clk) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %23 = lshr i32 %22, 31*/
	if ((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1_87)) begin
		main_fusion1loop_bodydim1_23_reg <= main_fusion1loop_bodydim1_23;
		if (start == 1'b0 && ^(main_fusion1loop_bodydim1_23) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion1loop_bodydim1_23_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %24 = and i32 %22, 2147483647*/
		main_fusion1loop_bodydim1_24 = (main_fusion1loop_bodydim1_22 & 32'd2147483647);
end
always @(posedge clk) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %24 = and i32 %22, 2147483647*/
	if ((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1_87)) begin
		main_fusion1loop_bodydim1_24_reg <= main_fusion1loop_bodydim1_24;
		if (start == 1'b0 && ^(main_fusion1loop_bodydim1_24) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusion1loop_bodydim1_24_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %25 = icmp ugt i32 %24, 2139095040*/
		main_fusion1loop_bodydim1_25 = (main_fusion1loop_bodydim1_24 > 32'd2139095040);
end
always @(*) begin
	main_26_27 = main_altfp_add_32_0;
end
always @(*) begin
	/* main: %28*/
	/*   %29 = icmp eq i32 %24, 2139095040*/
		main_28_29 = (main_fusion1loop_bodydim1_24_reg == 32'd2139095040);
end
always @(*) begin
	/* main: %30*/
	/*   %31 = icmp eq i32 %23, 0*/
		main_30_31 = (main_fusion1loop_bodydim1_23_reg == 32'd0);
end
always @(*) begin
	/* main: %30*/
	/*   %. = select i1 %31, float %21, float 0.000000e+00*/
		main_30_ = (main_30_31 ? main_fusion1loop_bodydim1_21_reg : 32'h0);
end
always @(*) begin
	/* main: %32*/
	/*   %33 = icmp sgt i32 %22, 1118925335*/
		main_32_33 = ($signed(main_fusion1loop_bodydim1_22_reg) > $signed(32'd1118925335));
end
always @(*) begin
	/* main: %34*/
	/*   %35 = icmp slt i32 %22, 0*/
		main_34_35 = ($signed(main_fusion1loop_bodydim1_22_reg) < $signed(32'd0));
end
always @(*) begin
	/* main: %34*/
	/*   %36 = icmp ugt i32 %24, 1120924085*/
		main_34_36 = (main_fusion1loop_bodydim1_24_reg > 32'd1120924085);
end
always @(*) begin
	/* main: %34*/
	/*   %or.cond = and i1 %35, %36*/
		main_34_orcond = (main_34_35 & main_34_36);
end
always @(*) begin
	/* main: %thread-pre-split*/
	/*   %37 = icmp ugt i32 %24, 1051816472*/
		main_threadpresplit_37 = (main_fusion1loop_bodydim1_24_reg > 32'd1051816472);
end
always @(*) begin
	/* main: %38*/
	/*   %39 = icmp ult i32 %24, 1065686418*/
		main_38_39 = (main_fusion1loop_bodydim1_24_reg < 32'd1065686418);
end
always @(*) begin
	/* main: %40*/
	/*   %41 = zext i32 %23 to i64*/
		main_40_41 = main_fusion1loop_bodydim1_23_reg;
end
always @(*) begin
	/* main: %40*/
	/*   %42 = getelementptr inbounds [2 x float]* @ln2HI31, i64 0, i64 %41*/
		main_40_42 = (`TAG_g_ln2HI31_a + (64'd4 * main_40_41));
end
always @(*) begin
	/* main: %40*/
	/*   %43 = load float* %42, align 4*/
		main_40_43 = memory_controller_out_a[31:0];
end
always @(*) begin
	/* main: %40*/
	/*   %44 = getelementptr inbounds [2 x float]* @ln2LO32, i64 0, i64 %41*/
		main_40_44 = (`TAG_g_ln2LO32_a + (64'd4 * main_40_41));
end
always @(*) begin
	/* main: %40*/
	/*   %45 = load float* %44, align 4*/
		main_40_45 = memory_controller_out_b[31:0];
end
always @(*) begin
	/* main: %40*/
	/*   %46 = xor i32 %23, 1*/
		main_40_46 = (main_fusion1loop_bodydim1_23_reg ^ 32'd1);
end
always @(*) begin
	/* main: %40*/
	/*   %47 = sub nsw i32 %46, %23*/
		main_40_47 = (main_40_46 - main_fusion1loop_bodydim1_23_reg);
end
always @(posedge clk) begin
	/* main: %40*/
	/*   %47 = sub nsw i32 %46, %23*/
	if ((cur_state == LEGUP_F_main_BB__40_109)) begin
		main_40_47_reg <= main_40_47;
		if (start == 1'b0 && ^(main_40_47) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_40_47_reg"); $finish; end
	end
end
always @(*) begin
	main_48_49 = main_altfp_multiply_32_0;
end
always @(*) begin
	/* main: %48*/
	/*   %50 = zext i32 %23 to i64*/
		main_48_50 = main_fusion1loop_bodydim1_23_reg;
end
always @(*) begin
	/* main: %48*/
	/*   %51 = getelementptr inbounds [2 x float]* @halF33, i64 0, i64 %50*/
		main_48_51 = (`TAG_g_halF33_a + (64'd4 * main_48_50));
end
always @(*) begin
	/* main: %48*/
	/*   %52 = load float* %51, align 4*/
		main_48_52 = memory_controller_out_b[31:0];
end
always @(posedge clk) begin
	/* main: %48*/
	/*   %52 = load float* %51, align 4*/
	if ((cur_state == LEGUP_F_main_BB__48_114)) begin
		main_48_52_reg <= main_48_52;
		if (start == 1'b0 && ^(main_48_52) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_48_52_reg"); $finish; end
	end
end
always @(*) begin
	main_48_53 = main_altfp_add_32_0;
end
always @(*) begin
	main_48_54 = main_altfp_fptosi_32_0;
end
always @(posedge clk) begin
	/* main: %48*/
	/*   %54 = fptosi float %53 to i32*/
	if ((cur_state == LEGUP_F_main_BB__48_143)) begin
		main_48_54_reg <= main_48_54;
		if (start == 1'b0 && ^(main_48_54) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_48_54_reg"); $finish; end
	end
	/* main: %48*/
	/*   %54 = fptosi float %53 to i32*/
	if ((cur_state == LEGUP_F_main_BB__48_143)) begin
		main_48_54_reg <= main_48_54;
		if (start == 1'b0 && ^(main_48_54) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_48_54_reg"); $finish; end
	end
end
always @(*) begin
	main_48_55 = main_altfp_sitofp_32_0;
end
always @(posedge clk) begin
	/* main: %48*/
	/*   %55 = sitofp i32 %54 to float*/
	if ((cur_state == LEGUP_F_main_BB__48_149)) begin
		main_48_55_reg <= main_48_55;
		if (start == 1'b0 && ^(main_48_55) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_48_55_reg"); $finish; end
	end
	/* main: %48*/
	/*   %55 = sitofp i32 %54 to float*/
	if ((cur_state == LEGUP_F_main_BB__48_149)) begin
		main_48_55_reg <= main_48_55;
		if (start == 1'b0 && ^(main_48_55) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_48_55_reg"); $finish; end
	end
end
always @(*) begin
	main_48_56 = main_altfp_multiply_32_0;
end
always @(posedge clk) begin
	/* main: %48*/
	/*   %56 = fmul float %55, 0x3FE62E3000000000*/
	if ((cur_state == LEGUP_F_main_BB__48_160)) begin
		main_48_56_reg <= main_48_56;
		if (start == 1'b0 && ^(main_48_56) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_48_56_reg"); $finish; end
	end
	/* main: %48*/
	/*   %56 = fmul float %55, 0x3FE62E3000000000*/
	if ((cur_state == LEGUP_F_main_BB__48_160)) begin
		main_48_56_reg <= main_48_56;
		if (start == 1'b0 && ^(main_48_56) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_48_56_reg"); $finish; end
	end
	/* main: %66*/
	/*   %68 = fmul float %67, 0x3E66376980000000*/
	if ((cur_state == LEGUP_F_main_BB__66_244)) begin
		main_48_56_reg <= main_66_68;
		if (start == 1'b0 && ^(main_66_68) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_48_56_reg"); $finish; end
	end
	/* main: %66*/
	/*   %70 = fmul float %67, %69*/
	if ((cur_state == LEGUP_F_main_BB__66_269)) begin
		main_48_56_reg <= main_66_70;
		if (start == 1'b0 && ^(main_66_70) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_48_56_reg"); $finish; end
	end
	/* main: %66*/
	/*   %72 = fmul float %67, %71*/
	if ((cur_state == LEGUP_F_main_BB__66_294)) begin
		main_48_56_reg <= main_66_72;
		if (start == 1'b0 && ^(main_66_72) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_48_56_reg"); $finish; end
	end
	/* main: %66*/
	/*   %74 = fmul float %67, %73*/
	if ((cur_state == LEGUP_F_main_BB__66_319)) begin
		main_48_56_reg <= main_66_74;
		if (start == 1'b0 && ^(main_66_74) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_48_56_reg"); $finish; end
	end
	/* main: %66*/
	/*   %76 = fmul float %67, %75*/
	if ((cur_state == LEGUP_F_main_BB__66_344)) begin
		main_48_56_reg <= main_66_76;
		if (start == 1'b0 && ^(main_66_76) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_48_56_reg"); $finish; end
	end
end
always @(*) begin
	main_48_57 = main_altfp_multiply_32_0;
end
always @(posedge clk) begin
	/* main: %48*/
	/*   %57 = fmul float %55, 0x3EE2FEFA20000000*/
	if ((cur_state == LEGUP_F_main_BB__48_161)) begin
		main_48_57_reg <= main_48_57;
		if (start == 1'b0 && ^(main_48_57) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_48_57_reg"); $finish; end
	end
	/* main: %48*/
	/*   %57 = fmul float %55, 0x3EE2FEFA20000000*/
	if ((cur_state == LEGUP_F_main_BB__48_161)) begin
		main_48_57_reg <= main_48_57;
		if (start == 1'b0 && ^(main_48_57) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_48_57_reg"); $finish; end
	end
	/* main: %66*/
	/*   %79 = fmul float %.048, %77*/
	if ((cur_state == LEGUP_F_main_BB__66_369)) begin
		main_48_57_reg <= main_66_79;
		if (start == 1'b0 && ^(main_66_79) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_48_57_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %58*/
	/*   %k.i.i.0 = phi i32 [ %47, %40 ], [ %54, %48 ]*/
	if (((cur_state == LEGUP_F_main_BB__40_111) & (memory_controller_waitrequest == 1'd0))) begin
		main_58_kii0 = main_40_47_reg;
	end
	/* main: %58*/
	/*   %k.i.i.0 = phi i32 [ %47, %40 ], [ %54, %48 ]*/
	else /* if (((cur_state == LEGUP_F_main_BB__48_161) & (memory_controller_waitrequest == 1'd0))) */ begin
		main_58_kii0 = main_48_54_reg;
	end
end
always @(posedge clk) begin
	/* main: %58*/
	/*   %k.i.i.0 = phi i32 [ %47, %40 ], [ %54, %48 ]*/
	if (((cur_state == LEGUP_F_main_BB__40_111) & (memory_controller_waitrequest == 1'd0))) begin
		main_58_kii0_reg <= main_58_kii0;
		if (start == 1'b0 && ^(main_58_kii0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_58_kii0_reg"); $finish; end
	end
	/* main: %58*/
	/*   %k.i.i.0 = phi i32 [ %47, %40 ], [ %54, %48 ]*/
	if (((cur_state == LEGUP_F_main_BB__48_161) & (memory_controller_waitrequest == 1'd0))) begin
		main_58_kii0_reg <= main_58_kii0;
		if (start == 1'b0 && ^(main_58_kii0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_58_kii0_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %58*/
	/*   %lo.i.i.1 = phi float [ %45, %40 ], [ %57, %48 ]*/
	if (((cur_state == LEGUP_F_main_BB__40_111) & (memory_controller_waitrequest == 1'd0))) begin
		main_58_loii1 = main_40_45;
	end
	/* main: %58*/
	/*   %lo.i.i.1 = phi float [ %45, %40 ], [ %57, %48 ]*/
	else /* if (((cur_state == LEGUP_F_main_BB__48_161) & (memory_controller_waitrequest == 1'd0))) */ begin
		main_58_loii1 = main_48_57;
	end
end
always @(posedge clk) begin
	/* main: %58*/
	/*   %lo.i.i.1 = phi float [ %45, %40 ], [ %57, %48 ]*/
	if (((cur_state == LEGUP_F_main_BB__40_111) & (memory_controller_waitrequest == 1'd0))) begin
		main_58_loii1_reg <= main_58_loii1;
		if (start == 1'b0 && ^(main_58_loii1) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_58_loii1_reg"); $finish; end
	end
	/* main: %58*/
	/*   %lo.i.i.1 = phi float [ %45, %40 ], [ %57, %48 ]*/
	if (((cur_state == LEGUP_F_main_BB__48_161) & (memory_controller_waitrequest == 1'd0))) begin
		main_58_loii1_reg <= main_58_loii1;
		if (start == 1'b0 && ^(main_58_loii1) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_58_loii1_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %58*/
	/*   %.pn = phi float [ %43, %40 ], [ %56, %48 ]*/
	if (((cur_state == LEGUP_F_main_BB__40_111) & (memory_controller_waitrequest == 1'd0))) begin
		main_58_pn = main_40_43;
	end
	/* main: %58*/
	/*   %.pn = phi float [ %43, %40 ], [ %56, %48 ]*/
	else /* if (((cur_state == LEGUP_F_main_BB__48_161) & (memory_controller_waitrequest == 1'd0))) */ begin
		main_58_pn = main_48_56_reg;
	end
end
always @(posedge clk) begin
	/* main: %58*/
	/*   %.pn = phi float [ %43, %40 ], [ %56, %48 ]*/
	if (((cur_state == LEGUP_F_main_BB__40_111) & (memory_controller_waitrequest == 1'd0))) begin
		main_58_pn_reg <= main_58_pn;
		if (start == 1'b0 && ^(main_58_pn) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_58_pn_reg"); $finish; end
	end
	/* main: %58*/
	/*   %.pn = phi float [ %43, %40 ], [ %56, %48 ]*/
	if (((cur_state == LEGUP_F_main_BB__48_161) & (memory_controller_waitrequest == 1'd0))) begin
		main_58_pn_reg <= main_58_pn;
		if (start == 1'b0 && ^(main_58_pn) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_58_pn_reg"); $finish; end
	end
end
always @(*) begin
	main_58_hiii1 = main_altfp_subtract_32_0;
end
always @(*) begin
/* main: %58*/
/*   %hi.i.i.1 = fsub float %21, %.pn*/
	main_58_hiii1_reg = main_85_89_reg;
end
always @(*) begin
	main_58_59 = main_altfp_subtract_32_0;
end
always @(posedge clk) begin
	/* main: %58*/
	/*   %59 = fsub float %hi.i.i.1, %lo.i.i.1*/
	if ((cur_state == LEGUP_F_main_BB__58_190)) begin
		main_58_59_reg <= main_58_59;
		if (start == 1'b0 && ^(main_58_59) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_58_59_reg"); $finish; end
	end
	/* main: %58*/
	/*   %59 = fsub float %hi.i.i.1, %lo.i.i.1*/
	if ((cur_state == LEGUP_F_main_BB__58_190)) begin
		main_58_59_reg <= main_58_59;
		if (start == 1'b0 && ^(main_58_59) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_58_59_reg"); $finish; end
	end
	/* main: %66*/
	/*   %77 = fsub float %.048, %76*/
	if ((cur_state == LEGUP_F_main_BB__66_358)) begin
		main_58_59_reg <= main_66_77;
		if (start == 1'b0 && ^(main_66_77) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_58_59_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %60*/
	/*   %61 = icmp ult i32 %24, 830472192*/
		main_60_61 = (main_fusion1loop_bodydim1_24_reg < 32'd830472192);
end
always @(posedge clk) begin
	/* main: %60*/
	/*   %61 = icmp ult i32 %24, 830472192*/
	if ((cur_state == LEGUP_F_main_BB__60_191)) begin
		main_60_61_reg <= main_60_61;
		if (start == 1'b0 && ^(main_60_61) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_60_61_reg"); $finish; end
	end
end
always @(*) begin
	main_60_62 = main_altfp_add_32_0;
end
always @(*) begin
	main_60_63 = altfp_compare32_1_main_60_63_out;
end
always @(*) begin
	/* main: %60*/
	/*   %or.cond54 = and i1 %61, %63*/
		main_60_orcond54 = (main_60_61_reg & main_60_63);
end
always @(*) begin
	main_64_65 = main_altfp_add_32_0;
end
always @(*) begin
	/* main: %66*/
	/*   %k.i.i.1 = phi i32 [ %k.i.i.0, %58 ], [ 0, %60 ]*/
	if (((cur_state == LEGUP_F_main_BB__58_190) & (memory_controller_waitrequest == 1'd0))) begin
		main_66_kii1 = main_58_kii0_reg;
	end
	/* main: %66*/
	/*   %k.i.i.1 = phi i32 [ %k.i.i.0, %58 ], [ 0, %60 ]*/
	else /* if ((((cur_state == LEGUP_F_main_BB__60_206) & (memory_controller_waitrequest == 1'd0)) & (main_60_orcond54 == 1'd0))) */ begin
		main_66_kii1 = 32'd0;
	end
end
always @(posedge clk) begin
	/* main: %66*/
	/*   %k.i.i.1 = phi i32 [ %k.i.i.0, %58 ], [ 0, %60 ]*/
	if (((cur_state == LEGUP_F_main_BB__58_190) & (memory_controller_waitrequest == 1'd0))) begin
		main_66_kii1_reg <= main_66_kii1;
		if (start == 1'b0 && ^(main_66_kii1) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_66_kii1_reg"); $finish; end
	end
	/* main: %66*/
	/*   %k.i.i.1 = phi i32 [ %k.i.i.0, %58 ], [ 0, %60 ]*/
	if ((((cur_state == LEGUP_F_main_BB__60_206) & (memory_controller_waitrequest == 1'd0)) & (main_60_orcond54 == 1'd0))) begin
		main_66_kii1_reg <= main_66_kii1;
		if (start == 1'b0 && ^(main_66_kii1) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_66_kii1_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %66*/
	/*   %lo.i.i.2 = phi float [ %lo.i.i.1, %58 ], [ %lo.i.i.0, %60 ]*/
	if (((cur_state == LEGUP_F_main_BB__58_190) & (memory_controller_waitrequest == 1'd0))) begin
		main_66_loii2 = main_58_loii1_reg;
	end
	/* main: %66*/
	/*   %lo.i.i.2 = phi float [ %lo.i.i.1, %58 ], [ %lo.i.i.0, %60 ]*/
	else /* if ((((cur_state == LEGUP_F_main_BB__60_206) & (memory_controller_waitrequest == 1'd0)) & (main_60_orcond54 == 1'd0))) */ begin
		main_66_loii2 = main_fusion1loop_bodydim1_loii0_reg;
	end
end
always @(posedge clk) begin
	/* main: %66*/
	/*   %lo.i.i.2 = phi float [ %lo.i.i.1, %58 ], [ %lo.i.i.0, %60 ]*/
	if (((cur_state == LEGUP_F_main_BB__58_190) & (memory_controller_waitrequest == 1'd0))) begin
		main_66_loii2_reg <= main_66_loii2;
		if (start == 1'b0 && ^(main_66_loii2) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_66_loii2_reg"); $finish; end
	end
	/* main: %66*/
	/*   %lo.i.i.2 = phi float [ %lo.i.i.1, %58 ], [ %lo.i.i.0, %60 ]*/
	if ((((cur_state == LEGUP_F_main_BB__60_206) & (memory_controller_waitrequest == 1'd0)) & (main_60_orcond54 == 1'd0))) begin
		main_66_loii2_reg <= main_66_loii2;
		if (start == 1'b0 && ^(main_66_loii2) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_66_loii2_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %66*/
	/*   %hi.i.i.2 = phi float [ %hi.i.i.1, %58 ], [ %hi.i.i.0, %60 ]*/
	if (((cur_state == LEGUP_F_main_BB__58_190) & (memory_controller_waitrequest == 1'd0))) begin
		main_66_hiii2 = main_58_hiii1_reg;
	end
	/* main: %66*/
	/*   %hi.i.i.2 = phi float [ %hi.i.i.1, %58 ], [ %hi.i.i.0, %60 ]*/
	else /* if ((((cur_state == LEGUP_F_main_BB__60_206) & (memory_controller_waitrequest == 1'd0)) & (main_60_orcond54 == 1'd0))) */ begin
		main_66_hiii2 = main_fusion1loop_bodydim1_hiii0_reg;
	end
end
always @(posedge clk) begin
	/* main: %66*/
	/*   %hi.i.i.2 = phi float [ %hi.i.i.1, %58 ], [ %hi.i.i.0, %60 ]*/
	if (((cur_state == LEGUP_F_main_BB__58_190) & (memory_controller_waitrequest == 1'd0))) begin
		main_66_hiii2_reg <= main_66_hiii2;
		if (start == 1'b0 && ^(main_66_hiii2) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_66_hiii2_reg"); $finish; end
	end
	/* main: %66*/
	/*   %hi.i.i.2 = phi float [ %hi.i.i.1, %58 ], [ %hi.i.i.0, %60 ]*/
	if ((((cur_state == LEGUP_F_main_BB__60_206) & (memory_controller_waitrequest == 1'd0)) & (main_60_orcond54 == 1'd0))) begin
		main_66_hiii2_reg <= main_66_hiii2;
		if (start == 1'b0 && ^(main_66_hiii2) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_66_hiii2_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %66*/
	/*   %.048 = phi float [ %59, %58 ], [ %21, %60 ]*/
	if (((cur_state == LEGUP_F_main_BB__58_190) & (memory_controller_waitrequest == 1'd0))) begin
		main_66_048 = main_58_59;
	end
	/* main: %66*/
	/*   %.048 = phi float [ %59, %58 ], [ %21, %60 ]*/
	else /* if ((((cur_state == LEGUP_F_main_BB__60_206) & (memory_controller_waitrequest == 1'd0)) & (main_60_orcond54 == 1'd0))) */ begin
		main_66_048 = main_fusion1loop_bodydim1_21_reg;
	end
end
always @(posedge clk) begin
	/* main: %66*/
	/*   %.048 = phi float [ %59, %58 ], [ %21, %60 ]*/
	if (((cur_state == LEGUP_F_main_BB__58_190) & (memory_controller_waitrequest == 1'd0))) begin
		main_66_048_reg <= main_66_048;
		if (start == 1'b0 && ^(main_66_048) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_66_048_reg"); $finish; end
	end
	/* main: %66*/
	/*   %.048 = phi float [ %59, %58 ], [ %21, %60 ]*/
	if ((((cur_state == LEGUP_F_main_BB__60_206) & (memory_controller_waitrequest == 1'd0)) & (main_60_orcond54 == 1'd0))) begin
		main_66_048_reg <= main_66_048;
		if (start == 1'b0 && ^(main_66_048) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_66_048_reg"); $finish; end
	end
end
always @(*) begin
	main_66_67 = main_altfp_multiply_32_0;
end
always @(*) begin
/* main: %66*/
/*   %67 = fmul float %.048, %.048*/
	main_66_67_reg = main_dotloop_bodyreduction_3_reg;
end
always @(*) begin
	main_66_68 = main_altfp_multiply_32_0;
end
always @(*) begin
	main_66_69 = main_altfp_add_32_0;
end
always @(*) begin
	main_66_70 = main_altfp_multiply_32_0;
end
always @(*) begin
	main_66_71 = main_altfp_add_32_0;
end
always @(*) begin
	main_66_72 = main_altfp_multiply_32_0;
end
always @(*) begin
	main_66_73 = main_altfp_add_32_0;
end
always @(*) begin
	main_66_74 = main_altfp_multiply_32_0;
end
always @(*) begin
	main_66_75 = main_altfp_add_32_0;
end
always @(*) begin
	main_66_76 = main_altfp_multiply_32_0;
end
always @(*) begin
	main_66_77 = main_altfp_subtract_32_0;
end
always @(*) begin
/* main: %66*/
/*   %77 = fsub float %.048, %76*/
	main_66_77_reg = main_58_59_reg;
end
always @(*) begin
	/* main: %66*/
	/*   %78 = icmp eq i32 %k.i.i.1, 0*/
		main_66_78 = (main_66_kii1_reg == 32'd0);
end
always @(posedge clk) begin
	/* main: %66*/
	/*   %78 = icmp eq i32 %k.i.i.1, 0*/
	if ((cur_state == LEGUP_F_main_BB__66_222)) begin
		main_66_78_reg <= main_66_78;
		if (start == 1'b0 && ^(main_66_78) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_66_78_reg"); $finish; end
	end
end
always @(*) begin
	main_66_79 = main_altfp_multiply_32_0;
end
always @(*) begin
/* main: %66*/
/*   %79 = fmul float %.048, %77*/
	main_66_79_reg = main_48_57_reg;
end
always @(*) begin
	main_80_81 = main_altfp_add_32_0;
end
always @(*) begin
	main_80_82 = main_altfp_divide_32_0;
end
always @(*) begin
	main_80_83 = main_altfp_subtract_32_0;
end
always @(*) begin
	main_80_84 = main_altfp_subtract_32_0;
end
always @(*) begin
	main_85_86 = main_altfp_subtract_32_0;
end
always @(*) begin
	main_85_87 = main_altfp_divide_32_0;
end
always @(*) begin
	main_85_88 = main_altfp_subtract_32_0;
end
always @(*) begin
	main_85_89 = main_altfp_subtract_32_0;
end
always @(posedge clk) begin
	/* main: %85*/
	/*   %89 = fsub float %88, %hi.i.i.2*/
	if ((cur_state == LEGUP_F_main_BB__85_521)) begin
		main_85_89_reg <= main_85_89;
		if (start == 1'b0 && ^(main_85_89) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_85_89_reg"); $finish; end
	end
	/* main: %85*/
	/*   %89 = fsub float %88, %hi.i.i.2*/
	if ((cur_state == LEGUP_F_main_BB__85_521)) begin
		main_85_89_reg <= main_85_89;
		if (start == 1'b0 && ^(main_85_89) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_85_89_reg"); $finish; end
	end
	/* main: %58*/
	/*   %hi.i.i.1 = fsub float %21, %.pn*/
	if ((cur_state == LEGUP_F_main_BB__58_176)) begin
		main_85_89_reg <= main_58_hiii1;
		if (start == 1'b0 && ^(main_58_hiii1) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_85_89_reg"); $finish; end
	end
	/* main: %80*/
	/*   %84 = fsub float 1.000000e+00, %83*/
	if ((cur_state == LEGUP_F_main_BB__80_445)) begin
		main_85_89_reg <= main_80_84;
		if (start == 1'b0 && ^(main_80_84) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_85_89_reg"); $finish; end
	end
end
always @(*) begin
	main_85_90 = main_altfp_subtract_32_0;
end
always @(*) begin
	/* main: %85*/
	/*   %91 = icmp sgt i32 %k.i.i.1, -126*/
		main_85_91 = ($signed(main_66_kii1_reg) > $signed(-32'd126));
end
always @(posedge clk) begin
	/* main: %85*/
	/*   %91 = icmp sgt i32 %k.i.i.1, -126*/
	if ((cur_state == LEGUP_F_main_BB__85_446)) begin
		main_85_91_reg <= main_85_91;
		if (start == 1'b0 && ^(main_85_91) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_85_91_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %85*/
	/*   %92 = bitcast float %90 to i32*/
		main_85_92 = main_85_90;
end
always @(posedge clk) begin
	/* main: %85*/
	/*   %92 = bitcast float %90 to i32*/
	if ((cur_state == LEGUP_F_main_BB__85_535)) begin
		main_85_92_reg <= main_85_92;
		if (start == 1'b0 && ^(main_85_92) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_85_92_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %85*/
	/*   %93 = shl i32 %k.i.i.1, 23*/
		main_85_93 = (main_66_kii1_reg <<< (32'd23 % 32));
end
always @(posedge clk) begin
	/* main: %85*/
	/*   %93 = shl i32 %k.i.i.1, 23*/
	if ((cur_state == LEGUP_F_main_BB__85_446)) begin
		main_85_93_reg <= main_85_93;
		if (start == 1'b0 && ^(main_85_93) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_85_93_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %94*/
	/*   %95 = add i32 %92, %93*/
		main_94_95 = (main_85_92_reg + main_85_93_reg);
end
always @(*) begin
	/* main: %94*/
	/*   %96 = bitcast i32 %95 to float*/
		main_94_96 = main_94_95;
end
always @(*) begin
	/* main: %97*/
	/*   %98 = add i32 %93, 838860800*/
		main_97_98 = (main_85_93_reg + 32'd838860800);
end
always @(*) begin
	/* main: %97*/
	/*   %99 = add i32 %92, %98*/
		main_97_99 = (main_85_92_reg + main_97_98);
end
always @(*) begin
	/* main: %97*/
	/*   %100 = bitcast i32 %99 to float*/
		main_97_100 = main_97_99;
end
always @(*) begin
	main_97_101 = main_altfp_multiply_32_0;
end
always @(*) begin
	/* main: %expf.exit*/
	/*   %lo.i.i.3 = phi float [ %lo.i.i.0, %26 ], [ %lo.i.i.2, %80 ], [ %lo.i.i.2, %94 ], [ %lo.i.i.2, %97 ], [ %lo.i.i.0, %64 ], [ %lo.i.i.0, %32 ], [ %lo.i.i.0, %30 ], [ %lo.i.i.0, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__26_102) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_loii3 = main_fusion1loop_bodydim1_loii0_reg;
	end
	/* main: %expf.exit*/
	/*   %lo.i.i.3 = phi float [ %lo.i.i.0, %26 ], [ %lo.i.i.2, %80 ], [ %lo.i.i.2, %94 ], [ %lo.i.i.2, %97 ], [ %lo.i.i.0, %64 ], [ %lo.i.i.0, %32 ], [ %lo.i.i.0, %30 ], [ %lo.i.i.0, %34 ]*/
	else if (((cur_state == LEGUP_F_main_BB__30_104) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_loii3 = main_fusion1loop_bodydim1_loii0_reg;
	end
	/* main: %expf.exit*/
	/*   %lo.i.i.3 = phi float [ %lo.i.i.0, %26 ], [ %lo.i.i.2, %80 ], [ %lo.i.i.2, %94 ], [ %lo.i.i.2, %97 ], [ %lo.i.i.0, %64 ], [ %lo.i.i.0, %32 ], [ %lo.i.i.0, %30 ], [ %lo.i.i.0, %34 ]*/
	else if ((((cur_state == LEGUP_F_main_BB__32_105) & (memory_controller_waitrequest == 1'd0)) & (main_32_33 == 1'd1))) begin
		main_expfexit_loii3 = main_fusion1loop_bodydim1_loii0_reg;
	end
	/* main: %expf.exit*/
	/*   %lo.i.i.3 = phi float [ %lo.i.i.0, %26 ], [ %lo.i.i.2, %80 ], [ %lo.i.i.2, %94 ], [ %lo.i.i.2, %97 ], [ %lo.i.i.0, %64 ], [ %lo.i.i.0, %32 ], [ %lo.i.i.0, %30 ], [ %lo.i.i.0, %34 ]*/
	else if ((((cur_state == LEGUP_F_main_BB__34_106) & (memory_controller_waitrequest == 1'd0)) & (main_34_orcond == 1'd1))) begin
		main_expfexit_loii3 = main_fusion1loop_bodydim1_loii0_reg;
	end
	/* main: %expf.exit*/
	/*   %lo.i.i.3 = phi float [ %lo.i.i.0, %26 ], [ %lo.i.i.2, %80 ], [ %lo.i.i.2, %94 ], [ %lo.i.i.2, %97 ], [ %lo.i.i.0, %64 ], [ %lo.i.i.0, %32 ], [ %lo.i.i.0, %30 ], [ %lo.i.i.0, %34 ]*/
	else if (((cur_state == LEGUP_F_main_BB__64_221) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_loii3 = main_fusion1loop_bodydim1_loii0_reg;
	end
	/* main: %expf.exit*/
	/*   %lo.i.i.3 = phi float [ %lo.i.i.0, %26 ], [ %lo.i.i.2, %80 ], [ %lo.i.i.2, %94 ], [ %lo.i.i.2, %97 ], [ %lo.i.i.0, %64 ], [ %lo.i.i.0, %32 ], [ %lo.i.i.0, %30 ], [ %lo.i.i.0, %34 ]*/
	else if (((cur_state == LEGUP_F_main_BB__80_445) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_loii3 = main_66_loii2_reg;
	end
	/* main: %expf.exit*/
	/*   %lo.i.i.3 = phi float [ %lo.i.i.0, %26 ], [ %lo.i.i.2, %80 ], [ %lo.i.i.2, %94 ], [ %lo.i.i.2, %97 ], [ %lo.i.i.0, %64 ], [ %lo.i.i.0, %32 ], [ %lo.i.i.0, %30 ], [ %lo.i.i.0, %34 ]*/
	else if (((cur_state == LEGUP_F_main_BB__94_536) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_loii3 = main_66_loii2_reg;
	end
	/* main: %expf.exit*/
	/*   %lo.i.i.3 = phi float [ %lo.i.i.0, %26 ], [ %lo.i.i.2, %80 ], [ %lo.i.i.2, %94 ], [ %lo.i.i.2, %97 ], [ %lo.i.i.0, %64 ], [ %lo.i.i.0, %32 ], [ %lo.i.i.0, %30 ], [ %lo.i.i.0, %34 ]*/
	else /* if (((cur_state == LEGUP_F_main_BB__97_548) & (memory_controller_waitrequest == 1'd0))) */ begin
		main_expfexit_loii3 = main_66_loii2_reg;
	end
end
always @(posedge clk) begin
	/* main: %expf.exit*/
	/*   %lo.i.i.3 = phi float [ %lo.i.i.0, %26 ], [ %lo.i.i.2, %80 ], [ %lo.i.i.2, %94 ], [ %lo.i.i.2, %97 ], [ %lo.i.i.0, %64 ], [ %lo.i.i.0, %32 ], [ %lo.i.i.0, %30 ], [ %lo.i.i.0, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__26_102) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_loii3_reg <= main_expfexit_loii3;
		if (start == 1'b0 && ^(main_expfexit_loii3) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_loii3_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %lo.i.i.3 = phi float [ %lo.i.i.0, %26 ], [ %lo.i.i.2, %80 ], [ %lo.i.i.2, %94 ], [ %lo.i.i.2, %97 ], [ %lo.i.i.0, %64 ], [ %lo.i.i.0, %32 ], [ %lo.i.i.0, %30 ], [ %lo.i.i.0, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__30_104) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_loii3_reg <= main_expfexit_loii3;
		if (start == 1'b0 && ^(main_expfexit_loii3) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_loii3_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %lo.i.i.3 = phi float [ %lo.i.i.0, %26 ], [ %lo.i.i.2, %80 ], [ %lo.i.i.2, %94 ], [ %lo.i.i.2, %97 ], [ %lo.i.i.0, %64 ], [ %lo.i.i.0, %32 ], [ %lo.i.i.0, %30 ], [ %lo.i.i.0, %34 ]*/
	if ((((cur_state == LEGUP_F_main_BB__32_105) & (memory_controller_waitrequest == 1'd0)) & (main_32_33 == 1'd1))) begin
		main_expfexit_loii3_reg <= main_expfexit_loii3;
		if (start == 1'b0 && ^(main_expfexit_loii3) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_loii3_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %lo.i.i.3 = phi float [ %lo.i.i.0, %26 ], [ %lo.i.i.2, %80 ], [ %lo.i.i.2, %94 ], [ %lo.i.i.2, %97 ], [ %lo.i.i.0, %64 ], [ %lo.i.i.0, %32 ], [ %lo.i.i.0, %30 ], [ %lo.i.i.0, %34 ]*/
	if ((((cur_state == LEGUP_F_main_BB__34_106) & (memory_controller_waitrequest == 1'd0)) & (main_34_orcond == 1'd1))) begin
		main_expfexit_loii3_reg <= main_expfexit_loii3;
		if (start == 1'b0 && ^(main_expfexit_loii3) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_loii3_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %lo.i.i.3 = phi float [ %lo.i.i.0, %26 ], [ %lo.i.i.2, %80 ], [ %lo.i.i.2, %94 ], [ %lo.i.i.2, %97 ], [ %lo.i.i.0, %64 ], [ %lo.i.i.0, %32 ], [ %lo.i.i.0, %30 ], [ %lo.i.i.0, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__64_221) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_loii3_reg <= main_expfexit_loii3;
		if (start == 1'b0 && ^(main_expfexit_loii3) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_loii3_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %lo.i.i.3 = phi float [ %lo.i.i.0, %26 ], [ %lo.i.i.2, %80 ], [ %lo.i.i.2, %94 ], [ %lo.i.i.2, %97 ], [ %lo.i.i.0, %64 ], [ %lo.i.i.0, %32 ], [ %lo.i.i.0, %30 ], [ %lo.i.i.0, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__80_445) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_loii3_reg <= main_expfexit_loii3;
		if (start == 1'b0 && ^(main_expfexit_loii3) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_loii3_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %lo.i.i.3 = phi float [ %lo.i.i.0, %26 ], [ %lo.i.i.2, %80 ], [ %lo.i.i.2, %94 ], [ %lo.i.i.2, %97 ], [ %lo.i.i.0, %64 ], [ %lo.i.i.0, %32 ], [ %lo.i.i.0, %30 ], [ %lo.i.i.0, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__94_536) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_loii3_reg <= main_expfexit_loii3;
		if (start == 1'b0 && ^(main_expfexit_loii3) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_loii3_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %lo.i.i.3 = phi float [ %lo.i.i.0, %26 ], [ %lo.i.i.2, %80 ], [ %lo.i.i.2, %94 ], [ %lo.i.i.2, %97 ], [ %lo.i.i.0, %64 ], [ %lo.i.i.0, %32 ], [ %lo.i.i.0, %30 ], [ %lo.i.i.0, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__97_548) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_loii3_reg <= main_expfexit_loii3;
		if (start == 1'b0 && ^(main_expfexit_loii3) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_loii3_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %expf.exit*/
	/*   %hi.i.i.3 = phi float [ %hi.i.i.0, %26 ], [ %hi.i.i.2, %80 ], [ %hi.i.i.2, %94 ], [ %hi.i.i.2, %97 ], [ %hi.i.i.0, %64 ], [ %hi.i.i.0, %32 ], [ %hi.i.i.0, %30 ], [ %hi.i.i.0, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__26_102) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_hiii3 = main_fusion1loop_bodydim1_hiii0_reg;
	end
	/* main: %expf.exit*/
	/*   %hi.i.i.3 = phi float [ %hi.i.i.0, %26 ], [ %hi.i.i.2, %80 ], [ %hi.i.i.2, %94 ], [ %hi.i.i.2, %97 ], [ %hi.i.i.0, %64 ], [ %hi.i.i.0, %32 ], [ %hi.i.i.0, %30 ], [ %hi.i.i.0, %34 ]*/
	else if (((cur_state == LEGUP_F_main_BB__30_104) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_hiii3 = main_fusion1loop_bodydim1_hiii0_reg;
	end
	/* main: %expf.exit*/
	/*   %hi.i.i.3 = phi float [ %hi.i.i.0, %26 ], [ %hi.i.i.2, %80 ], [ %hi.i.i.2, %94 ], [ %hi.i.i.2, %97 ], [ %hi.i.i.0, %64 ], [ %hi.i.i.0, %32 ], [ %hi.i.i.0, %30 ], [ %hi.i.i.0, %34 ]*/
	else if ((((cur_state == LEGUP_F_main_BB__32_105) & (memory_controller_waitrequest == 1'd0)) & (main_32_33 == 1'd1))) begin
		main_expfexit_hiii3 = main_fusion1loop_bodydim1_hiii0_reg;
	end
	/* main: %expf.exit*/
	/*   %hi.i.i.3 = phi float [ %hi.i.i.0, %26 ], [ %hi.i.i.2, %80 ], [ %hi.i.i.2, %94 ], [ %hi.i.i.2, %97 ], [ %hi.i.i.0, %64 ], [ %hi.i.i.0, %32 ], [ %hi.i.i.0, %30 ], [ %hi.i.i.0, %34 ]*/
	else if ((((cur_state == LEGUP_F_main_BB__34_106) & (memory_controller_waitrequest == 1'd0)) & (main_34_orcond == 1'd1))) begin
		main_expfexit_hiii3 = main_fusion1loop_bodydim1_hiii0_reg;
	end
	/* main: %expf.exit*/
	/*   %hi.i.i.3 = phi float [ %hi.i.i.0, %26 ], [ %hi.i.i.2, %80 ], [ %hi.i.i.2, %94 ], [ %hi.i.i.2, %97 ], [ %hi.i.i.0, %64 ], [ %hi.i.i.0, %32 ], [ %hi.i.i.0, %30 ], [ %hi.i.i.0, %34 ]*/
	else if (((cur_state == LEGUP_F_main_BB__64_221) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_hiii3 = main_fusion1loop_bodydim1_hiii0_reg;
	end
	/* main: %expf.exit*/
	/*   %hi.i.i.3 = phi float [ %hi.i.i.0, %26 ], [ %hi.i.i.2, %80 ], [ %hi.i.i.2, %94 ], [ %hi.i.i.2, %97 ], [ %hi.i.i.0, %64 ], [ %hi.i.i.0, %32 ], [ %hi.i.i.0, %30 ], [ %hi.i.i.0, %34 ]*/
	else if (((cur_state == LEGUP_F_main_BB__80_445) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_hiii3 = main_66_hiii2_reg;
	end
	/* main: %expf.exit*/
	/*   %hi.i.i.3 = phi float [ %hi.i.i.0, %26 ], [ %hi.i.i.2, %80 ], [ %hi.i.i.2, %94 ], [ %hi.i.i.2, %97 ], [ %hi.i.i.0, %64 ], [ %hi.i.i.0, %32 ], [ %hi.i.i.0, %30 ], [ %hi.i.i.0, %34 ]*/
	else if (((cur_state == LEGUP_F_main_BB__94_536) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_hiii3 = main_66_hiii2_reg;
	end
	/* main: %expf.exit*/
	/*   %hi.i.i.3 = phi float [ %hi.i.i.0, %26 ], [ %hi.i.i.2, %80 ], [ %hi.i.i.2, %94 ], [ %hi.i.i.2, %97 ], [ %hi.i.i.0, %64 ], [ %hi.i.i.0, %32 ], [ %hi.i.i.0, %30 ], [ %hi.i.i.0, %34 ]*/
	else /* if (((cur_state == LEGUP_F_main_BB__97_548) & (memory_controller_waitrequest == 1'd0))) */ begin
		main_expfexit_hiii3 = main_66_hiii2_reg;
	end
end
always @(posedge clk) begin
	/* main: %expf.exit*/
	/*   %hi.i.i.3 = phi float [ %hi.i.i.0, %26 ], [ %hi.i.i.2, %80 ], [ %hi.i.i.2, %94 ], [ %hi.i.i.2, %97 ], [ %hi.i.i.0, %64 ], [ %hi.i.i.0, %32 ], [ %hi.i.i.0, %30 ], [ %hi.i.i.0, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__26_102) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_hiii3_reg <= main_expfexit_hiii3;
		if (start == 1'b0 && ^(main_expfexit_hiii3) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_hiii3_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %hi.i.i.3 = phi float [ %hi.i.i.0, %26 ], [ %hi.i.i.2, %80 ], [ %hi.i.i.2, %94 ], [ %hi.i.i.2, %97 ], [ %hi.i.i.0, %64 ], [ %hi.i.i.0, %32 ], [ %hi.i.i.0, %30 ], [ %hi.i.i.0, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__30_104) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_hiii3_reg <= main_expfexit_hiii3;
		if (start == 1'b0 && ^(main_expfexit_hiii3) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_hiii3_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %hi.i.i.3 = phi float [ %hi.i.i.0, %26 ], [ %hi.i.i.2, %80 ], [ %hi.i.i.2, %94 ], [ %hi.i.i.2, %97 ], [ %hi.i.i.0, %64 ], [ %hi.i.i.0, %32 ], [ %hi.i.i.0, %30 ], [ %hi.i.i.0, %34 ]*/
	if ((((cur_state == LEGUP_F_main_BB__32_105) & (memory_controller_waitrequest == 1'd0)) & (main_32_33 == 1'd1))) begin
		main_expfexit_hiii3_reg <= main_expfexit_hiii3;
		if (start == 1'b0 && ^(main_expfexit_hiii3) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_hiii3_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %hi.i.i.3 = phi float [ %hi.i.i.0, %26 ], [ %hi.i.i.2, %80 ], [ %hi.i.i.2, %94 ], [ %hi.i.i.2, %97 ], [ %hi.i.i.0, %64 ], [ %hi.i.i.0, %32 ], [ %hi.i.i.0, %30 ], [ %hi.i.i.0, %34 ]*/
	if ((((cur_state == LEGUP_F_main_BB__34_106) & (memory_controller_waitrequest == 1'd0)) & (main_34_orcond == 1'd1))) begin
		main_expfexit_hiii3_reg <= main_expfexit_hiii3;
		if (start == 1'b0 && ^(main_expfexit_hiii3) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_hiii3_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %hi.i.i.3 = phi float [ %hi.i.i.0, %26 ], [ %hi.i.i.2, %80 ], [ %hi.i.i.2, %94 ], [ %hi.i.i.2, %97 ], [ %hi.i.i.0, %64 ], [ %hi.i.i.0, %32 ], [ %hi.i.i.0, %30 ], [ %hi.i.i.0, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__64_221) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_hiii3_reg <= main_expfexit_hiii3;
		if (start == 1'b0 && ^(main_expfexit_hiii3) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_hiii3_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %hi.i.i.3 = phi float [ %hi.i.i.0, %26 ], [ %hi.i.i.2, %80 ], [ %hi.i.i.2, %94 ], [ %hi.i.i.2, %97 ], [ %hi.i.i.0, %64 ], [ %hi.i.i.0, %32 ], [ %hi.i.i.0, %30 ], [ %hi.i.i.0, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__80_445) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_hiii3_reg <= main_expfexit_hiii3;
		if (start == 1'b0 && ^(main_expfexit_hiii3) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_hiii3_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %hi.i.i.3 = phi float [ %hi.i.i.0, %26 ], [ %hi.i.i.2, %80 ], [ %hi.i.i.2, %94 ], [ %hi.i.i.2, %97 ], [ %hi.i.i.0, %64 ], [ %hi.i.i.0, %32 ], [ %hi.i.i.0, %30 ], [ %hi.i.i.0, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__94_536) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_hiii3_reg <= main_expfexit_hiii3;
		if (start == 1'b0 && ^(main_expfexit_hiii3) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_hiii3_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %hi.i.i.3 = phi float [ %hi.i.i.0, %26 ], [ %hi.i.i.2, %80 ], [ %hi.i.i.2, %94 ], [ %hi.i.i.2, %97 ], [ %hi.i.i.0, %64 ], [ %hi.i.i.0, %32 ], [ %hi.i.i.0, %30 ], [ %hi.i.i.0, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__97_548) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_hiii3_reg <= main_expfexit_hiii3;
		if (start == 1'b0 && ^(main_expfexit_hiii3) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_hiii3_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %expf.exit*/
	/*   %.0 = phi float [ %27, %26 ], [ %84, %80 ], [ %96, %94 ], [ %101, %97 ], [ %65, %64 ], [ 0x7FF0000000000000, %32 ], [ %., %30 ], [ 0.000000e+00, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__26_102) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_0 = main_26_27;
	end
	/* main: %expf.exit*/
	/*   %.0 = phi float [ %27, %26 ], [ %84, %80 ], [ %96, %94 ], [ %101, %97 ], [ %65, %64 ], [ 0x7FF0000000000000, %32 ], [ %., %30 ], [ 0.000000e+00, %34 ]*/
	else if (((cur_state == LEGUP_F_main_BB__30_104) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_0 = main_30_;
	end
	/* main: %expf.exit*/
	/*   %.0 = phi float [ %27, %26 ], [ %84, %80 ], [ %96, %94 ], [ %101, %97 ], [ %65, %64 ], [ 0x7FF0000000000000, %32 ], [ %., %30 ], [ 0.000000e+00, %34 ]*/
	else if ((((cur_state == LEGUP_F_main_BB__32_105) & (memory_controller_waitrequest == 1'd0)) & (main_32_33 == 1'd1))) begin
		main_expfexit_0 = 32'h7F800000;
	end
	/* main: %expf.exit*/
	/*   %.0 = phi float [ %27, %26 ], [ %84, %80 ], [ %96, %94 ], [ %101, %97 ], [ %65, %64 ], [ 0x7FF0000000000000, %32 ], [ %., %30 ], [ 0.000000e+00, %34 ]*/
	else if ((((cur_state == LEGUP_F_main_BB__34_106) & (memory_controller_waitrequest == 1'd0)) & (main_34_orcond == 1'd1))) begin
		main_expfexit_0 = 32'h0;
	end
	/* main: %expf.exit*/
	/*   %.0 = phi float [ %27, %26 ], [ %84, %80 ], [ %96, %94 ], [ %101, %97 ], [ %65, %64 ], [ 0x7FF0000000000000, %32 ], [ %., %30 ], [ 0.000000e+00, %34 ]*/
	else if (((cur_state == LEGUP_F_main_BB__64_221) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_0 = main_64_65;
	end
	/* main: %expf.exit*/
	/*   %.0 = phi float [ %27, %26 ], [ %84, %80 ], [ %96, %94 ], [ %101, %97 ], [ %65, %64 ], [ 0x7FF0000000000000, %32 ], [ %., %30 ], [ 0.000000e+00, %34 ]*/
	else if (((cur_state == LEGUP_F_main_BB__80_445) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_0 = main_80_84;
	end
	/* main: %expf.exit*/
	/*   %.0 = phi float [ %27, %26 ], [ %84, %80 ], [ %96, %94 ], [ %101, %97 ], [ %65, %64 ], [ 0x7FF0000000000000, %32 ], [ %., %30 ], [ 0.000000e+00, %34 ]*/
	else if (((cur_state == LEGUP_F_main_BB__94_536) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_0 = main_94_96;
	end
	/* main: %expf.exit*/
	/*   %.0 = phi float [ %27, %26 ], [ %84, %80 ], [ %96, %94 ], [ %101, %97 ], [ %65, %64 ], [ 0x7FF0000000000000, %32 ], [ %., %30 ], [ 0.000000e+00, %34 ]*/
	else /* if (((cur_state == LEGUP_F_main_BB__97_548) & (memory_controller_waitrequest == 1'd0))) */ begin
		main_expfexit_0 = main_97_101;
	end
end
always @(posedge clk) begin
	/* main: %expf.exit*/
	/*   %.0 = phi float [ %27, %26 ], [ %84, %80 ], [ %96, %94 ], [ %101, %97 ], [ %65, %64 ], [ 0x7FF0000000000000, %32 ], [ %., %30 ], [ 0.000000e+00, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__26_102) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_0_reg <= main_expfexit_0;
		if (start == 1'b0 && ^(main_expfexit_0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_0_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %.0 = phi float [ %27, %26 ], [ %84, %80 ], [ %96, %94 ], [ %101, %97 ], [ %65, %64 ], [ 0x7FF0000000000000, %32 ], [ %., %30 ], [ 0.000000e+00, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__30_104) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_0_reg <= main_expfexit_0;
		if (start == 1'b0 && ^(main_expfexit_0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_0_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %.0 = phi float [ %27, %26 ], [ %84, %80 ], [ %96, %94 ], [ %101, %97 ], [ %65, %64 ], [ 0x7FF0000000000000, %32 ], [ %., %30 ], [ 0.000000e+00, %34 ]*/
	if ((((cur_state == LEGUP_F_main_BB__32_105) & (memory_controller_waitrequest == 1'd0)) & (main_32_33 == 1'd1))) begin
		main_expfexit_0_reg <= main_expfexit_0;
		if (start == 1'b0 && ^(main_expfexit_0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_0_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %.0 = phi float [ %27, %26 ], [ %84, %80 ], [ %96, %94 ], [ %101, %97 ], [ %65, %64 ], [ 0x7FF0000000000000, %32 ], [ %., %30 ], [ 0.000000e+00, %34 ]*/
	if ((((cur_state == LEGUP_F_main_BB__34_106) & (memory_controller_waitrequest == 1'd0)) & (main_34_orcond == 1'd1))) begin
		main_expfexit_0_reg <= main_expfexit_0;
		if (start == 1'b0 && ^(main_expfexit_0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_0_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %.0 = phi float [ %27, %26 ], [ %84, %80 ], [ %96, %94 ], [ %101, %97 ], [ %65, %64 ], [ 0x7FF0000000000000, %32 ], [ %., %30 ], [ 0.000000e+00, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__64_221) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_0_reg <= main_expfexit_0;
		if (start == 1'b0 && ^(main_expfexit_0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_0_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %.0 = phi float [ %27, %26 ], [ %84, %80 ], [ %96, %94 ], [ %101, %97 ], [ %65, %64 ], [ 0x7FF0000000000000, %32 ], [ %., %30 ], [ 0.000000e+00, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__80_445) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_0_reg <= main_expfexit_0;
		if (start == 1'b0 && ^(main_expfexit_0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_0_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %.0 = phi float [ %27, %26 ], [ %84, %80 ], [ %96, %94 ], [ %101, %97 ], [ %65, %64 ], [ 0x7FF0000000000000, %32 ], [ %., %30 ], [ 0.000000e+00, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__94_536) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_0_reg <= main_expfexit_0;
		if (start == 1'b0 && ^(main_expfexit_0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_0_reg"); $finish; end
	end
	/* main: %expf.exit*/
	/*   %.0 = phi float [ %27, %26 ], [ %84, %80 ], [ %96, %94 ], [ %101, %97 ], [ %65, %64 ], [ 0x7FF0000000000000, %32 ], [ %., %30 ], [ 0.000000e+00, %34 ]*/
	if (((cur_state == LEGUP_F_main_BB__97_548) & (memory_controller_waitrequest == 1'd0))) begin
		main_expfexit_0_reg <= main_expfexit_0;
		if (start == 1'b0 && ^(main_expfexit_0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_0_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %expf.exit*/
	/*   %102 = add nuw nsw i64 %fusion.1.indvar.dim.18, 1*/
		main_expfexit_102 = (main_fusion1loop_bodydim1_fusion1indvardim18_reg + 64'd1);
end
always @(posedge clk) begin
	/* main: %expf.exit*/
	/*   %102 = add nuw nsw i64 %fusion.1.indvar.dim.18, 1*/
	if ((cur_state == LEGUP_F_main_BB_expfexit_549)) begin
		main_expfexit_102_reg <= main_expfexit_102;
		if (start == 1'b0 && ^(main_expfexit_102) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_102_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %expf.exit*/
	/*   %exitcond4 = icmp eq i64 %102, 10*/
		main_expfexit_exitcond4 = (main_expfexit_102 == 64'd10);
end
always @(posedge clk) begin
	/* main: %expf.exit*/
	/*   %exitcond4 = icmp eq i64 %102, 10*/
	if ((cur_state == LEGUP_F_main_BB_expfexit_549)) begin
		main_expfexit_exitcond4_reg <= main_expfexit_exitcond4;
		if (start == 1'b0 && ^(main_expfexit_exitcond4) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_expfexit_exitcond4_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %103 = phi float [ %105, %reduce.1.inner.loop_body.reduction_dim.1 ], [ 0.000000e+00, %reduce.1.inner.loop_body.reduction_dim.1.preheader ]*/
	if (((cur_state == LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1preheader_551) & (memory_controller_waitrequest == 1'd0))) begin
		main_reduce1innerloop_bodyreduction_dim1_103 = 32'h0;
	end
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %103 = phi float [ %105, %reduce.1.inner.loop_body.reduction_dim.1 ], [ 0.000000e+00, %reduce.1.inner.loop_body.reduction_dim.1.preheader ]*/
	else /* if ((((cur_state == LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_568) & (memory_controller_waitrequest == 1'd0)) & (main_reduce1innerloop_bodyreduction_dim1_exitcond_reg == 1'd0))) */ begin
		main_reduce1innerloop_bodyreduction_dim1_103 = main_reduce1innerloop_bodyreduction_dim1_105;
	end
end
always @(posedge clk) begin
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %103 = phi float [ %105, %reduce.1.inner.loop_body.reduction_dim.1 ], [ 0.000000e+00, %reduce.1.inner.loop_body.reduction_dim.1.preheader ]*/
	if (((cur_state == LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1preheader_551) & (memory_controller_waitrequest == 1'd0))) begin
		main_reduce1innerloop_bodyreduction_dim1_103_reg <= main_reduce1innerloop_bodyreduction_dim1_103;
		if (start == 1'b0 && ^(main_reduce1innerloop_bodyreduction_dim1_103) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_reduce1innerloop_bodyreduction_dim1_103_reg"); $finish; end
	end
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %103 = phi float [ %105, %reduce.1.inner.loop_body.reduction_dim.1 ], [ 0.000000e+00, %reduce.1.inner.loop_body.reduction_dim.1.preheader ]*/
	if ((((cur_state == LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_568) & (memory_controller_waitrequest == 1'd0)) & (main_reduce1innerloop_bodyreduction_dim1_exitcond_reg == 1'd0))) begin
		main_reduce1innerloop_bodyreduction_dim1_103_reg <= main_reduce1innerloop_bodyreduction_dim1_103;
		if (start == 1'b0 && ^(main_reduce1innerloop_bodyreduction_dim1_103) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_reduce1innerloop_bodyreduction_dim1_103_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %reduce.1.inner.indvar.reduction_dim.14 = phi i64 [ %106, %reduce.1.inner.loop_body.reduction_dim.1 ], [ 0, %reduce.1.inner.loop_body.reduction_dim.1.preheader ]*/
	if (((cur_state == LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1preheader_551) & (memory_controller_waitrequest == 1'd0))) begin
		main_reduce1innerloop_bodyreduction_dim1_reduce1innerindvarreduction_dim14 = 64'd0;
	end
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %reduce.1.inner.indvar.reduction_dim.14 = phi i64 [ %106, %reduce.1.inner.loop_body.reduction_dim.1 ], [ 0, %reduce.1.inner.loop_body.reduction_dim.1.preheader ]*/
	else /* if ((((cur_state == LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_568) & (memory_controller_waitrequest == 1'd0)) & (main_reduce1innerloop_bodyreduction_dim1_exitcond_reg == 1'd0))) */ begin
		main_reduce1innerloop_bodyreduction_dim1_reduce1innerindvarreduction_dim14 = main_reduce1innerloop_bodyreduction_dim1_106_reg;
	end
end
always @(posedge clk) begin
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %reduce.1.inner.indvar.reduction_dim.14 = phi i64 [ %106, %reduce.1.inner.loop_body.reduction_dim.1 ], [ 0, %reduce.1.inner.loop_body.reduction_dim.1.preheader ]*/
	if (((cur_state == LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1preheader_551) & (memory_controller_waitrequest == 1'd0))) begin
		main_reduce1innerloop_bodyreduction_dim1_reduce1innerindvarreduction_dim14_reg <= main_reduce1innerloop_bodyreduction_dim1_reduce1innerindvarreduction_dim14;
		if (start == 1'b0 && ^(main_reduce1innerloop_bodyreduction_dim1_reduce1innerindvarreduction_dim14) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_reduce1innerloop_bodyreduction_dim1_reduce1innerindvarreduction_dim14_reg"); $finish; end
	end
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %reduce.1.inner.indvar.reduction_dim.14 = phi i64 [ %106, %reduce.1.inner.loop_body.reduction_dim.1 ], [ 0, %reduce.1.inner.loop_body.reduction_dim.1.preheader ]*/
	if ((((cur_state == LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_568) & (memory_controller_waitrequest == 1'd0)) & (main_reduce1innerloop_bodyreduction_dim1_exitcond_reg == 1'd0))) begin
		main_reduce1innerloop_bodyreduction_dim1_reduce1innerindvarreduction_dim14_reg <= main_reduce1innerloop_bodyreduction_dim1_reduce1innerindvarreduction_dim14;
		if (start == 1'b0 && ^(main_reduce1innerloop_bodyreduction_dim1_reduce1innerindvarreduction_dim14) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_reduce1innerloop_bodyreduction_dim1_reduce1innerindvarreduction_dim14_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %scevgep3 = getelementptr [1 x [10 x float]]* @temp1, i64 0, i64 0, i64 %reduce.1.inner.indvar.reduction_dim.14*/
		main_reduce1innerloop_bodyreduction_dim1_scevgep3 = (`TAG_g_temp1_a + (64'd4 * main_reduce1innerloop_bodyreduction_dim1_reduce1innerindvarreduction_dim14_reg));
end
always @(*) begin
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %104 = load float* %scevgep3, align 4*/
		main_reduce1innerloop_bodyreduction_dim1_104 = memory_controller_out_b[31:0];
end
always @(*) begin
	main_reduce1innerloop_bodyreduction_dim1_105 = main_altfp_add_32_0;
end
always @(posedge clk) begin
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %105 = fadd float %103, %104*/
	if ((cur_state == LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_568)) begin
		main_reduce1innerloop_bodyreduction_dim1_105_reg <= main_reduce1innerloop_bodyreduction_dim1_105;
		if (start == 1'b0 && ^(main_reduce1innerloop_bodyreduction_dim1_105) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_reduce1innerloop_bodyreduction_dim1_105_reg"); $finish; end
	end
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %105 = fadd float %103, %104*/
	if ((cur_state == LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_568)) begin
		main_reduce1innerloop_bodyreduction_dim1_105_reg <= main_reduce1innerloop_bodyreduction_dim1_105;
		if (start == 1'b0 && ^(main_reduce1innerloop_bodyreduction_dim1_105) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_reduce1innerloop_bodyreduction_dim1_105_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %106 = add nuw nsw i64 %reduce.1.inner.indvar.reduction_dim.14, 1*/
		main_reduce1innerloop_bodyreduction_dim1_106 = (main_reduce1innerloop_bodyreduction_dim1_reduce1innerindvarreduction_dim14_reg + 64'd1);
end
always @(posedge clk) begin
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %106 = add nuw nsw i64 %reduce.1.inner.indvar.reduction_dim.14, 1*/
	if ((cur_state == LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_552)) begin
		main_reduce1innerloop_bodyreduction_dim1_106_reg <= main_reduce1innerloop_bodyreduction_dim1_106;
		if (start == 1'b0 && ^(main_reduce1innerloop_bodyreduction_dim1_106) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_reduce1innerloop_bodyreduction_dim1_106_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %exitcond = icmp eq i64 %106, 10*/
		main_reduce1innerloop_bodyreduction_dim1_exitcond = (main_reduce1innerloop_bodyreduction_dim1_106 == 64'd10);
end
always @(posedge clk) begin
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %exitcond = icmp eq i64 %106, 10*/
	if ((cur_state == LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_552)) begin
		main_reduce1innerloop_bodyreduction_dim1_exitcond_reg <= main_reduce1innerloop_bodyreduction_dim1_exitcond;
		if (start == 1'b0 && ^(main_reduce1innerloop_bodyreduction_dim1_exitcond) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_reduce1innerloop_bodyreduction_dim1_exitcond_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %fusion.loop_body.dim.0*/
	/*   %fusion.indvar.dim.02 = phi i64 [ %109, %fusion.loop_body.dim.0 ], [ 0, %fusion.loop_body.dim.0.preheader ]*/
	if (((cur_state == LEGUP_F_main_BB_fusionloop_bodydim0preheader_569) & (memory_controller_waitrequest == 1'd0))) begin
		main_fusionloop_bodydim0_fusionindvardim02 = 64'd0;
	end
	/* main: %fusion.loop_body.dim.0*/
	/*   %fusion.indvar.dim.02 = phi i64 [ %109, %fusion.loop_body.dim.0 ], [ 0, %fusion.loop_body.dim.0.preheader ]*/
	else /* if ((((cur_state == LEGUP_F_main_BB_fusionloop_bodydim0_606) & (memory_controller_waitrequest == 1'd0)) & (main_fusionloop_bodydim0_exitcond1_reg == 1'd0))) */ begin
		main_fusionloop_bodydim0_fusionindvardim02 = main_fusionloop_bodydim0_109_reg;
	end
end
always @(posedge clk) begin
	/* main: %fusion.loop_body.dim.0*/
	/*   %fusion.indvar.dim.02 = phi i64 [ %109, %fusion.loop_body.dim.0 ], [ 0, %fusion.loop_body.dim.0.preheader ]*/
	if (((cur_state == LEGUP_F_main_BB_fusionloop_bodydim0preheader_569) & (memory_controller_waitrequest == 1'd0))) begin
		main_fusionloop_bodydim0_fusionindvardim02_reg <= main_fusionloop_bodydim0_fusionindvardim02;
		if (start == 1'b0 && ^(main_fusionloop_bodydim0_fusionindvardim02) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusionloop_bodydim0_fusionindvardim02_reg"); $finish; end
	end
	/* main: %fusion.loop_body.dim.0*/
	/*   %fusion.indvar.dim.02 = phi i64 [ %109, %fusion.loop_body.dim.0 ], [ 0, %fusion.loop_body.dim.0.preheader ]*/
	if ((((cur_state == LEGUP_F_main_BB_fusionloop_bodydim0_606) & (memory_controller_waitrequest == 1'd0)) & (main_fusionloop_bodydim0_exitcond1_reg == 1'd0))) begin
		main_fusionloop_bodydim0_fusionindvardim02_reg <= main_fusionloop_bodydim0_fusionindvardim02;
		if (start == 1'b0 && ^(main_fusionloop_bodydim0_fusionindvardim02) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusionloop_bodydim0_fusionindvardim02_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %fusion.loop_body.dim.0*/
	/*   %scevgep = getelementptr [10 x float]* @temp3, i64 0, i64 %fusion.indvar.dim.02*/
		main_fusionloop_bodydim0_scevgep = (`TAG_g_temp3_a + (64'd4 * main_fusionloop_bodydim0_fusionindvardim02_reg));
end
always @(posedge clk) begin
	/* main: %fusion.loop_body.dim.0*/
	/*   %scevgep = getelementptr [10 x float]* @temp3, i64 0, i64 %fusion.indvar.dim.02*/
	if ((cur_state == LEGUP_F_main_BB_fusionloop_bodydim0_570)) begin
		main_fusionloop_bodydim0_scevgep_reg <= main_fusionloop_bodydim0_scevgep;
		if (start == 1'b0 && ^(main_fusionloop_bodydim0_scevgep) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusionloop_bodydim0_scevgep_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %fusion.loop_body.dim.0*/
	/*   %scevgep2 = getelementptr [1 x [10 x float]]* @temp1, i64 0, i64 0, i64 %fusion.indvar.dim.02*/
		main_fusionloop_bodydim0_scevgep2 = (`TAG_g_temp1_a + (64'd4 * main_fusionloop_bodydim0_fusionindvardim02_reg));
end
always @(*) begin
	/* main: %fusion.loop_body.dim.0*/
	/*   %107 = load float* %scevgep2, align 4*/
		main_fusionloop_bodydim0_107 = memory_controller_out_b[31:0];
end
always @(*) begin
	main_fusionloop_bodydim0_108 = main_altfp_divide_32_0;
end
always @(*) begin
	/* main: %fusion.loop_body.dim.0*/
	/*   %109 = add nuw nsw i64 %fusion.indvar.dim.02, 1*/
		main_fusionloop_bodydim0_109 = (main_fusionloop_bodydim0_fusionindvardim02_reg + 64'd1);
end
always @(posedge clk) begin
	/* main: %fusion.loop_body.dim.0*/
	/*   %109 = add nuw nsw i64 %fusion.indvar.dim.02, 1*/
	if ((cur_state == LEGUP_F_main_BB_fusionloop_bodydim0_570)) begin
		main_fusionloop_bodydim0_109_reg <= main_fusionloop_bodydim0_109;
		if (start == 1'b0 && ^(main_fusionloop_bodydim0_109) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusionloop_bodydim0_109_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %fusion.loop_body.dim.0*/
	/*   %exitcond1 = icmp eq i64 %109, 10*/
		main_fusionloop_bodydim0_exitcond1 = (main_fusionloop_bodydim0_109 == 64'd10);
end
always @(posedge clk) begin
	/* main: %fusion.loop_body.dim.0*/
	/*   %exitcond1 = icmp eq i64 %109, 10*/
	if ((cur_state == LEGUP_F_main_BB_fusionloop_bodydim0_570)) begin
		main_fusionloop_bodydim0_exitcond1_reg <= main_fusionloop_bodydim0_exitcond1;
		if (start == 1'b0 && ^(main_fusionloop_bodydim0_exitcond1) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_fusionloop_bodydim0_exitcond1_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %fusion.loop_exit.dim.0*/
	/*   %leflow_retval = load volatile float* getelementptr inbounds ([10 x float]* @temp3, i64 0, i64 0), align 8*/
		main_fusionloop_exitdim0_leflow_retval = memory_controller_out_b[31:0];
end
always @(*) begin
	/* main: %dot.loop_body.reduction*/
	/*   %3 = fmul float %1, %2*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_4)) begin
		main_altfp_multiply_32_0_op0 = main_dotloop_bodyreduction_1;
	end
	/* main: %48*/
	/*   %49 = fmul float %21, 0x3FF7154760000000*/
	else if ((cur_state == LEGUP_F_main_BB__48_112)) begin
		main_altfp_multiply_32_0_op0 = main_fusion1loop_bodydim1_21_reg;
	end
	/* main: %48*/
	/*   %56 = fmul float %55, 0x3FE62E3000000000*/
	else if ((cur_state == LEGUP_F_main_BB__48_149)) begin
		main_altfp_multiply_32_0_op0 = main_48_55;
	end
	/* main: %48*/
	/*   %57 = fmul float %55, 0x3EE2FEFA20000000*/
	else if ((cur_state == LEGUP_F_main_BB__48_150)) begin
		main_altfp_multiply_32_0_op0 = main_48_55_reg;
	end
	/* main: %66*/
	/*   %67 = fmul float %.048, %.048*/
	else if ((cur_state == LEGUP_F_main_BB__66_222)) begin
		main_altfp_multiply_32_0_op0 = main_66_048_reg;
	end
	/* main: %66*/
	/*   %68 = fmul float %67, 0x3E66376980000000*/
	else if ((cur_state == LEGUP_F_main_BB__66_233)) begin
		main_altfp_multiply_32_0_op0 = main_66_67;
	end
	/* main: %66*/
	/*   %70 = fmul float %67, %69*/
	else if ((cur_state == LEGUP_F_main_BB__66_258)) begin
		main_altfp_multiply_32_0_op0 = main_66_67_reg;
	end
	/* main: %66*/
	/*   %72 = fmul float %67, %71*/
	else if ((cur_state == LEGUP_F_main_BB__66_283)) begin
		main_altfp_multiply_32_0_op0 = main_66_67_reg;
	end
	/* main: %66*/
	/*   %74 = fmul float %67, %73*/
	else if ((cur_state == LEGUP_F_main_BB__66_308)) begin
		main_altfp_multiply_32_0_op0 = main_66_67_reg;
	end
	/* main: %66*/
	/*   %76 = fmul float %67, %75*/
	else if ((cur_state == LEGUP_F_main_BB__66_333)) begin
		main_altfp_multiply_32_0_op0 = main_66_67_reg;
	end
	/* main: %66*/
	/*   %79 = fmul float %.048, %77*/
	else if ((cur_state == LEGUP_F_main_BB__66_358)) begin
		main_altfp_multiply_32_0_op0 = main_66_048_reg;
	end
	/* main: %97*/
	/*   %101 = fmul float %100, 0x39B0000000000000*/
	else /* if ((cur_state == LEGUP_F_main_BB__97_537)) */ begin
		main_altfp_multiply_32_0_op0 = main_97_100;
	end
end
always @(*) begin
	/* main: %dot.loop_body.reduction*/
	/*   %3 = fmul float %1, %2*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_4)) begin
		main_altfp_multiply_32_0_op1 = main_dotloop_bodyreduction_2;
	end
	/* main: %48*/
	/*   %49 = fmul float %21, 0x3FF7154760000000*/
	else if ((cur_state == LEGUP_F_main_BB__48_112)) begin
		main_altfp_multiply_32_0_op1 = 32'h3FB8AA3B;
	end
	/* main: %48*/
	/*   %56 = fmul float %55, 0x3FE62E3000000000*/
	else if ((cur_state == LEGUP_F_main_BB__48_149)) begin
		main_altfp_multiply_32_0_op1 = 32'h3F317180;
	end
	/* main: %48*/
	/*   %57 = fmul float %55, 0x3EE2FEFA20000000*/
	else if ((cur_state == LEGUP_F_main_BB__48_150)) begin
		main_altfp_multiply_32_0_op1 = 32'h3717F7D1;
	end
	/* main: %66*/
	/*   %67 = fmul float %.048, %.048*/
	else if ((cur_state == LEGUP_F_main_BB__66_222)) begin
		main_altfp_multiply_32_0_op1 = main_66_048_reg;
	end
	/* main: %66*/
	/*   %68 = fmul float %67, 0x3E66376980000000*/
	else if ((cur_state == LEGUP_F_main_BB__66_233)) begin
		main_altfp_multiply_32_0_op1 = 32'h3331BB4C;
	end
	/* main: %66*/
	/*   %70 = fmul float %67, %69*/
	else if ((cur_state == LEGUP_F_main_BB__66_258)) begin
		main_altfp_multiply_32_0_op1 = main_66_69;
	end
	/* main: %66*/
	/*   %72 = fmul float %67, %71*/
	else if ((cur_state == LEGUP_F_main_BB__66_283)) begin
		main_altfp_multiply_32_0_op1 = main_66_71;
	end
	/* main: %66*/
	/*   %74 = fmul float %67, %73*/
	else if ((cur_state == LEGUP_F_main_BB__66_308)) begin
		main_altfp_multiply_32_0_op1 = main_66_73;
	end
	/* main: %66*/
	/*   %76 = fmul float %67, %75*/
	else if ((cur_state == LEGUP_F_main_BB__66_333)) begin
		main_altfp_multiply_32_0_op1 = main_66_75;
	end
	/* main: %66*/
	/*   %79 = fmul float %.048, %77*/
	else if ((cur_state == LEGUP_F_main_BB__66_358)) begin
		main_altfp_multiply_32_0_op1 = main_66_77;
	end
	/* main: %97*/
	/*   %101 = fmul float %100, 0x39B0000000000000*/
	else /* if ((cur_state == LEGUP_F_main_BB__97_537)) */ begin
		main_altfp_multiply_32_0_op1 = 32'hD800000;
	end
end
always @(*) begin
	altfp_main_dotloop_bodyreduction_3_en = (memory_controller_waitrequest == 1'd0);
end
always @(*) begin
	main_altfp_multiply_32_0 = altfp_multiplier_main_dotloop_bodyreduction_3_out;
end
always @(*) begin
	/* main: %dot.loop_body.reduction*/
	/*   %4 = fadd float %0, %3*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_15)) begin
		main_altfp_add_32_0_op0 = main_dotloop_bodyreduction_0_reg;
	end
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %9 = fadd float %7, %8*/
	else if ((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_35)) begin
		main_altfp_add_32_0_op0 = main_fusion2loop_bodydim1_7;
	end
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %20 = fadd float %18, %19*/
	else if ((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1_59)) begin
		main_altfp_add_32_0_op0 = main_fusion1loop_bodydim1_18;
	end
	/* main: %26*/
	/*   %27 = fadd float %21, %21*/
	else if ((cur_state == LEGUP_F_main_BB__26_88)) begin
		main_altfp_add_32_0_op0 = main_fusion1loop_bodydim1_21_reg;
	end
	/* main: %48*/
	/*   %53 = fadd float %49, %52*/
	else if ((cur_state == LEGUP_F_main_BB__48_123)) begin
		main_altfp_add_32_0_op0 = main_48_49;
	end
	/* main: %60*/
	/*   %62 = fadd float %21, 0x46293E5940000000*/
	else if ((cur_state == LEGUP_F_main_BB__60_191)) begin
		main_altfp_add_32_0_op0 = main_fusion1loop_bodydim1_21_reg;
	end
	/* main: %64*/
	/*   %65 = fadd float %21, 1.000000e+00*/
	else if ((cur_state == LEGUP_F_main_BB__64_207)) begin
		main_altfp_add_32_0_op0 = main_fusion1loop_bodydim1_21_reg;
	end
	/* main: %66*/
	/*   %69 = fadd float %68, 0xBEBBBD41C0000000*/
	else if ((cur_state == LEGUP_F_main_BB__66_244)) begin
		main_altfp_add_32_0_op0 = main_66_68;
	end
	/* main: %66*/
	/*   %71 = fadd float %70, 0x3F11566AA0000000*/
	else if ((cur_state == LEGUP_F_main_BB__66_269)) begin
		main_altfp_add_32_0_op0 = main_66_70;
	end
	/* main: %66*/
	/*   %73 = fadd float %72, 0xBF66C16C20000000*/
	else if ((cur_state == LEGUP_F_main_BB__66_294)) begin
		main_altfp_add_32_0_op0 = main_66_72;
	end
	/* main: %66*/
	/*   %75 = fadd float %74, 0x3FC5555560000000*/
	else if ((cur_state == LEGUP_F_main_BB__66_319)) begin
		main_altfp_add_32_0_op0 = main_66_74;
	end
	/* main: %80*/
	/*   %81 = fadd float %77, -2.000000e+00*/
	else if ((cur_state == LEGUP_F_main_BB__80_370)) begin
		main_altfp_add_32_0_op0 = main_66_77_reg;
	end
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %105 = fadd float %103, %104*/
	else /* if ((cur_state == LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_554)) */ begin
		main_altfp_add_32_0_op0 = main_reduce1innerloop_bodyreduction_dim1_103_reg;
	end
end
always @(*) begin
	/* main: %dot.loop_body.reduction*/
	/*   %4 = fadd float %0, %3*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_15)) begin
		main_altfp_add_32_0_op1 = main_dotloop_bodyreduction_3;
	end
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %9 = fadd float %7, %8*/
	else if ((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_35)) begin
		main_altfp_add_32_0_op1 = main_fusion2loop_bodydim1_8;
	end
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %20 = fadd float %18, %19*/
	else if ((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1_59)) begin
		main_altfp_add_32_0_op1 = main_fusion1loop_bodydim1_19;
	end
	/* main: %26*/
	/*   %27 = fadd float %21, %21*/
	else if ((cur_state == LEGUP_F_main_BB__26_88)) begin
		main_altfp_add_32_0_op1 = main_fusion1loop_bodydim1_21_reg;
	end
	/* main: %48*/
	/*   %53 = fadd float %49, %52*/
	else if ((cur_state == LEGUP_F_main_BB__48_123)) begin
		main_altfp_add_32_0_op1 = main_48_52_reg;
	end
	/* main: %60*/
	/*   %62 = fadd float %21, 0x46293E5940000000*/
	else if ((cur_state == LEGUP_F_main_BB__60_191)) begin
		main_altfp_add_32_0_op1 = 32'h7149F2CA;
	end
	/* main: %64*/
	/*   %65 = fadd float %21, 1.000000e+00*/
	else if ((cur_state == LEGUP_F_main_BB__64_207)) begin
		main_altfp_add_32_0_op1 = 32'h3F800000;
	end
	/* main: %66*/
	/*   %69 = fadd float %68, 0xBEBBBD41C0000000*/
	else if ((cur_state == LEGUP_F_main_BB__66_244)) begin
		main_altfp_add_32_0_op1 = 32'hB5DDEA0E;
	end
	/* main: %66*/
	/*   %71 = fadd float %70, 0x3F11566AA0000000*/
	else if ((cur_state == LEGUP_F_main_BB__66_269)) begin
		main_altfp_add_32_0_op1 = 32'h388AB355;
	end
	/* main: %66*/
	/*   %73 = fadd float %72, 0xBF66C16C20000000*/
	else if ((cur_state == LEGUP_F_main_BB__66_294)) begin
		main_altfp_add_32_0_op1 = 32'hBB360B61;
	end
	/* main: %66*/
	/*   %75 = fadd float %74, 0x3FC5555560000000*/
	else if ((cur_state == LEGUP_F_main_BB__66_319)) begin
		main_altfp_add_32_0_op1 = 32'h3E2AAAAB;
	end
	/* main: %80*/
	/*   %81 = fadd float %77, -2.000000e+00*/
	else if ((cur_state == LEGUP_F_main_BB__80_370)) begin
		main_altfp_add_32_0_op1 = 32'hC0000000;
	end
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %105 = fadd float %103, %104*/
	else /* if ((cur_state == LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_554)) */ begin
		main_altfp_add_32_0_op1 = main_reduce1innerloop_bodyreduction_dim1_104;
	end
end
always @(*) begin
	altfp_main_dotloop_bodyreduction_4_en = (memory_controller_waitrequest == 1'd0);
end
always @(*) begin
	main_altfp_add_32_0 = altfp_adder_main_dotloop_bodyreduction_4_out;
end
always @(*) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %21 = fsub float %20, %16*/
	if ((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1_73)) begin
		main_altfp_subtract_32_0_op0 = main_fusion1loop_bodydim1_20;
	end
	/* main: %58*/
	/*   %hi.i.i.1 = fsub float %21, %.pn*/
	else if ((cur_state == LEGUP_F_main_BB__58_162)) begin
		main_altfp_subtract_32_0_op0 = main_fusion1loop_bodydim1_21_reg;
	end
	/* main: %58*/
	/*   %59 = fsub float %hi.i.i.1, %lo.i.i.1*/
	else if ((cur_state == LEGUP_F_main_BB__58_176)) begin
		main_altfp_subtract_32_0_op0 = main_58_hiii1;
	end
	/* main: %66*/
	/*   %77 = fsub float %.048, %76*/
	else if ((cur_state == LEGUP_F_main_BB__66_344)) begin
		main_altfp_subtract_32_0_op0 = main_66_048_reg;
	end
	/* main: %80*/
	/*   %83 = fsub float %82, %.048*/
	else if ((cur_state == LEGUP_F_main_BB__80_417)) begin
		main_altfp_subtract_32_0_op0 = main_80_82;
	end
	/* main: %80*/
	/*   %84 = fsub float 1.000000e+00, %83*/
	else if ((cur_state == LEGUP_F_main_BB__80_431)) begin
		main_altfp_subtract_32_0_op0 = 32'h3F800000;
	end
	/* main: %85*/
	/*   %86 = fsub float 2.000000e+00, %77*/
	else if ((cur_state == LEGUP_F_main_BB__85_446)) begin
		main_altfp_subtract_32_0_op0 = 32'h40000000;
	end
	/* main: %85*/
	/*   %88 = fsub float %lo.i.i.2, %87*/
	else if ((cur_state == LEGUP_F_main_BB__85_493)) begin
		main_altfp_subtract_32_0_op0 = main_66_loii2_reg;
	end
	/* main: %85*/
	/*   %89 = fsub float %88, %hi.i.i.2*/
	else if ((cur_state == LEGUP_F_main_BB__85_507)) begin
		main_altfp_subtract_32_0_op0 = main_85_88;
	end
	/* main: %85*/
	/*   %90 = fsub float 1.000000e+00, %89*/
	else /* if ((cur_state == LEGUP_F_main_BB__85_521)) */ begin
		main_altfp_subtract_32_0_op0 = 32'h3F800000;
	end
end
always @(*) begin
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %21 = fsub float %20, %16*/
	if ((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1_73)) begin
		main_altfp_subtract_32_0_op1 = main_reduceinnerloop_bodyreduction_dim1_16_reg;
	end
	/* main: %58*/
	/*   %hi.i.i.1 = fsub float %21, %.pn*/
	else if ((cur_state == LEGUP_F_main_BB__58_162)) begin
		main_altfp_subtract_32_0_op1 = main_58_pn_reg;
	end
	/* main: %58*/
	/*   %59 = fsub float %hi.i.i.1, %lo.i.i.1*/
	else if ((cur_state == LEGUP_F_main_BB__58_176)) begin
		main_altfp_subtract_32_0_op1 = main_58_loii1_reg;
	end
	/* main: %66*/
	/*   %77 = fsub float %.048, %76*/
	else if ((cur_state == LEGUP_F_main_BB__66_344)) begin
		main_altfp_subtract_32_0_op1 = main_66_76;
	end
	/* main: %80*/
	/*   %83 = fsub float %82, %.048*/
	else if ((cur_state == LEGUP_F_main_BB__80_417)) begin
		main_altfp_subtract_32_0_op1 = main_66_048_reg;
	end
	/* main: %80*/
	/*   %84 = fsub float 1.000000e+00, %83*/
	else if ((cur_state == LEGUP_F_main_BB__80_431)) begin
		main_altfp_subtract_32_0_op1 = main_80_83;
	end
	/* main: %85*/
	/*   %86 = fsub float 2.000000e+00, %77*/
	else if ((cur_state == LEGUP_F_main_BB__85_446)) begin
		main_altfp_subtract_32_0_op1 = main_66_77_reg;
	end
	/* main: %85*/
	/*   %88 = fsub float %lo.i.i.2, %87*/
	else if ((cur_state == LEGUP_F_main_BB__85_493)) begin
		main_altfp_subtract_32_0_op1 = main_85_87;
	end
	/* main: %85*/
	/*   %89 = fsub float %88, %hi.i.i.2*/
	else if ((cur_state == LEGUP_F_main_BB__85_507)) begin
		main_altfp_subtract_32_0_op1 = main_66_hiii2_reg;
	end
	/* main: %85*/
	/*   %90 = fsub float 1.000000e+00, %89*/
	else /* if ((cur_state == LEGUP_F_main_BB__85_521)) */ begin
		main_altfp_subtract_32_0_op1 = main_85_89;
	end
end
always @(*) begin
	altfp_main_fusion1loop_bodydim1_21_en = (memory_controller_waitrequest == 1'd0);
end
always @(*) begin
	main_altfp_subtract_32_0 = altfp_subtractor_main_fusion1loop_bodydim1_21_out;
end
always @(*) begin
	/* main: %80*/
	/*   %82 = fdiv float %79, %81*/
	if ((cur_state == LEGUP_F_main_BB__80_384)) begin
		main_altfp_divide_32_0_op0 = main_66_79_reg;
	end
	/* main: %85*/
	/*   %87 = fdiv float %79, %86*/
	else if ((cur_state == LEGUP_F_main_BB__85_460)) begin
		main_altfp_divide_32_0_op0 = main_66_79_reg;
	end
	/* main: %fusion.loop_body.dim.0*/
	/*   %108 = fdiv float %107, %105*/
	else /* if ((cur_state == LEGUP_F_main_BB_fusionloop_bodydim0_572)) */ begin
		main_altfp_divide_32_0_op0 = main_fusionloop_bodydim0_107;
	end
end
always @(*) begin
	/* main: %80*/
	/*   %82 = fdiv float %79, %81*/
	if ((cur_state == LEGUP_F_main_BB__80_384)) begin
		main_altfp_divide_32_0_op1 = main_80_81;
	end
	/* main: %85*/
	/*   %87 = fdiv float %79, %86*/
	else if ((cur_state == LEGUP_F_main_BB__85_460)) begin
		main_altfp_divide_32_0_op1 = main_85_86;
	end
	/* main: %fusion.loop_body.dim.0*/
	/*   %108 = fdiv float %107, %105*/
	else /* if ((cur_state == LEGUP_F_main_BB_fusionloop_bodydim0_572)) */ begin
		main_altfp_divide_32_0_op1 = main_reduce1innerloop_bodyreduction_dim1_105_reg;
	end
end
always @(*) begin
	altfp_main_fusionloop_bodydim0_108_en = (memory_controller_waitrequest == 1'd0);
end
always @(*) begin
	main_altfp_divide_32_0 = altfp_divider_main_fusionloop_bodydim0_108_out;
end
always @(*) begin
	/* main: %48*/
	/*   %54 = fptosi float %53 to i32*/
		main_altfp_fptosi_32_0_op0 = main_48_53;
end
always @(*) begin
	altfp_main_48_54_en = (memory_controller_waitrequest == 1'd0);
end
always @(*) begin
	main_altfp_fptosi_32_0 = altfp_fptosi32_main_48_54_out;
end
always @(*) begin
	/* main: %48*/
	/*   %55 = sitofp i32 %54 to float*/
		main_altfp_sitofp_32_0_op0 = main_48_54;
end
always @(*) begin
	altfp_main_48_55_en = (memory_controller_waitrequest == 1'd0);
end
always @(*) begin
	main_altfp_sitofp_32_0 = altfp_sitofp32_main_48_55_out;
end
always @(*) begin
	altfp_main_reduceinnerloop_bodyreduction_dim1_14_en = (memory_controller_waitrequest == 1'd0);
end
always @(*) begin
	altfp_main_reduceinnerloop_bodyreduction_dim1_13_en = (memory_controller_waitrequest == 1'd0);
end
always @(*) begin
	altfp_main_60_63_en = (memory_controller_waitrequest == 1'd0);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
		if (start == 1'b0 && ^(1'd0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to finish"); $finish; end
	end
	/* main: %fusion.loop_exit.dim.0*/
	/*   ret float %leflow_retval*/
	if ((cur_state == LEGUP_F_main_BB_fusionloop_exitdim0_609)) begin
		finish <= (memory_controller_waitrequest == 1'd0);
		if (start == 1'b0 && ^((memory_controller_waitrequest == 1'd0)) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to finish"); $finish; end
	end
end
always @(*) begin
	memory_controller_enable_a = 1'd0;
	if ((cur_state == LEGUP_0)) begin
		memory_controller_enable_a = 1'd0;
	end
	/* main: %dot.loop_body.reduction*/
	/*   %1 = load volatile float* %scevgep20, align 4*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_2)) begin
		memory_controller_enable_a = 1'd1;
	end
	/* main: %dot.loop_exit.reduction*/
	/*   store float %4, float* %scevgep23, align 4*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_exitreduction_30)) begin
		memory_controller_enable_a = 1'd1;
	end
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %7 = load float* %scevgep17, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_33)) begin
		memory_controller_enable_a = 1'd1;
	end
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %12 = load float* %scevgep13, align 4*/
	if ((cur_state == LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_52)) begin
		memory_controller_enable_a = 1'd1;
	end
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %18 = load float* %scevgep7, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1_57)) begin
		memory_controller_enable_a = 1'd1;
	end
	/* main: %40*/
	/*   %43 = load float* %42, align 4*/
	if ((cur_state == LEGUP_F_main_BB__40_109)) begin
		memory_controller_enable_a = 1'd1;
	end
	/* main: %expf.exit*/
	/*   store float %.0, float* %scevgep5, align 4*/
	if ((cur_state == LEGUP_F_main_BB_expfexit_549)) begin
		memory_controller_enable_a = 1'd1;
	end
	/* main: %fusion.loop_body.dim.0*/
	/*   store volatile float %108, float* %scevgep, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusionloop_bodydim0_605)) begin
		memory_controller_enable_a = 1'd1;
	end
end
always @(*) begin
	memory_controller_address_a = 1'd0;
	if ((cur_state == LEGUP_0)) begin
		memory_controller_address_a = 1'd0;
	end
	/* main: %dot.loop_body.reduction*/
	/*   %1 = load volatile float* %scevgep20, align 4*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_2)) begin
		memory_controller_address_a = main_dotloop_bodyreduction_scevgep20;
	end
	/* main: %dot.loop_exit.reduction*/
	/*   store float %4, float* %scevgep23, align 4*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_exitreduction_30)) begin
		memory_controller_address_a = main_dotloop_bodyreductionlrph_scevgep23_reg;
	end
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %7 = load float* %scevgep17, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_33)) begin
		memory_controller_address_a = main_fusion2loop_bodydim1_scevgep17;
	end
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %12 = load float* %scevgep13, align 4*/
	if ((cur_state == LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_52)) begin
		memory_controller_address_a = main_reduceinnerloop_bodyreduction_dim1_scevgep13;
	end
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %18 = load float* %scevgep7, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1_57)) begin
		memory_controller_address_a = main_fusion1loop_bodydim1_scevgep7;
	end
	/* main: %40*/
	/*   %43 = load float* %42, align 4*/
	if ((cur_state == LEGUP_F_main_BB__40_109)) begin
		memory_controller_address_a = main_40_42;
	end
	/* main: %expf.exit*/
	/*   store float %.0, float* %scevgep5, align 4*/
	if ((cur_state == LEGUP_F_main_BB_expfexit_549)) begin
		memory_controller_address_a = main_fusion1loop_bodydim1_scevgep5_reg;
	end
	/* main: %fusion.loop_body.dim.0*/
	/*   store volatile float %108, float* %scevgep, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusionloop_bodydim0_605)) begin
		memory_controller_address_a = main_fusionloop_bodydim0_scevgep_reg;
	end
end
always @(*) begin
	memory_controller_write_enable_a = 1'd0;
	if ((cur_state == LEGUP_0)) begin
		memory_controller_write_enable_a = 1'd0;
	end
	/* main: %dot.loop_body.reduction*/
	/*   %1 = load volatile float* %scevgep20, align 4*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_2)) begin
		memory_controller_write_enable_a = 1'd0;
	end
	/* main: %dot.loop_exit.reduction*/
	/*   store float %4, float* %scevgep23, align 4*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_exitreduction_30)) begin
		memory_controller_write_enable_a = 1'd1;
	end
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %7 = load float* %scevgep17, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_33)) begin
		memory_controller_write_enable_a = 1'd0;
	end
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %12 = load float* %scevgep13, align 4*/
	if ((cur_state == LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_52)) begin
		memory_controller_write_enable_a = 1'd0;
	end
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %18 = load float* %scevgep7, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1_57)) begin
		memory_controller_write_enable_a = 1'd0;
	end
	/* main: %40*/
	/*   %43 = load float* %42, align 4*/
	if ((cur_state == LEGUP_F_main_BB__40_109)) begin
		memory_controller_write_enable_a = 1'd0;
	end
	/* main: %expf.exit*/
	/*   store float %.0, float* %scevgep5, align 4*/
	if ((cur_state == LEGUP_F_main_BB_expfexit_549)) begin
		memory_controller_write_enable_a = 1'd1;
	end
	/* main: %fusion.loop_body.dim.0*/
	/*   store volatile float %108, float* %scevgep, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusionloop_bodydim0_605)) begin
		memory_controller_write_enable_a = 1'd1;
	end
end
always @(*) begin
	memory_controller_in_a = 1'd0;
	if ((cur_state == LEGUP_0)) begin
		memory_controller_in_a = 1'd0;
	end
	/* main: %dot.loop_exit.reduction*/
	/*   store float %4, float* %scevgep23, align 4*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_exitreduction_30)) begin
		memory_controller_in_a = main_dotloop_bodyreduction_4_reg;
	end
	/* main: %expf.exit*/
	/*   store float %.0, float* %scevgep5, align 4*/
	if ((cur_state == LEGUP_F_main_BB_expfexit_549)) begin
		memory_controller_in_a = main_expfexit_0_reg;
	end
	/* main: %fusion.loop_body.dim.0*/
	/*   store volatile float %108, float* %scevgep, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusionloop_bodydim0_605)) begin
		memory_controller_in_a = main_fusionloop_bodydim0_108;
	end
end
always @(*) begin
	memory_controller_size_a = 1'd0;
	if ((cur_state == LEGUP_0)) begin
		memory_controller_size_a = 1'd0;
	end
	/* main: %dot.loop_body.reduction*/
	/*   %1 = load volatile float* %scevgep20, align 4*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_2)) begin
		memory_controller_size_a = 2'd2;
	end
	/* main: %dot.loop_exit.reduction*/
	/*   store float %4, float* %scevgep23, align 4*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_exitreduction_30)) begin
		memory_controller_size_a = 2'd2;
	end
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %7 = load float* %scevgep17, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_33)) begin
		memory_controller_size_a = 2'd2;
	end
	/* main: %reduce.inner.loop_body.reduction_dim.1*/
	/*   %12 = load float* %scevgep13, align 4*/
	if ((cur_state == LEGUP_F_main_BB_reduceinnerloop_bodyreduction_dim1_52)) begin
		memory_controller_size_a = 2'd2;
	end
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %18 = load float* %scevgep7, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1_57)) begin
		memory_controller_size_a = 2'd2;
	end
	/* main: %40*/
	/*   %43 = load float* %42, align 4*/
	if ((cur_state == LEGUP_F_main_BB__40_109)) begin
		memory_controller_size_a = 2'd2;
	end
	/* main: %expf.exit*/
	/*   store float %.0, float* %scevgep5, align 4*/
	if ((cur_state == LEGUP_F_main_BB_expfexit_549)) begin
		memory_controller_size_a = 2'd2;
	end
	/* main: %fusion.loop_body.dim.0*/
	/*   store volatile float %108, float* %scevgep, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusionloop_bodydim0_605)) begin
		memory_controller_size_a = 2'd2;
	end
end
always @(*) begin
	memory_controller_enable_b = 1'd0;
	if ((cur_state == LEGUP_0)) begin
		memory_controller_enable_b = 1'd0;
	end
	/* main: %dot.loop_body.reduction*/
	/*   %2 = load volatile float* %scevgep19, align 4*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_2)) begin
		memory_controller_enable_b = 1'd1;
	end
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %8 = load volatile float* %scevgep16, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_33)) begin
		memory_controller_enable_b = 1'd1;
	end
	/* main: %fusion.2.loop_body.dim.1*/
	/*   store float %9, float* %scevgep15, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_49)) begin
		memory_controller_enable_b = 1'd1;
	end
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %19 = load volatile float* %scevgep6, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1_57)) begin
		memory_controller_enable_b = 1'd1;
	end
	/* main: %40*/
	/*   %45 = load float* %44, align 4*/
	if ((cur_state == LEGUP_F_main_BB__40_109)) begin
		memory_controller_enable_b = 1'd1;
	end
	/* main: %48*/
	/*   %52 = load float* %51, align 4*/
	if ((cur_state == LEGUP_F_main_BB__48_112)) begin
		memory_controller_enable_b = 1'd1;
	end
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %104 = load float* %scevgep3, align 4*/
	if ((cur_state == LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_552)) begin
		memory_controller_enable_b = 1'd1;
	end
	/* main: %fusion.loop_body.dim.0*/
	/*   %107 = load float* %scevgep2, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusionloop_bodydim0_570)) begin
		memory_controller_enable_b = 1'd1;
	end
	/* main: %fusion.loop_exit.dim.0*/
	/*   %leflow_retval = load volatile float* getelementptr inbounds ([10 x float]* @temp3, i64 0, i64 0), align 8*/
	if ((cur_state == LEGUP_F_main_BB_fusionloop_exitdim0_607)) begin
		memory_controller_enable_b = 1'd1;
	end
end
always @(*) begin
	memory_controller_address_b = 1'd0;
	if ((cur_state == LEGUP_0)) begin
		memory_controller_address_b = 1'd0;
	end
	/* main: %dot.loop_body.reduction*/
	/*   %2 = load volatile float* %scevgep19, align 4*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_2)) begin
		memory_controller_address_b = main_dotloop_bodyreduction_scevgep19;
	end
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %8 = load volatile float* %scevgep16, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_33)) begin
		memory_controller_address_b = main_fusion2loop_bodydim1_scevgep16;
	end
	/* main: %fusion.2.loop_body.dim.1*/
	/*   store float %9, float* %scevgep15, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_49)) begin
		memory_controller_address_b = main_fusion2loop_bodydim1_scevgep15_reg;
	end
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %19 = load volatile float* %scevgep6, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1_57)) begin
		memory_controller_address_b = main_fusion1loop_bodydim1_scevgep6;
	end
	/* main: %40*/
	/*   %45 = load float* %44, align 4*/
	if ((cur_state == LEGUP_F_main_BB__40_109)) begin
		memory_controller_address_b = main_40_44;
	end
	/* main: %48*/
	/*   %52 = load float* %51, align 4*/
	if ((cur_state == LEGUP_F_main_BB__48_112)) begin
		memory_controller_address_b = main_48_51;
	end
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %104 = load float* %scevgep3, align 4*/
	if ((cur_state == LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_552)) begin
		memory_controller_address_b = main_reduce1innerloop_bodyreduction_dim1_scevgep3;
	end
	/* main: %fusion.loop_body.dim.0*/
	/*   %107 = load float* %scevgep2, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusionloop_bodydim0_570)) begin
		memory_controller_address_b = main_fusionloop_bodydim0_scevgep2;
	end
	/* main: %fusion.loop_exit.dim.0*/
	/*   %leflow_retval = load volatile float* getelementptr inbounds ([10 x float]* @temp3, i64 0, i64 0), align 8*/
	if ((cur_state == LEGUP_F_main_BB_fusionloop_exitdim0_607)) begin
		memory_controller_address_b = `TAG_g_temp3_a;
	end
end
always @(*) begin
	memory_controller_write_enable_b = 1'd0;
	if ((cur_state == LEGUP_0)) begin
		memory_controller_write_enable_b = 1'd0;
	end
	/* main: %dot.loop_body.reduction*/
	/*   %2 = load volatile float* %scevgep19, align 4*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_2)) begin
		memory_controller_write_enable_b = 1'd0;
	end
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %8 = load volatile float* %scevgep16, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_33)) begin
		memory_controller_write_enable_b = 1'd0;
	end
	/* main: %fusion.2.loop_body.dim.1*/
	/*   store float %9, float* %scevgep15, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_49)) begin
		memory_controller_write_enable_b = 1'd1;
	end
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %19 = load volatile float* %scevgep6, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1_57)) begin
		memory_controller_write_enable_b = 1'd0;
	end
	/* main: %40*/
	/*   %45 = load float* %44, align 4*/
	if ((cur_state == LEGUP_F_main_BB__40_109)) begin
		memory_controller_write_enable_b = 1'd0;
	end
	/* main: %48*/
	/*   %52 = load float* %51, align 4*/
	if ((cur_state == LEGUP_F_main_BB__48_112)) begin
		memory_controller_write_enable_b = 1'd0;
	end
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %104 = load float* %scevgep3, align 4*/
	if ((cur_state == LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_552)) begin
		memory_controller_write_enable_b = 1'd0;
	end
	/* main: %fusion.loop_body.dim.0*/
	/*   %107 = load float* %scevgep2, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusionloop_bodydim0_570)) begin
		memory_controller_write_enable_b = 1'd0;
	end
	/* main: %fusion.loop_exit.dim.0*/
	/*   %leflow_retval = load volatile float* getelementptr inbounds ([10 x float]* @temp3, i64 0, i64 0), align 8*/
	if ((cur_state == LEGUP_F_main_BB_fusionloop_exitdim0_607)) begin
		memory_controller_write_enable_b = 1'd0;
	end
end
always @(*) begin
	memory_controller_in_b = 1'd0;
	if ((cur_state == LEGUP_0)) begin
		memory_controller_in_b = 1'd0;
	end
	/* main: %fusion.2.loop_body.dim.1*/
	/*   store float %9, float* %scevgep15, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_49)) begin
		memory_controller_in_b = main_fusion2loop_bodydim1_9;
	end
end
always @(*) begin
	memory_controller_size_b = 1'd0;
	if ((cur_state == LEGUP_0)) begin
		memory_controller_size_b = 1'd0;
	end
	/* main: %dot.loop_body.reduction*/
	/*   %2 = load volatile float* %scevgep19, align 4*/
	if ((cur_state == LEGUP_F_main_BB_dotloop_bodyreduction_2)) begin
		memory_controller_size_b = 2'd2;
	end
	/* main: %fusion.2.loop_body.dim.1*/
	/*   %8 = load volatile float* %scevgep16, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_33)) begin
		memory_controller_size_b = 2'd2;
	end
	/* main: %fusion.2.loop_body.dim.1*/
	/*   store float %9, float* %scevgep15, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion2loop_bodydim1_49)) begin
		memory_controller_size_b = 2'd2;
	end
	/* main: %fusion.1.loop_body.dim.1*/
	/*   %19 = load volatile float* %scevgep6, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusion1loop_bodydim1_57)) begin
		memory_controller_size_b = 2'd2;
	end
	/* main: %40*/
	/*   %45 = load float* %44, align 4*/
	if ((cur_state == LEGUP_F_main_BB__40_109)) begin
		memory_controller_size_b = 2'd2;
	end
	/* main: %48*/
	/*   %52 = load float* %51, align 4*/
	if ((cur_state == LEGUP_F_main_BB__48_112)) begin
		memory_controller_size_b = 2'd2;
	end
	/* main: %reduce.1.inner.loop_body.reduction_dim.1*/
	/*   %104 = load float* %scevgep3, align 4*/
	if ((cur_state == LEGUP_F_main_BB_reduce1innerloop_bodyreduction_dim1_552)) begin
		memory_controller_size_b = 2'd2;
	end
	/* main: %fusion.loop_body.dim.0*/
	/*   %107 = load float* %scevgep2, align 4*/
	if ((cur_state == LEGUP_F_main_BB_fusionloop_bodydim0_570)) begin
		memory_controller_size_b = 2'd2;
	end
	/* main: %fusion.loop_exit.dim.0*/
	/*   %leflow_retval = load volatile float* getelementptr inbounds ([10 x float]* @temp3, i64 0, i64 0), align 8*/
	if ((cur_state == LEGUP_F_main_BB_fusionloop_exitdim0_607)) begin
		memory_controller_size_b = 2'd2;
	end
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		return_val <= 0;
		if (start == 1'b0 && ^(0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to return_val"); $finish; end
	end
	/* main: %fusion.loop_exit.dim.0*/
	/*   ret float %leflow_retval*/
	if ((cur_state == LEGUP_F_main_BB_fusionloop_exitdim0_609)) begin
		return_val <= main_fusionloop_exitdim0_leflow_retval;
		if (start == 1'b0 && ^(main_fusionloop_exitdim0_leflow_retval) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to return_val"); $finish; end
	end
end

endmodule 
module ram_dual_port
(
	clk,
	clken,
	address_a,
	address_b,
	wren_a,
	wren_b,
	data_a,
	data_b,
	byteena_a,
	byteena_b,
	q_a,
	q_b
);

parameter  width_a = 1'd0;
parameter  width_b = 1'd0;
parameter  widthad_a = 1'd0;
parameter  widthad_b = 1'd0;
parameter  numwords_a = 1'd0;
parameter  numwords_b = 1'd0;
parameter  init_file = "UNUSED.mif";
parameter  width_be_a = 1'd0;
parameter  width_be_b = 1'd0;
parameter  latency = 1;

input  clk;
input  clken;
input [(widthad_a-1):0] address_a;
input [(widthad_b-1):0] address_b;
output wire [(width_a-1):0] q_a;
output wire [(width_b-1):0] q_b;
reg [(width_a-1):0] q_a_wire;
reg [(width_b-1):0] q_b_wire;
input  wren_a;
input  wren_b;
input [(width_a-1):0] data_a;
input [(width_b-1):0] data_b;
// byte enable is unsupported by inferred RAMs
input [width_be_a-1:0] byteena_a;
input [width_be_b-1:0] byteena_b;

(* ramstyle = "no_rw_check", ram_init_file = init_file *) reg [width_a-1:0] ram[numwords_a-1:0];

/* synthesis translate_off */
integer i;
ALTERA_MF_MEMORY_INITIALIZATION mem ();
reg [8*256:1] ram_ver_file;
initial begin
	if (init_file == "UNUSED.mif")
    begin
		for (i = 0; i < numwords_a; i = i + 1)
			ram[i] = 0;
    end
	else
    begin
        // modelsim can't read .mif files directly. So use Altera function to
        // convert them to .ver files
        mem.convert_to_ver_file(init_file, width_a, ram_ver_file);
        $readmemh(ram_ver_file, ram);
    end
end
/* synthesis translate_on */

always @ (posedge clk)
if (clken)
begin // Port A
if (wren_a)
begin
    ram[address_a] <= data_a;
    q_a_wire <= {width_a{1'bX}};
end
else
    q_a_wire <= ram[address_a];
end
always @ (posedge clk)
if (clken)
begin // Port b
if (wren_b)
begin
    ram[address_b] <= data_b;
    q_b_wire <= {width_b{1'bX}};
end
else
    q_b_wire <= ram[address_b];
end



integer j;
reg [(width_a-1):0] q_a_reg[latency:1], q_b_reg[latency:1];

always @(*)
begin
   q_a_reg[1] <= q_a_wire;
   q_b_reg[1] <= q_b_wire;
end

always @(posedge clk)
if (clken)
begin
   for (j = 1; j < latency; j=j+1)
   begin
       q_a_reg[j+1] <= q_a_reg[j];
       q_b_reg[j+1] <= q_b_reg[j];
   end
end

assign q_a = (clken) ? q_a_reg[latency] : 0;
assign q_b = (clken) ? q_b_reg[latency] : 0;


endmodule
module rom_dual_port
(
	clk,
	clken,
	address_a,
	address_b,
	q_a,
	q_b
);

parameter  width_a = 1'd0;
parameter  width_b = 1'd0;
parameter  widthad_a = 1'd0;
parameter  widthad_b = 1'd0;
parameter  numwords_a = 1'd0;
parameter  numwords_b = 1'd0;
parameter  init_file = "UNUSED.mif";
parameter  latency = 1;

input  clk;
input  clken;
input [(widthad_a-1):0] address_a;
input [(widthad_b-1):0] address_b;
output wire [(width_a-1):0] q_a;
output wire [(width_b-1):0] q_b;
reg [(width_a-1):0] q_a_wire;
reg [(width_b-1):0] q_b_wire;

(* ramstyle = "no_rw_check", ram_init_file = init_file *) reg [width_a-1:0] ram[numwords_a-1:0];

/* synthesis translate_off */
integer i;
ALTERA_MF_MEMORY_INITIALIZATION mem ();
reg [8*256:1] ram_ver_file;
initial begin
	if (init_file == "UNUSED.mif")
    begin
		for (i = 0; i < numwords_a; i = i + 1)
			ram[i] = 0;
    end
	else
    begin
        // modelsim can't read .mif files directly. So use Altera function to
        // convert them to .ver files
        mem.convert_to_ver_file(init_file, width_a, ram_ver_file);
        $readmemh(ram_ver_file, ram);
    end
end
/* synthesis translate_on */

always @ (posedge clk)
if (clken)
begin
    q_a_wire <= ram[address_a];
    q_b_wire <= ram[address_b];
end



integer j;
reg [(width_a-1):0] q_a_reg[latency:1], q_b_reg[latency:1];

always @(*)
begin
   q_a_reg[1] <= q_a_wire;
   q_b_reg[1] <= q_b_wire;
end

always @(posedge clk)
if (clken)
begin
   for (j = 1; j < latency; j=j+1)
   begin
       q_a_reg[j+1] <= q_a_reg[j];
       q_b_reg[j+1] <= q_b_reg[j];
   end
end

assign q_a = (clken) ? q_a_reg[latency] : 0;
assign q_b = (clken) ? q_b_reg[latency] : 0;


endmodule
// Adding code from verilog file: /home/legup/legup-4.0/examples//../boards/Virtex6/ML605/top.v


module ML605 (
       USER_CLOCK,
	    KEY,
	    SW,	    
       LED,
       LEDG,
		UART_RXD,
		UART_TXD

	    );

   input USER_CLOCK;
   input [4:0] KEY;
   input [7:0] SW;
   output [7:0] LED;
   output [7:0] LEDG;
   wire CLOCK_50;

    input UART_RXD;
    output UART_TXD;    
	wire clk = CLOCK_50;
	wire go = ~KEY[1];



   wire 	reset = ~KEY[0];
   wire 	start;
   wire [31:0] 	return_val;
   reg  [31:0] 	return_val_reg;
   wire 	finish;
   wire [3:0]	state;
   
   reg [6:0]   hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7;

   assign CLOCK_50 = USER_CLOCK;
   assign LED = 0;
   
	always @ (*) begin
		hex7 <= return_val_reg[31:28];
		hex6 <= return_val_reg[27:24];
		hex5 <= return_val_reg[23:20];
		hex4 <= return_val_reg[19:16];
		hex3 <= return_val_reg[15:12];
		hex2 <= return_val_reg[11:8];
		hex1 <= return_val_reg[7:4];
		hex0 <= return_val_reg[3:0];
	end
assign UART_TXD = 1'b0;

    parameter s_WAIT = 3'b001, s_START = 3'b010, s_EXE = 3'b011,
                s_DONE = 3'b100;

    // state registers
    reg [3:0] y_Q, Y_D;

    assign LEDG[3:0] = y_Q;

    // next state
    always @(*)
    begin
        case (y_Q)
            s_WAIT: if (go) Y_D = s_START; else Y_D = y_Q;

            s_START: Y_D = s_EXE;

            s_EXE: if (!finish) Y_D = s_EXE; else Y_D = s_DONE;

            s_DONE: Y_D = s_DONE;

            default: Y_D = 3'bxxx;
        endcase
    end

    // current state
    always @(posedge clk)
    begin
        if (reset) // synchronous clear
            y_Q <= s_WAIT;
        else
            y_Q <= Y_D;
    end

    always @(posedge clk)
        if (y_Q == s_EXE && finish)
            return_val_reg <= return_val;
        else if (y_Q == s_DONE)
            return_val_reg <= return_val_reg;
        else
            return_val_reg <= 0;


    assign start = (y_Q == s_START);

   
   top top_inst (
      .clk (clk),
      .reset (reset),
      .finish (finish),
      .return_val (return_val),
        .start (start)

    );

   

endmodule

// Adding code from verilog file: /home/legup/legup-4.0/examples//../boards/StratixIV/DE4/top.v


module de4 ( 
    	     OSC_50_BANK2, 
             BUTTON, 
             LED, 
    	     SEG0_D, 
    	     SEG1_D 
	     ); 
   input OSC_50_BANK2; 
   input [1:0] BUTTON; 
   output [6:0] SEG0_D; 
   output [6:0] SEG1_D; 
   output [7:0] LED; 
   
   de2 de2_inst ( 
		  .CLOCK_50 (OSC_50_BANK2), 
		  .LEDG (LED), 
		  .KEY (BUTTON), 
		  .SW (), 
		  .HEX0 (SEG0_D), 
		  .HEX1 (SEG1_D), 
		  .HEX2 (), 
		  .HEX3 (), 
		  .HEX4 (), 
		  .HEX5 (), 
		  .HEX6 (), 
		  .HEX7 () 
		  ); 
   
endmodule
// Adding code from verilog file: /home/legup/legup-4.0/examples//../boards/CycloneII/DE2/top.v


module de2 (
	    CLOCK_50,
	    KEY,
	    SW,
	    HEX0,
	    HEX1,
	    HEX2,
	    HEX3,
	    HEX4,
	    HEX5,
	    HEX6,
	    HEX7,
	    LEDG,
		UART_RXD,
		UART_TXD

	    );

   input CLOCK_50;
   input [3:0] KEY;
   input [17:0] SW;
   output [6:0] HEX0, HEX1,  HEX2,  HEX3,  HEX4,  HEX5,  HEX6,  HEX7;
   reg [6:0] 	hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7;
   

   output [7:0] LEDG;
    input UART_RXD;
    output UART_TXD;    
	wire clk = CLOCK_50;
	wire go = ~KEY[1];



   wire 	reset = ~KEY[0];
   wire 	start;
   wire [31:0] 	return_val;
   reg  [31:0] 	return_val_reg;
   wire 	finish;
   wire [3:0]	state;

   hex_digits h7( .x(hex7), .hex_LEDs(HEX7));
   hex_digits h6( .x(hex6), .hex_LEDs(HEX6));
   hex_digits h5( .x(hex5), .hex_LEDs(HEX5));
   hex_digits h4( .x(hex4), .hex_LEDs(HEX4));
   hex_digits h3( .x(hex3), .hex_LEDs(HEX3));
   hex_digits h2( .x(hex2), .hex_LEDs(HEX2));
   hex_digits h1( .x(hex1), .hex_LEDs(HEX1));
   hex_digits h0( .x(hex0), .hex_LEDs(HEX0));
   
	always @ (*) begin
		hex7 <= return_val_reg[31:28];
		hex6 <= return_val_reg[27:24];
		hex5 <= return_val_reg[23:20];
		hex4 <= return_val_reg[19:16];
		hex3 <= return_val_reg[15:12];
		hex2 <= return_val_reg[11:8];
		hex1 <= return_val_reg[7:4];
		hex0 <= return_val_reg[3:0];
	end
assign UART_TXD = 1'b0;

    parameter s_WAIT = 3'b001, s_START = 3'b010, s_EXE = 3'b011,
                s_DONE = 3'b100;

    // state registers
    reg [3:0] y_Q, Y_D;

    assign LEDG[3:0] = y_Q;

    // next state
    always @(*)
    begin
        case (y_Q)
            s_WAIT: if (go) Y_D = s_START; else Y_D = y_Q;

            s_START: Y_D = s_EXE;

            s_EXE: if (!finish) Y_D = s_EXE; else Y_D = s_DONE;

            s_DONE: Y_D = s_DONE;

            default: Y_D = 3'bxxx;
        endcase
    end

    // current state
    always @(posedge clk)
    begin
        if (reset) // synchronous clear
            y_Q <= s_WAIT;
        else
            y_Q <= Y_D;
    end

    always @(posedge clk)
        if (y_Q == s_EXE && finish)
            return_val_reg <= return_val;
        else if (y_Q == s_DONE)
            return_val_reg <= return_val_reg;
        else
            return_val_reg <= 0;


    assign start = (y_Q == s_START);

   
   top top_inst (
      .clk (clk),
      .reset (reset),
      .finish (finish),
      .return_val (return_val),
        .start (start)

    );

endmodule

module circuit_start_control (
    go,
    control_key
);
    input control_key;
    output go;
    assign go = control_key;
endmodule
module hex_digits(x, hex_LEDs);
    input [3:0] x;
    output [6:0] hex_LEDs;
    
    assign hex_LEDs[0] = (~x[3] & ~x[2] & ~x[1] & x[0]) |
                            (~x[3] & x[2] & ~x[1] & ~x[0]) |
                            (x[3] & x[2] & ~x[1] & x[0]) |
                            (x[3] & ~x[2] & x[1] & x[0]);
    assign hex_LEDs[1] = (~x[3] & x[2] & ~x[1] & x[0]) |
                            (x[3] & x[1] & x[0]) |
                            (x[3] & x[2] & ~x[0]) |
                            (x[2] & x[1] & ~x[0]);
    assign hex_LEDs[2] = (x[3] & x[2] & ~x[0]) |
                            (x[3] & x[2] & x[1]) |
                            (~x[3] & ~x[2] & x[1] & ~x[0]);
    assign hex_LEDs[3] = (~x[3] & ~x[2] & ~x[1] & x[0]) | 
                            (~x[3] & x[2] & ~x[1] & ~x[0]) | 
                            (x[2] & x[1] & x[0]) | 
                            (x[3] & ~x[2] & x[1] & ~x[0]);
    assign hex_LEDs[4] = (~x[3] & x[0]) |
                            (~x[3] & x[2] & ~x[1]) |
                            (~x[2] & ~x[1] & x[0]);
    assign hex_LEDs[5] = (~x[3] & ~x[2] & x[0]) | 
                            (~x[3] & ~x[2] & x[1]) | 
                            (~x[3] & x[1] & x[0]) | 
                            (x[3] & x[2] & ~x[1] & x[0]);
    assign hex_LEDs[6] = (~x[3] & ~x[2] & ~x[1]) | 
                            (x[3] & x[2] & ~x[1] & ~x[0]) | 
                            (~x[3] & x[2] & x[1] & x[0]);
    
endmodule
`timescale 1 ns / 1 ns
module main_tb
(
);

reg  clk;
reg  reset;
reg  start;
reg  waitrequest;
wire [31:0] return_val;
wire  finish;


top top_inst (
	.clk (clk),
	.reset (reset),
	.start (start),
	.waitrequest (waitrequest),
	.finish (finish),
	.return_val (return_val)
);




initial 
    clk = 0;
always @(clk)
    clk <= #10 ~clk;

initial begin
//$monitor("At t=%t clk=%b %b %b %b %d", $time, clk, reset, start, finish, return_val);
@(negedge clk);
reset <= 1;
@(negedge clk);
reset <= 0;
start <= 1;
@(negedge clk);
start <= 0;
end

always@(finish) begin
    if (finish == 1) begin
        $writememh("memory_dump.txt",top_inst.memory_controller_inst.temp3.ram);
        $display("At t=%t clk=%b finish=%b return_val=%d", $time, clk, finish, return_val);
        $display("Cycles: %d", ($time-50)/20);
        $finish;
    end
end

initial begin
waitrequest <= 1;
@(negedge clk);
@(negedge clk);
waitrequest <= 0;
end


endmodule 
