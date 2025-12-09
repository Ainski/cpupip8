onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib dmem1_opt

do {wave.do}

view wave
view structure
view signals

do {dmem1.udo}

run -all

quit -force
