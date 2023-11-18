// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\EdgeDetectionAndOverlayHDL\Pixel_Stream_HDL_Model.v
// Created: 2023-11-17 13:10:32
// 
// Generated by MATLAB 9.14 and HDL Coder 4.1
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 1
// Target subsystem base rate: 1
// 
// 
// Clock Enable  Sample Time
// -- -------------------------------------------------------------
// ce_out        1
// -- -------------------------------------------------------------
// 
// 
// Output Signal                 Clock Enable  Sample Time
// -- -------------------------------------------------------------
// pixelOut                      ce_out        1
// ctrlOut_hStart                ce_out        1
// ctrlOut_hEnd                  ce_out        1
// ctrlOut_vStart                ce_out        1
// ctrlOut_vEnd                  ce_out        1
// ctrlOut_valid                 ce_out        1
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Pixel_Stream_HDL_Model
// Source Path: EdgeDetectionAndOverlayHDL/Pixel-Stream HDL Model
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Pixel_Stream_HDL_Model
          (clk,
           reset,
           clk_enable,
           pixelIn,
           ctrlIn_hStart,
           ctrlIn_hEnd,
           ctrlIn_vStart,
           ctrlIn_vEnd,
           ctrlIn_valid,
           ce_out,
           pixelOut,
           ctrlOut_hStart,
           ctrlOut_hEnd,
           ctrlOut_vStart,
           ctrlOut_vEnd,
           ctrlOut_valid);


  input   clk;
  input   reset;
  input   clk_enable;
  input   [7:0] pixelIn;  // uint8
  input   ctrlIn_hStart;
  input   ctrlIn_hEnd;
  input   ctrlIn_vStart;
  input   ctrlIn_vEnd;
  input   ctrlIn_valid;
  output  ce_out;
  output  [7:0] pixelOut;  // uint8
  output  ctrlOut_hStart;
  output  ctrlOut_hEnd;
  output  ctrlOut_vStart;
  output  ctrlOut_vEnd;
  output  ctrlOut_valid;


  wire Edge_Detection_out2_hStart;
  wire Edge_Detection_out2_hEnd;
  wire Edge_Detection_out2_vStart;
  wire Edge_Detection_out2_vEnd;
  wire Edge_Detection_out2_valid;
  wire [7:0] Pixel_Stream_Aligner_out1;  // uint8
  wire Pixel_Stream_Aligner_out3_hStart;
  wire Pixel_Stream_Aligner_out3_hEnd;
  wire Pixel_Stream_Aligner_out3_vStart;
  wire Pixel_Stream_Aligner_out3_vEnd;
  wire Pixel_Stream_Aligner_out3_valid;


  Edge_Detection u_Edge_Detection (.clk(clk),
                                   .reset(reset),
                                   .enb(clk_enable),
                                   .ctrlIn_hStart(ctrlIn_hStart),
                                   .ctrlIn_hEnd(ctrlIn_hEnd),
                                   .ctrlIn_vStart(ctrlIn_vStart),
                                   .ctrlIn_vEnd(ctrlIn_vEnd),
                                   .ctrlIn_valid(ctrlIn_valid),
                                   .ctrlOut_hStart(Edge_Detection_out2_hStart),
                                   .ctrlOut_hEnd(Edge_Detection_out2_hEnd),
                                   .ctrlOut_vStart(Edge_Detection_out2_vStart),
                                   .ctrlOut_vEnd(Edge_Detection_out2_vEnd),
                                   .ctrlOut_valid(Edge_Detection_out2_valid)
                                   );
  Pixel_Stream_Aligner u_Pixel_Stream_Aligner (.clk(clk),
                                               .reset(reset),
                                               .enb(clk_enable),
                                               .in0(pixelIn),  // uint8
                                               .in1_hStart(ctrlIn_hStart),
                                               .in1_hEnd(ctrlIn_hEnd),
                                               .in1_vStart(ctrlIn_vStart),
                                               .in1_vEnd(ctrlIn_vEnd),
                                               .in1_valid(ctrlIn_valid),
                                               .in3_hStart(Edge_Detection_out2_hStart),
                                               .in3_hEnd(Edge_Detection_out2_hEnd),
                                               .in3_vStart(Edge_Detection_out2_vStart),
                                               .in3_vEnd(Edge_Detection_out2_vEnd),
                                               .in3_valid(Edge_Detection_out2_valid),
                                               .out0(Pixel_Stream_Aligner_out1),  // uint8
                                               .out2_hStart(Pixel_Stream_Aligner_out3_hStart),
                                               .out2_hEnd(Pixel_Stream_Aligner_out3_hEnd),
                                               .out2_vStart(Pixel_Stream_Aligner_out3_vStart),
                                               .out2_vEnd(Pixel_Stream_Aligner_out3_vEnd),
                                               .out2_valid(Pixel_Stream_Aligner_out3_valid)
                                               );
  assign pixelOut = Pixel_Stream_Aligner_out1;

  assign ctrlOut_hStart = Pixel_Stream_Aligner_out3_hStart;

  assign ctrlOut_hEnd = Pixel_Stream_Aligner_out3_hEnd;

  assign ctrlOut_vStart = Pixel_Stream_Aligner_out3_vStart;

  assign ctrlOut_vEnd = Pixel_Stream_Aligner_out3_vEnd;

  assign ctrlOut_valid = Pixel_Stream_Aligner_out3_valid;

  assign ce_out = clk_enable;

endmodule  // Pixel_Stream_HDL_Model
