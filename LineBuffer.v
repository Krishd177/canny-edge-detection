// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\EdgeDetectionAndOverlayHDL\LineBuffer.v
// Created: 2023-11-17 13:10:32
// 
// Generated by MATLAB 9.14 and HDL Coder 4.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: LineBuffer
// Source Path: EdgeDetectionAndOverlayHDL/Pixel-Stream HDL Model/Edge Detection/Edge Detector/LineBuffer
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module LineBuffer
          (clk,
           reset,
           enb,
           hStartIn,
           hEndIn,
           vStartIn,
           vEndIn,
           validIn,
           hStartOut,
           hEndOut,
           vStartOut,
           vEndOut,
           validOut,
           processDataOut);


  input   clk;
  input   reset;
  input   enb;
  input   hStartIn;
  input   hEndIn;
  input   vStartIn;
  input   vEndIn;
  input   validIn;
  output  hStartOut;
  output  hEndOut;
  output  vStartOut;
  output  vEndOut;
  output  validOut;
  output  processDataOut;


  reg  [0:2] intdelay_reg;  // ufix1 [3]
  wire [0:2] intdelay_reg_next;  // ufix1 [3]
  wire hStartInD;
  reg  [0:2] intdelay_reg_1;  // ufix1 [3]
  wire [0:2] intdelay_reg_next_1;  // ufix1 [3]
  wire hEndInD;
  reg  [0:2] intdelay_reg_2;  // ufix1 [3]
  wire [0:2] intdelay_reg_next_2;  // ufix1 [3]
  wire vStartInD;
  reg  [0:2] intdelay_reg_3;  // ufix1 [3]
  wire [0:2] intdelay_reg_next_3;  // ufix1 [3]
  wire vEndInD;
  reg  [0:2] intdelay_reg_4;  // ufix1 [3]
  wire [0:2] intdelay_reg_next_4;  // ufix1 [3]
  wire vEndInD_1;
  wire hStartV;
  wire hEndV;
  wire vStartV;
  wire vEndV;
  wire validInV;
  wire InBetween;
  reg  hStartVREG;
  reg  hEndV_1;
  reg  vStartV_1;
  reg  [0:1] intdelay_reg_5;  // ufix1 [2]
  wire [0:1] intdelay_reg_next_5;  // ufix1 [2]
  wire vEndREG;
  reg  validInV_1;
  reg  InBetweenREG;
  wire [15:0] LineAverage;  // ufix16
  wire [15:0] ConstOne;  // ufix16
  wire [15:0] LineAveragePlus;  // ufix16
  reg [15:0] LineAverageREG;  // ufix16
  wire [1:0] BooleanZero;  // ufix2
  wire hStartR;
  wire blankCountEn;
  reg [15:0] BlankingCount;  // ufix16
  wire unloading;
  wire [1:0] LineStartV;  // ufix2
  wire [1:0] popEn;  // ufix2
  wire validR;
  reg  validRREG;
  wire hEndR;
  reg  hEndRREG;
  reg  hStartDRC;
  wire AllEndOfLine;
  reg  AllEndOfLineREG;
  wire vEndR;
  reg  vEndRREG;
  wire EndOrStart;
  wire outputData;
  wire Running;
  wire runOrUnload;
  reg  [0:1] intdelay_reg_6;  // ufix1 [2]
  wire [0:1] intdelay_reg_next_6;  // ufix1 [2]
  wire hEndRDT;
  wire dumpControl;
  wire preProcess;
  wire PrePadFlag;
  wire OnLineFlag;
  wire PostPadFlag;
  wire DumpingFlag;
  wire BlankingFlag;
  wire hStartOutFG;
  wire hEndOutFG;
  wire vEndOutFG;
  wire validOutFG;
  wire processDataPC;
  wire processDataGated;
  wire processDataGatedD;
  wire processDataGatedRU;
  reg  [0:1] intdelay_reg_7;  // ufix1 [2]
  wire [0:1] intdelay_reg_next_7;  // ufix1 [2]
  wire processDataP;
  wire outputProcess;
  wire ctrlOutZero;
  reg  [0:1] intdelay_reg_8;  // ufix1 [2]
  wire [0:1] intdelay_reg_next_8;  // ufix1 [2]
  wire hStartRDP;
  reg  hStartRD;
  wire hStartP;
  reg  hStartOut_1;
  reg  reg_switch_delay;  // ufix1
  wire hEndGate;
  wire hEndGateN;
  wire hEndFGG;
  reg  [0:2] intdelay_reg_9;  // ufix1 [3]
  wire [0:2] intdelay_reg_next_9;  // ufix1 [3]
  wire hEndRD;
  wire hEndP;
  reg  hEndOut_1;
  reg  reg_switch_delay_1;  // ufix1
  wire frameStarted;
  wire frameStartedN;
  wire vStartGate;
  wire vStartP;
  reg  vStartOut_1;
  reg  [0:3] intdelay_reg_10;  // ufix1 [4]
  wire [0:3] intdelay_reg_next_10;  // ufix1 [4]
  wire vEndRD;
  wire vEndRDH;
  wire vEndP;
  reg  vEndOut_1;
  reg  outputDataREG;
  wire validFGG;
  reg  [0:1] intdelay_reg_11;  // ufix1 [2]
  wire [0:1] intdelay_reg_next_11;  // ufix1 [2]
  wire validRPre;
  reg  validRD;
  wire validRDEnd;
  wire validP;
  reg  validOD;
  reg  processDataOD;


  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        intdelay_reg[0] <= 1'b0;
        intdelay_reg[1] <= 1'b0;
        intdelay_reg[2] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg[0] <= intdelay_reg_next[0];
          intdelay_reg[1] <= intdelay_reg_next[1];
          intdelay_reg[2] <= intdelay_reg_next[2];
        end
      end
    end

  assign hStartInD = intdelay_reg[2];
  assign intdelay_reg_next[0] = hStartIn;
  assign intdelay_reg_next[1] = intdelay_reg[0];
  assign intdelay_reg_next[2] = intdelay_reg[1];



  always @(posedge clk or posedge reset)
    begin : intdelay_1_process
      if (reset == 1'b1) begin
        intdelay_reg_1[0] <= 1'b0;
        intdelay_reg_1[1] <= 1'b0;
        intdelay_reg_1[2] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_1[0] <= intdelay_reg_next_1[0];
          intdelay_reg_1[1] <= intdelay_reg_next_1[1];
          intdelay_reg_1[2] <= intdelay_reg_next_1[2];
        end
      end
    end

  assign hEndInD = intdelay_reg_1[2];
  assign intdelay_reg_next_1[0] = hEndIn;
  assign intdelay_reg_next_1[1] = intdelay_reg_1[0];
  assign intdelay_reg_next_1[2] = intdelay_reg_1[1];



  always @(posedge clk or posedge reset)
    begin : intdelay_2_process
      if (reset == 1'b1) begin
        intdelay_reg_2[0] <= 1'b0;
        intdelay_reg_2[1] <= 1'b0;
        intdelay_reg_2[2] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_2[0] <= intdelay_reg_next_2[0];
          intdelay_reg_2[1] <= intdelay_reg_next_2[1];
          intdelay_reg_2[2] <= intdelay_reg_next_2[2];
        end
      end
    end

  assign vStartInD = intdelay_reg_2[2];
  assign intdelay_reg_next_2[0] = vStartIn;
  assign intdelay_reg_next_2[1] = intdelay_reg_2[0];
  assign intdelay_reg_next_2[2] = intdelay_reg_2[1];



  always @(posedge clk or posedge reset)
    begin : intdelay_3_process
      if (reset == 1'b1) begin
        intdelay_reg_3[0] <= 1'b0;
        intdelay_reg_3[1] <= 1'b0;
        intdelay_reg_3[2] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_3[0] <= intdelay_reg_next_3[0];
          intdelay_reg_3[1] <= intdelay_reg_next_3[1];
          intdelay_reg_3[2] <= intdelay_reg_next_3[2];
        end
      end
    end

  assign vEndInD = intdelay_reg_3[2];
  assign intdelay_reg_next_3[0] = vEndIn;
  assign intdelay_reg_next_3[1] = intdelay_reg_3[0];
  assign intdelay_reg_next_3[2] = intdelay_reg_3[1];



  always @(posedge clk or posedge reset)
    begin : intdelay_4_process
      if (reset == 1'b1) begin
        intdelay_reg_4[0] <= 1'b0;
        intdelay_reg_4[1] <= 1'b0;
        intdelay_reg_4[2] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_4[0] <= intdelay_reg_next_4[0];
          intdelay_reg_4[1] <= intdelay_reg_next_4[1];
          intdelay_reg_4[2] <= intdelay_reg_next_4[2];
        end
      end
    end

  assign vEndInD_1 = intdelay_reg_4[2];
  assign intdelay_reg_next_4[0] = validIn;
  assign intdelay_reg_next_4[1] = intdelay_reg_4[0];
  assign intdelay_reg_next_4[2] = intdelay_reg_4[1];



  InputControlValidation u_INPUT_CONTROL_VALIDATION (.clk(clk),
                                                     .reset(reset),
                                                     .enb(enb),
                                                     .hStartIn(hStartInD),
                                                     .hEndIn(hEndInD),
                                                     .vStartIn(vStartInD),
                                                     .vEndIn(vEndInD),
                                                     .validIn(vEndInD_1),
                                                     .hStartOut(hStartV),
                                                     .hEndOut(hEndV),
                                                     .vStartOut(vStartV),
                                                     .vEndOut(vEndV),
                                                     .validOut(validInV),
                                                     .InBetweenOut(InBetween)
                                                     );

  always @(posedge clk or posedge reset)
    begin : reg_rsvd_process
      if (reset == 1'b1) begin
        hStartVREG <= 1'b0;
      end
      else begin
        if (enb) begin
          hStartVREG <= hStartV;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_1_process
      if (reset == 1'b1) begin
        hEndV_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          hEndV_1 <= hEndV;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_2_process
      if (reset == 1'b1) begin
        vStartV_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          vStartV_1 <= vStartV;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_5_process
      if (reset == 1'b1) begin
        intdelay_reg_5[0] <= 1'b0;
        intdelay_reg_5[1] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_5[0] <= intdelay_reg_next_5[0];
          intdelay_reg_5[1] <= intdelay_reg_next_5[1];
        end
      end
    end

  assign vEndREG = intdelay_reg_5[1];
  assign intdelay_reg_next_5[0] = vEndV;
  assign intdelay_reg_next_5[1] = intdelay_reg_5[0];



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_3_process
      if (reset == 1'b1) begin
        validInV_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          validInV_1 <= validInV;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_4_process
      if (reset == 1'b1) begin
        InBetweenREG <= 1'b0;
      end
      else begin
        if (enb) begin
          InBetweenREG <= InBetween;
        end
      end
    end



  LineSpaceAverager u_LineSpaceAverager (.clk(clk),
                                         .reset(reset),
                                         .enb(enb),
                                         .InBetween(InBetweenREG),
                                         .InLine(hStartVREG),
                                         .LineSpaceAverage(LineAverage)  // ufix16
                                         );

  assign ConstOne = 16'b0000000000000001;



  assign LineAveragePlus = LineAverage + ConstOne;



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_5_process
      if (reset == 1'b1) begin
        LineAverageREG <= 16'b0000000000000000;
      end
      else begin
        if (enb) begin
          LineAverageREG <= LineAveragePlus;
        end
      end
    end



  assign BooleanZero = 2'b11;



  // Free running, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  always @(posedge clk or posedge reset)
    begin : Blank_Count_process
      if (reset == 1'b1) begin
        BlankingCount <= 16'b0000000000000000;
      end
      else begin
        if (enb) begin
          if (hStartR == 1'b1) begin
            BlankingCount <= 16'b0000000000000000;
          end
          else if (blankCountEn == 1'b1) begin
            BlankingCount <= BlankingCount + 16'b0000000000000001;
          end
        end
      end
    end



  assign popEn = (unloading == 1'b0 ? LineStartV :
              BooleanZero);



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_6_process
      if (reset == 1'b1) begin
        validRREG <= 1'b0;
      end
      else begin
        if (enb) begin
          validRREG <= validR;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_7_process
      if (reset == 1'b1) begin
        hEndRREG <= 1'b0;
      end
      else begin
        if (enb) begin
          hEndRREG <= hEndR;
        end
      end
    end



  DATA_MEMORY u_DATA_MEMORY (.clk(clk),
                             .reset(reset),
                             .enb(enb),
                             .Unloading(unloading),
                             .hStartIn(hStartDRC),
                             .hEndIn(hEndRREG),
                             .validIn(validRREG),
                             .popEn(popEn),  // ufix2
                             .AllAtEnd(AllEndOfLine)
                             );

  always @(posedge clk or posedge reset)
    begin : reg_rsvd_8_process
      if (reset == 1'b1) begin
        AllEndOfLineREG <= 1'b0;
      end
      else begin
        if (enb) begin
          AllEndOfLineREG <= AllEndOfLine;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_9_process
      if (reset == 1'b1) begin
        vEndRREG <= 1'b0;
      end
      else begin
        if (enb) begin
          vEndRREG <= vEndR;
        end
      end
    end



  assign EndOrStart = vStartIn | vEndRREG;



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_10_process
      if (reset == 1'b1) begin
        hStartDRC <= 1'b0;
      end
      else begin
        if (enb) begin
          hStartDRC <= hStartR;
        end
      end
    end



  LineInfoStore u_LINE_INFO_STORE (.clk(clk),
                                   .reset(reset),
                                   .enb(enb),
                                   .hStartIn(hStartDRC),
                                   .Unloading(unloading),
                                   .frameEnd(EndOrStart),
                                   .lineStartV(LineStartV)  // ufix2
                                   );

  DataReadController u_DATA_READ_CONTROLLER (.clk(clk),
                                             .reset(reset),
                                             .enb(enb),
                                             .hStartIn(hStartVREG),
                                             .hEndIn(hEndV_1),
                                             .vStartIn(vStartV_1),
                                             .vEndIn(vEndREG),
                                             .validIn(validInV_1),
                                             .lineStartV(LineStartV),  // ufix2
                                             .lineAverage(LineAverageREG),  // ufix16
                                             .AllEndOfLine(AllEndOfLineREG),
                                             .BlankCount(BlankingCount),  // ufix16
                                             .frameStart(vStartIn),
                                             .hStartR(hStartR),
                                             .hEndR(hEndR),
                                             .vEndR(vEndR),
                                             .validR(validR),
                                             .outputData(outputData),
                                             .Unloading(unloading),
                                             .blankCountEn(blankCountEn),
                                             .Running(Running)
                                             );

  assign runOrUnload = unloading | Running;



  always @(posedge clk or posedge reset)
    begin : intdelay_6_process
      if (reset == 1'b1) begin
        intdelay_reg_6[0] <= 1'b0;
        intdelay_reg_6[1] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_6[0] <= intdelay_reg_next_6[0];
          intdelay_reg_6[1] <= intdelay_reg_next_6[1];
        end
      end
    end

  assign hEndRDT = intdelay_reg_6[1];
  assign intdelay_reg_next_6[0] = hEndR;
  assign intdelay_reg_next_6[1] = intdelay_reg_6[0];



  LineInfoStore_block u_State_Transition_Flag_Gen (.clk(clk),
                                                   .reset(reset),
                                                   .enb(enb),
                                                   .hStartIn(hStartDRC),
                                                   .hEndIn(hEndRDT),
                                                   .vEndIn(vEndRREG),
                                                   .validIn(validRREG),
                                                   .dumpControl(dumpControl),
                                                   .preProcess(preProcess),
                                                   .PrePadFlag(PrePadFlag),
                                                   .OnLineFlag(OnLineFlag),
                                                   .PostPadFlag(PostPadFlag),
                                                   .DumpingFlag(DumpingFlag),
                                                   .BlankingFlag(BlankingFlag),
                                                   .hStartOut(hStartOutFG),
                                                   .hEndOut(hEndOutFG),
                                                   .vEndOut(vEndOutFG),
                                                   .validOut(validOutFG)
                                                   );

  PaddingController u_Padding_Controller (.clk(clk),
                                          .reset(reset),
                                          .enb(enb),
                                          .PrePadFlag(PrePadFlag),
                                          .OnLineFlag(OnLineFlag),
                                          .alphaPostPadFlag(PostPadFlag),
                                          .DumpingFlag(DumpingFlag),
                                          .BlankingFlag(BlankingFlag),
                                          .processData(processDataPC),
                                          .dumpControl(dumpControl),
                                          .PrePadding(preProcess)
                                          );

  GateProcessData u_Gate_Process_Data (.clk(clk),
                                       .reset(reset),
                                       .enb(enb),
                                       .processDataIn(processDataPC),
                                       .validIn(validRREG),
                                       .dumping(dumpControl),
                                       .outputData(outputData),
                                       .processData(processDataGated)
                                       );

  assign processDataGatedD = processDataGated | DumpingFlag;



  assign processDataGatedRU = runOrUnload & processDataGatedD;



  always @(posedge clk or posedge reset)
    begin : intdelay_7_process
      if (reset == 1'b1) begin
        intdelay_reg_7[0] <= 1'b0;
        intdelay_reg_7[1] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_7[0] <= intdelay_reg_next_7[0];
          intdelay_reg_7[1] <= intdelay_reg_next_7[1];
        end
      end
    end

  assign processDataP = intdelay_reg_7[1];
  assign intdelay_reg_next_7[0] = processDataGatedRU;
  assign intdelay_reg_next_7[1] = intdelay_reg_7[0];



  assign outputProcess = outputData & processDataP;



  assign ctrlOutZero = 1'b0;



  always @(posedge clk or posedge reset)
    begin : intdelay_8_process
      if (reset == 1'b1) begin
        intdelay_reg_8[0] <= 1'b0;
        intdelay_reg_8[1] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_8[0] <= intdelay_reg_next_8[0];
          intdelay_reg_8[1] <= intdelay_reg_next_8[1];
        end
      end
    end

  assign hStartRDP = intdelay_reg_8[1];
  assign intdelay_reg_next_8[0] = hStartOutFG;
  assign intdelay_reg_next_8[1] = intdelay_reg_8[0];



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_11_process
      if (reset == 1'b1) begin
        hStartRD <= 1'b0;
      end
      else begin
        if (enb) begin
          hStartRD <= hStartRDP;
        end
      end
    end



  assign hStartP = (outputProcess == 1'b0 ? ctrlOutZero :
              hStartRD);



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_12_process
      if (reset == 1'b1) begin
        hStartOut_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          hStartOut_1 <= hStartP;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_13_process
      if (reset == 1'b1) begin
        reg_switch_delay <= 1'b0;
      end
      else begin
        if (enb) begin
          if (hStartOutFG == 1'b1) begin
            reg_switch_delay <= 1'b0;
          end
          else begin
            if (hEndOutFG) begin
              reg_switch_delay <= hEndOutFG;
            end
          end
        end
      end
    end

  assign hEndGate = (hStartOutFG == 1'b1 ? 1'b0 :
              reg_switch_delay);



  assign hEndGateN =  ~ hEndGate;



  assign hEndFGG = hEndOutFG & hEndGateN;



  always @(posedge clk or posedge reset)
    begin : intdelay_9_process
      if (reset == 1'b1) begin
        intdelay_reg_9[0] <= 1'b0;
        intdelay_reg_9[1] <= 1'b0;
        intdelay_reg_9[2] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_9[0] <= intdelay_reg_next_9[0];
          intdelay_reg_9[1] <= intdelay_reg_next_9[1];
          intdelay_reg_9[2] <= intdelay_reg_next_9[2];
        end
      end
    end

  assign hEndRD = intdelay_reg_9[2];
  assign intdelay_reg_next_9[0] = hEndFGG;
  assign intdelay_reg_next_9[1] = intdelay_reg_9[0];
  assign intdelay_reg_next_9[2] = intdelay_reg_9[1];



  assign hEndP = (outputProcess == 1'b0 ? ctrlOutZero :
              hEndRD);



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_14_process
      if (reset == 1'b1) begin
        hEndOut_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          hEndOut_1 <= hEndP;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_15_process
      if (reset == 1'b1) begin
        reg_switch_delay_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          if (vStartIn == 1'b1) begin
            reg_switch_delay_1 <= 1'b0;
          end
          else begin
            if (hStartP) begin
              reg_switch_delay_1 <= hStartP;
            end
          end
        end
      end
    end

  assign frameStarted = (vStartIn == 1'b1 ? 1'b0 :
              reg_switch_delay_1);



  assign frameStartedN =  ~ frameStarted;



  assign vStartGate = hStartP & frameStartedN;



  assign vStartP = (outputProcess == 1'b0 ? ctrlOutZero :
              vStartGate);



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_16_process
      if (reset == 1'b1) begin
        vStartOut_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          vStartOut_1 <= vStartP;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_10_process
      if (reset == 1'b1) begin
        intdelay_reg_10[0] <= 1'b0;
        intdelay_reg_10[1] <= 1'b0;
        intdelay_reg_10[2] <= 1'b0;
        intdelay_reg_10[3] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_10[0] <= intdelay_reg_next_10[0];
          intdelay_reg_10[1] <= intdelay_reg_next_10[1];
          intdelay_reg_10[2] <= intdelay_reg_next_10[2];
          intdelay_reg_10[3] <= intdelay_reg_next_10[3];
        end
      end
    end

  assign vEndRD = intdelay_reg_10[3];
  assign intdelay_reg_next_10[0] = vEndOutFG;
  assign intdelay_reg_next_10[1] = intdelay_reg_10[0];
  assign intdelay_reg_next_10[2] = intdelay_reg_10[1];
  assign intdelay_reg_next_10[3] = intdelay_reg_10[2];



  assign vEndRDH = vEndRD & hEndRD;



  assign vEndP = (outputProcess == 1'b0 ? ctrlOutZero :
              vEndRDH);



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_17_process
      if (reset == 1'b1) begin
        vEndOut_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          vEndOut_1 <= vEndP;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_18_process
      if (reset == 1'b1) begin
        outputDataREG <= 1'b0;
      end
      else begin
        if (enb) begin
          outputDataREG <= outputData;
        end
      end
    end



  assign validFGG = validOutFG & hEndGateN;



  always @(posedge clk or posedge reset)
    begin : intdelay_11_process
      if (reset == 1'b1) begin
        intdelay_reg_11[0] <= 1'b0;
        intdelay_reg_11[1] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_11[0] <= intdelay_reg_next_11[0];
          intdelay_reg_11[1] <= intdelay_reg_next_11[1];
        end
      end
    end

  assign validRPre = intdelay_reg_11[1];
  assign intdelay_reg_next_11[0] = validFGG;
  assign intdelay_reg_next_11[1] = intdelay_reg_11[0];



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_19_process
      if (reset == 1'b1) begin
        validRD <= 1'b0;
      end
      else begin
        if (enb) begin
          validRD <= validRPre;
        end
      end
    end



  assign validRDEnd = validRD | hEndRD;



  assign validP = (outputProcess == 1'b0 ? ctrlOutZero :
              validRDEnd);



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_20_process
      if (reset == 1'b1) begin
        validOD <= 1'b0;
      end
      else begin
        if (enb) begin
          validOD <= validP;
        end
      end
    end



  assign validOut = (outputDataREG == 1'b0 ? ctrlOutZero :
              validOD);



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_21_process
      if (reset == 1'b1) begin
        processDataOD <= 1'b0;
      end
      else begin
        if (enb) begin
          processDataOD <= processDataP;
        end
      end
    end



  assign processDataOut = (outputDataREG == 1'b0 ? ctrlOutZero :
              processDataOD);



  assign hStartOut = hStartOut_1;

  assign hEndOut = hEndOut_1;

  assign vStartOut = vStartOut_1;

  assign vEndOut = vEndOut_1;

endmodule  // LineBuffer
