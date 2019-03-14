<CsoundSynthesizer>
<CsOptions>
-n -d 
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1
iInitIndex = 0
kMapNotes[] init 64
kMapCodes[] init 64

declareMapChannels:
    SNote sprintf "mapNote%d", iInitIndex
    SCode sprintf "mapCode%d", iInitIndex    
    chn_k SNote, 1, 1
    chn_k SCode, 1, 1


loop_lt iInitIndex, 1, 64, declareMapChannels

instr 1

iMapIndex = 0
sendMap:
    SNote sprintf "mapNote%d", iMapIndex
    SCode sprintf "mapCode%d", iMapIndex
    iNote chnget SNote
    iCode chnget SCode
loop_lt iMapIndex, 1, 64, sendMap

endin

</CsInstruments>
<CsScore>
i1 0 10
</CsScore>
</CsoundSynthesizer>