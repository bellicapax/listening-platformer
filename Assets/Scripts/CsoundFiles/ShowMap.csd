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

; Globals
giNoteOffset = 36
giNumButtons = 64
gSColorFormat = "Color%d"
gSStatusFormat = "Status%d"
gSColorChannels[] init giNumButtons
gSStatusChannels[] init giNumButtons
giOnColors[] init giNumButtons
giOffColors[] init giNumButtons
giStatuses[] init giNumButtons
; []on colors (kdata2)
; []off colors (kdata2)
; []last codes (kstatus)
; start note addend (add this to index to get note [kdata1] to send)
; operation is kInt that tells you to showMap, wipeMap, listenToController, doNothing

iInitIndex = 0
declareMapChannels:
    gSColorChannels[iInitIndex] sprintf gSColorFormat, iInitIndex
    gSStatusChannels[iInitIndex] sprintf gSStatusFormat, iInitIndex
    ;prints "Color channel %s\n", gSColorChannels[iInitIndex]
    ;prints "Status channel %s\n", gSStatusChannels[iInitIndex]
    chn_k gSColorChannels[iInitIndex], 1, 1
    chn_k gSStatusChannels[iInitIndex], 1, 1
loop_lt iInitIndex, 1, giNumButtons, declareMapChannels

instr 1

kk = 0

kOpCode chnget "OpCode"
if (kOpCode == 1) then

	updateGrid:
    kColor chnget gSColorChannels[kk]
    kStatus chnget gSStatusChannels[kk]
    midiout kStatus, 1, kColor, kk + giNoteOffset
    loop_lt kk, 1, giNumButtons, updateGrid

elseif (kOpCode == 2) then

			printks "OpCode%d", 1, kOpCode

endif

endin

</CsInstruments>
<CsScore>
i1 0 2
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
