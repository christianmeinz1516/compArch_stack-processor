<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Reset" />
        <signal name="wea" />
        <signal name="dina(15:0)" />
        <signal name="addra(9:0)" />
        <signal name="CLK" />
        <signal name="dout(15:12)" />
        <signal name="dout(1:0)" />
        <signal name="dout(3:2)" />
        <signal name="popAmt" />
        <signal name="flip" />
        <signal name="ESAct" />
        <signal name="ALUSrcA" />
        <signal name="IRWrite" />
        <signal name="ShiftSrc" />
        <signal name="ShamtSrc" />
        <signal name="RegWrite" />
        <signal name="IorD" />
        <signal name="PCWrite" />
        <signal name="BEQCond" />
        <signal name="BNECond" />
        <signal name="RegDst" />
        <signal name="ESOp(1:0)" />
        <signal name="ALUSrcB(1:0)" />
        <signal name="ALUOP(1:0)" />
        <signal name="PCSrc(1:0)" />
        <signal name="PushSrc(2:0)" />
        <signal name="dupNum(1:0)" />
        <signal name="current_state(4:0)" />
        <signal name="next_state(4:0)" />
        <signal name="dout(15:0)" />
        <port polarity="Input" name="Reset" />
        <port polarity="Input" name="dina(15:0)" />
        <port polarity="Input" name="addra(9:0)" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="popAmt" />
        <port polarity="Output" name="flip" />
        <port polarity="Output" name="ESAct" />
        <port polarity="Output" name="ALUSrcA" />
        <port polarity="Output" name="IRWrite" />
        <port polarity="Output" name="ShiftSrc" />
        <port polarity="Output" name="ShamtSrc" />
        <port polarity="Output" name="RegWrite" />
        <port polarity="Output" name="IorD" />
        <port polarity="Output" name="PCWrite" />
        <port polarity="Output" name="BEQCond" />
        <port polarity="Output" name="BNECond" />
        <port polarity="Output" name="RegDst" />
        <port polarity="Output" name="ESOp(1:0)" />
        <port polarity="Output" name="ALUSrcB(1:0)" />
        <port polarity="Output" name="ALUOP(1:0)" />
        <port polarity="Output" name="PCSrc(1:0)" />
        <port polarity="Output" name="PushSrc(2:0)" />
        <port polarity="Output" name="dupNum(1:0)" />
        <port polarity="Output" name="current_state(4:0)" />
        <port polarity="Output" name="next_state(4:0)" />
        <blockdef name="controlUnit">
            <timestamp>2019-11-4T15:48:9</timestamp>
            <rect width="336" x="64" y="-1472" height="1472" />
            <line x2="0" y1="-1440" y2="-1440" x1="64" />
            <line x2="0" y1="-1088" y2="-1088" x1="64" />
            <rect width="64" x="0" y="-748" height="24" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <rect width="64" x="0" y="-396" height="24" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="464" y1="-1440" y2="-1440" x1="400" />
            <line x2="464" y1="-1376" y2="-1376" x1="400" />
            <line x2="464" y1="-1312" y2="-1312" x1="400" />
            <line x2="464" y1="-1248" y2="-1248" x1="400" />
            <line x2="464" y1="-1184" y2="-1184" x1="400" />
            <line x2="464" y1="-1120" y2="-1120" x1="400" />
            <line x2="464" y1="-1056" y2="-1056" x1="400" />
            <line x2="464" y1="-992" y2="-992" x1="400" />
            <line x2="464" y1="-928" y2="-928" x1="400" />
            <line x2="464" y1="-864" y2="-864" x1="400" />
            <line x2="464" y1="-800" y2="-800" x1="400" />
            <line x2="464" y1="-736" y2="-736" x1="400" />
            <line x2="464" y1="-672" y2="-672" x1="400" />
            <line x2="464" y1="-608" y2="-608" x1="400" />
            <line x2="464" y1="-544" y2="-544" x1="400" />
            <rect width="64" x="400" y="-492" height="24" />
            <line x2="464" y1="-480" y2="-480" x1="400" />
            <rect width="64" x="400" y="-428" height="24" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <rect width="64" x="400" y="-364" height="24" />
            <line x2="464" y1="-352" y2="-352" x1="400" />
            <rect width="64" x="400" y="-300" height="24" />
            <line x2="464" y1="-288" y2="-288" x1="400" />
            <rect width="64" x="400" y="-236" height="24" />
            <line x2="464" y1="-224" y2="-224" x1="400" />
            <rect width="64" x="400" y="-172" height="24" />
            <line x2="464" y1="-160" y2="-160" x1="400" />
            <rect width="64" x="400" y="-108" height="24" />
            <line x2="464" y1="-96" y2="-96" x1="400" />
            <rect width="64" x="400" y="-44" height="24" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
        </blockdef>
        <blockdef name="blockMemory16">
            <timestamp>2019-11-12T14:29:18</timestamp>
            <rect width="512" x="32" y="32" height="1344" />
            <line x2="32" y1="80" y2="80" style="linewidth:W" x1="0" />
            <line x2="32" y1="112" y2="112" style="linewidth:W" x1="0" />
            <line x2="32" y1="208" y2="208" style="linewidth:W" x1="0" />
            <line x2="32" y1="272" y2="272" x1="0" />
            <line x2="544" y1="80" y2="80" style="linewidth:W" x1="576" />
        </blockdef>
        <block symbolname="controlUnit" name="XLXI_1">
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="Reset" name="Reset" />
            <blockpin signalname="dout(15:12)" name="Opcode(3:0)" />
            <blockpin signalname="dout(1:0)" name="dampt(1:0)" />
            <blockpin signalname="dout(3:2)" name="funct(1:0)" />
            <blockpin signalname="popAmt" name="popAmt" />
            <blockpin signalname="flip" name="flip" />
            <blockpin signalname="ESAct" name="ESAct" />
            <blockpin signalname="ALUSrcA" name="ALUSrcA" />
            <blockpin signalname="IRWrite" name="IRWrite" />
            <blockpin signalname="ShiftSrc" name="ShiftSrc" />
            <blockpin signalname="ShamtSrc" name="ShamtSrc" />
            <blockpin signalname="RegWrite" name="RegWrite" />
            <blockpin signalname="IorD" name="IorD" />
            <blockpin signalname="wea" name="wea" />
            <blockpin signalname="PCWrite" name="PCWrite" />
            <blockpin signalname="BEQCond" name="BEQCond" />
            <blockpin signalname="BNECond" name="BNECond" />
            <blockpin signalname="RegDst" name="RegDst" />
            <blockpin signalname="ESOp(1:0)" name="ESOp(1:0)" />
            <blockpin signalname="ALUSrcB(1:0)" name="ALUSrcB(1:0)" />
            <blockpin signalname="ALUOP(1:0)" name="ALUOp(1:0)" />
            <blockpin signalname="PCSrc(1:0)" name="PCSrc(1:0)" />
            <blockpin signalname="PushSrc(2:0)" name="PushSrc(2:0)" />
            <blockpin signalname="dupNum(1:0)" name="dupNum(1:0)" />
            <blockpin signalname="current_state(4:0)" name="current_state(4:0)" />
            <blockpin signalname="next_state(4:0)" name="next_state(4:0)" />
        </block>
        <block symbolname="blockMemory16" name="XLXI_2">
            <blockpin signalname="addra(9:0)" name="addra(9:0)" />
            <blockpin signalname="dina(15:0)" name="dina(15:0)" />
            <blockpin signalname="wea" name="wea(0:0)" />
            <blockpin signalname="CLK" name="clka" />
            <blockpin signalname="dout(15:0)" name="douta(15:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2272" y="1968" name="XLXI_1" orien="R0">
        </instance>
        <instance x="720" y="496" name="XLXI_2" orien="R0">
        </instance>
        <branch name="Reset">
            <wire x2="2272" y1="880" y2="880" x1="2240" />
        </branch>
        <iomarker fontsize="28" x="2240" y="880" name="Reset" orien="R180" />
        <branch name="wea">
            <wire x2="720" y1="704" y2="704" x1="688" />
            <wire x2="688" y1="704" y2="2032" x1="688" />
            <wire x2="3056" y1="2032" y2="2032" x1="688" />
            <wire x2="2768" y1="1104" y2="1104" x1="2736" />
            <wire x2="3056" y1="1104" y2="1104" x1="2768" />
            <wire x2="3056" y1="1104" y2="2032" x1="3056" />
        </branch>
        <branch name="dina(15:0)">
            <wire x2="720" y1="608" y2="608" x1="688" />
        </branch>
        <iomarker fontsize="28" x="688" y="608" name="dina(15:0)" orien="R180" />
        <branch name="addra(9:0)">
            <wire x2="720" y1="576" y2="576" x1="688" />
        </branch>
        <iomarker fontsize="28" x="688" y="576" name="addra(9:0)" orien="R180" />
        <iomarker fontsize="28" x="352" y="432" name="CLK" orien="R90" />
        <branch name="CLK">
            <wire x2="352" y1="416" y2="432" x1="352" />
            <wire x2="720" y1="416" y2="416" x1="352" />
            <wire x2="720" y1="416" y2="464" x1="720" />
            <wire x2="1360" y1="464" y2="464" x1="720" />
            <wire x2="1360" y1="464" y2="528" x1="1360" />
            <wire x2="2272" y1="528" y2="528" x1="1360" />
            <wire x2="704" y1="464" y2="768" x1="704" />
            <wire x2="720" y1="768" y2="768" x1="704" />
            <wire x2="720" y1="464" y2="464" x1="704" />
        </branch>
        <branch name="dout(15:12)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="1232" type="branch" />
            <wire x2="2272" y1="1232" y2="1232" x1="2080" />
        </branch>
        <branch name="dout(1:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2112" y="1584" type="branch" />
            <wire x2="2272" y1="1584" y2="1584" x1="2112" />
        </branch>
        <branch name="dout(3:2)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2144" y="1936" type="branch" />
            <wire x2="2272" y1="1936" y2="1936" x1="2144" />
        </branch>
        <branch name="popAmt">
            <wire x2="2768" y1="528" y2="528" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="528" name="popAmt" orien="R0" />
        <branch name="flip">
            <wire x2="2768" y1="592" y2="592" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="592" name="flip" orien="R0" />
        <branch name="ESAct">
            <wire x2="2768" y1="656" y2="656" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="656" name="ESAct" orien="R0" />
        <branch name="ALUSrcA">
            <wire x2="2768" y1="720" y2="720" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="720" name="ALUSrcA" orien="R0" />
        <branch name="IRWrite">
            <wire x2="2768" y1="784" y2="784" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="784" name="IRWrite" orien="R0" />
        <branch name="ShiftSrc">
            <wire x2="2768" y1="848" y2="848" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="848" name="ShiftSrc" orien="R0" />
        <branch name="ShamtSrc">
            <wire x2="2768" y1="912" y2="912" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="912" name="ShamtSrc" orien="R0" />
        <branch name="RegWrite">
            <wire x2="2768" y1="976" y2="976" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="976" name="RegWrite" orien="R0" />
        <branch name="IorD">
            <wire x2="2768" y1="1040" y2="1040" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="1040" name="IorD" orien="R0" />
        <branch name="PCWrite">
            <wire x2="2768" y1="1168" y2="1168" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="1168" name="PCWrite" orien="R0" />
        <branch name="BEQCond">
            <wire x2="2768" y1="1232" y2="1232" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="1232" name="BEQCond" orien="R0" />
        <branch name="BNECond">
            <wire x2="2768" y1="1296" y2="1296" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="1296" name="BNECond" orien="R0" />
        <branch name="RegDst">
            <wire x2="2768" y1="1424" y2="1424" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="1424" name="RegDst" orien="R0" />
        <branch name="ESOp(1:0)">
            <wire x2="2768" y1="1488" y2="1488" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="1488" name="ESOp(1:0)" orien="R0" />
        <branch name="ALUSrcB(1:0)">
            <wire x2="2768" y1="1552" y2="1552" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="1552" name="ALUSrcB(1:0)" orien="R0" />
        <branch name="ALUOP(1:0)">
            <wire x2="2768" y1="1616" y2="1616" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="1616" name="ALUOP(1:0)" orien="R0" />
        <branch name="PCSrc(1:0)">
            <wire x2="2768" y1="1680" y2="1680" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="1680" name="PCSrc(1:0)" orien="R0" />
        <branch name="PushSrc(2:0)">
            <wire x2="2768" y1="1744" y2="1744" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="1744" name="PushSrc(2:0)" orien="R0" />
        <branch name="dupNum(1:0)">
            <wire x2="2768" y1="1808" y2="1808" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="1808" name="dupNum(1:0)" orien="R0" />
        <branch name="current_state(4:0)">
            <wire x2="2768" y1="1872" y2="1872" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="1872" name="current_state(4:0)" orien="R0" />
        <branch name="next_state(4:0)">
            <wire x2="2768" y1="1936" y2="1936" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="1936" name="next_state(4:0)" orien="R0" />
        <branch name="dout(15:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1472" y="576" type="branch" />
            <wire x2="1472" y1="576" y2="576" x1="1296" />
        </branch>
    </sheet>
</drawing>