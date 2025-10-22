vlib work
vlog tb_seq_det.v
vsim top
add wave -position insertpoint sim:/top/dut/*
run -all
