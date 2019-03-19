<CsoundSynthesizer>
<CsOptions>
-n -d -Q3
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
gSOnColorFormat init "OnColor%d"
gSOffColorFormat init "OffColor%d"
gSStatusFormat init "Status%d"
gSOpCodeChannel init "OpCode"
gSOnColorChannels[] init giNumButtons
gSOffColorChannels[] init giNumButtons
gSStatusChannels[] init giNumButtons
giOnColors[] init giNumButtons
giOffColors[] init giNumButtons
giStatuses[] init giNumButtons
; []on colors (kdata2)
; []off colors (kdata2)
; []last codes (kstatus)
; start note addend (add this to index to get note [kdata1] to send)
; operation is kInt that tells you to showMap, wipeMap, listenToController, doNothing

chn_k gSOpCodeChannel, 3, 1
indx init 0
declareMapChannels:
    gSOnColorChannels[indx] sprintf gSOnColorFormat, indx
    gSOffColorChannels[indx] sprintf gSOffColorFormat, indx
    gSStatusChannels[indx] sprintf gSStatusFormat, indx
    ;prints "Color channel %s\n", gSOnColorChannels[indx]
    ;prints "Status channel %s\n", gSStatusChannels[indx]
    chn_k gSOnColorChannels[indx], 3, 1
    chn_k gSOffColorChannels[indx], 3, 1
    chn_k gSStatusChannels[indx], 3, 1
loop_lt indx, 1, giNumButtons, declareMapChannels

; can't do chnset in global code

instr 1

kk = 0

kOpCode = 1
;kOpCode chnget gSOpCodeChannel
printks "OpCode%d", 1, kOpCode

if (kOpCode == 1) then

  chnset 0, gSOpCodeChannel

  printks "UpdateGrid", 1
	updateGrid:
		;kStatusChn sprintfk "Status%d", kk
    ;kColor chnget gSOffColorChannels[kk]
    ;kStatus chnget gSStatusChannels[kk]
    ;kStatus chnget kStatusChn
    kColor = 3
    kStatus = 144
    midiout kStatus, 1, kk + giNoteOffset, kColor
    loop_lt kk, 1, giNumButtons, updateGrid


elseif (kOpCode == 2) then

			printks "OpCode%d", 1, kOpCode

endif

endin

</CsInstruments>
<CsScore>
i1 0 3
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
