vlib work
vlog tb_seq.v
vsim top
add wave -position insertpoint sim:/top/dut/*
run -all
