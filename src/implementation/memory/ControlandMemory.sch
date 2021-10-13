<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="dout(15:0)" />
        <signal name="CLK" />
        <signal name="RESET" />
        <signal name="addra(9:0)" />
        <signal name="dina(15:0)" />
        <signal name="wea(0:0)" />
        <signal name="ALUSrc" />
        <signal name="MemtoReg" />
        <signal name="RegDst" />
        <signal name="RegWrite" />
        <signal name="MemRead" />
        <signal name="MemWrite" />
        <signal name="Branch" />
        <signal name="dout(15:10)" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="RESET" />
        <port polarity="Input" name="addra(9:0)" />
        <port polarity="Input" name="dina(15:0)" />
        <port polarity="Input" name="wea(0:0)" />
        <port polarity="Output" name="ALUSrc" />
        <port polarity="Output" name="MemtoReg" />
        <port polarity="Output" name="RegDst" />
        <port polarity="Output" name="RegWrite" />
        <port polarity="Output" name="MemRead" />
        <port polarity="Output" name="MemWrite" />
        <port polarity="Output" name="Branch" />
        <blockdef name="MIPS_control_unit">
            <timestamp>2019-10-21T20:22:51</timestamp>
            <rect width="256" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="blockmemory16x1">
            <timestamp>2019-10-22T17:37:17</timestamp>
            <rect width="512" x="32" y="32" height="1344" />
            <line x2="32" y1="80" y2="80" style="linewidth:W" x1="0" />
            <line x2="32" y1="112" y2="112" style="linewidth:W" x1="0" />
            <line x2="32" y1="208" y2="208" style="linewidth:W" x1="0" />
            <line x2="32" y1="272" y2="272" x1="0" />
            <line x2="544" y1="80" y2="80" style="linewidth:W" x1="576" />
        </blockdef>
        <block symbolname="MIPS_control_unit" name="XLXI_1">
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="RESET" name="Reset" />
            <blockpin signalname="dout(15:10)" name="Opcode(5:0)" />
            <blockpin signalname="ALUSrc" name="ALUSrc" />
            <blockpin signalname="MemtoReg" name="MemtoReg" />
            <blockpin signalname="RegDst" name="RegDst" />
            <blockpin signalname="RegWrite" name="RegWrite" />
            <blockpin signalname="MemRead" name="MemRead" />
            <blockpin signalname="MemWrite" name="MemWrite" />
            <blockpin signalname="Branch" name="Branch" />
        </block>
        <block symbolname="blockmemory16x1" name="XLXI_4">
            <blockpin signalname="addra(9:0)" name="addra(9:0)" />
            <blockpin signalname="dina(15:0)" name="dina(15:0)" />
            <blockpin signalname="wea(0:0)" name="wea(0:0)" />
            <blockpin signalname="CLK" name="clka" />
            <blockpin signalname="dout(15:0)" name="douta(15:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1776" y="1392" name="XLXI_1" orien="R0">
        </instance>
        <instance x="864" y="704" name="XLXI_4" orien="R0">
        </instance>
        <branch name="dout(15:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1856" y="784" type="branch" />
            <wire x2="1856" y1="784" y2="784" x1="1440" />
        </branch>
        <branch name="CLK">
            <wire x2="800" y1="976" y2="976" x1="640" />
            <wire x2="864" y1="976" y2="976" x1="800" />
            <wire x2="800" y1="976" y2="2160" x1="800" />
            <wire x2="1568" y1="2160" y2="2160" x1="800" />
            <wire x2="1776" y1="960" y2="960" x1="1568" />
            <wire x2="1776" y1="960" y2="976" x1="1776" />
            <wire x2="1568" y1="960" y2="2160" x1="1568" />
        </branch>
        <branch name="RESET">
            <wire x2="1776" y1="1168" y2="1168" x1="1744" />
        </branch>
        <iomarker fontsize="28" x="1744" y="1168" name="RESET" orien="R180" />
        <branch name="addra(9:0)">
            <wire x2="864" y1="784" y2="784" x1="832" />
        </branch>
        <iomarker fontsize="28" x="832" y="784" name="addra(9:0)" orien="R180" />
        <branch name="dina(15:0)">
            <wire x2="864" y1="816" y2="816" x1="832" />
        </branch>
        <iomarker fontsize="28" x="832" y="816" name="dina(15:0)" orien="R180" />
        <branch name="wea(0:0)">
            <wire x2="864" y1="912" y2="912" x1="832" />
        </branch>
        <iomarker fontsize="28" x="832" y="912" name="wea(0:0)" orien="R180" />
        <branch name="ALUSrc">
            <wire x2="2192" y1="976" y2="976" x1="2160" />
        </branch>
        <iomarker fontsize="28" x="2192" y="976" name="ALUSrc" orien="R0" />
        <branch name="MemtoReg">
            <wire x2="2192" y1="1040" y2="1040" x1="2160" />
        </branch>
        <iomarker fontsize="28" x="2192" y="1040" name="MemtoReg" orien="R0" />
        <branch name="RegDst">
            <wire x2="2192" y1="1104" y2="1104" x1="2160" />
        </branch>
        <iomarker fontsize="28" x="2192" y="1104" name="RegDst" orien="R0" />
        <branch name="RegWrite">
            <wire x2="2192" y1="1168" y2="1168" x1="2160" />
        </branch>
        <iomarker fontsize="28" x="2192" y="1168" name="RegWrite" orien="R0" />
        <branch name="MemRead">
            <wire x2="2192" y1="1232" y2="1232" x1="2160" />
        </branch>
        <iomarker fontsize="28" x="2192" y="1232" name="MemRead" orien="R0" />
        <branch name="MemWrite">
            <wire x2="2192" y1="1296" y2="1296" x1="2160" />
        </branch>
        <iomarker fontsize="28" x="2192" y="1296" name="MemWrite" orien="R0" />
        <branch name="Branch">
            <wire x2="2192" y1="1360" y2="1360" x1="2160" />
        </branch>
        <iomarker fontsize="28" x="2192" y="1360" name="Branch" orien="R0" />
        <branch name="dout(15:10)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1712" y="1360" type="branch" />
            <wire x2="1776" y1="1360" y2="1360" x1="1712" />
        </branch>
        <iomarker fontsize="28" x="640" y="976" name="CLK" orien="R180" />
    </sheet>
</drawing>