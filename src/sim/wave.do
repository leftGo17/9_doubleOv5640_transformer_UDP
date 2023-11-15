onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -label sim:/tb_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel} /tb_cmos2sobel/sys_clk
add wave -noupdate -expand -label sim:/tb_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel} /tb_cmos2sobel/sys_rst_n
add wave -noupdate -expand -label sim:/tb_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel} /tb_cmos2sobel/start_flag
add wave -noupdate -expand -label sim:/tb_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel} /tb_cmos2sobel/clk
add wave -noupdate -expand -label sim:/tb_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel} /tb_cmos2sobel/rst_n
add wave -noupdate -expand -label sim:/tb_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel} /tb_cmos2sobel/cnt
add wave -noupdate -expand -label sim:/tb_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel} /tb_cmos2sobel/cmos_h
add wave -noupdate -expand -label sim:/tb_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel} /tb_cmos2sobel/cmos_v
add wave -noupdate -expand -label sim:/tb_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel} /tb_cmos2sobel/cam_href
add wave -noupdate -expand -label sim:/tb_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel} /tb_cmos2sobel/cam_vsync
add wave -noupdate -expand -label sim:/tb_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel} /tb_cmos2sobel/cam_data
add wave -noupdate -expand -label sim:/tb_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel} /tb_cmos2sobel/sobel_data
add wave -noupdate -expand -label sim:/tb_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel} /tb_cmos2sobel/sobel_en
add wave -noupdate -expand -label sim:/tb_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel} /tb_cmos2sobel/sobel_pic_start
add wave -noupdate -expand -label sim:/tb_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel} /tb_cmos2sobel/sobel_href_end
add wave -noupdate -expand -label sim:/tb_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel} /tb_cmos2sobel/sobel_first_href
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel} /tb_cmos2sobel/inst_cmos2sobel/clk
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel} /tb_cmos2sobel/inst_cmos2sobel/rst_n
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel} /tb_cmos2sobel/inst_cmos2sobel/cam_vsync
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel} /tb_cmos2sobel/inst_cmos2sobel/cam_href
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel} /tb_cmos2sobel/inst_cmos2sobel/cam_data
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel} /tb_cmos2sobel/inst_cmos2sobel/cmos_h
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel} /tb_cmos2sobel/inst_cmos2sobel/cmos_v
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel} /tb_cmos2sobel/inst_cmos2sobel/sobel_data
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel} /tb_cmos2sobel/inst_cmos2sobel/sobel_en
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel} /tb_cmos2sobel/inst_cmos2sobel/sobel_pic_start
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel} /tb_cmos2sobel/inst_cmos2sobel/sobel_href_end
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel} /tb_cmos2sobel/inst_cmos2sobel/sobel_first_href
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel} /tb_cmos2sobel/inst_cmos2sobel/gray_en
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel} /tb_cmos2sobel/inst_cmos2sobel/gray_data
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel} /tb_cmos2sobel/inst_cmos2sobel/href_start
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel} /tb_cmos2sobel/inst_cmos2sobel/href_end
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel} /tb_cmos2sobel/inst_cmos2sobel/pic_start
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel} /tb_cmos2sobel/inst_cmos2sobel/first_href
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel} /tb_cmos2sobel/inst_cmos2sobel/second_href
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel} /tb_cmos2sobel/inst_cmos2sobel/last_href
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/clk
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/rst_n
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/cam_vsync
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/cam_href
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/cam_data
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/cmos_v
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/gray_en
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/gray_data
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/href_start
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/href_end
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/pic_start
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/first_href
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/second_href
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/last_href
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/cam_vsync_reg1
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/cam_vsync_reg2
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/cam_vsync_reg3
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/cam_href_reg1
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/cam_href_reg2
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/cam_href_reg3
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/cam_data_reg1
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/cam_data_reg2
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/cam_data_reg3
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/hl_ctrl
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/high_byte
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/r
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/g
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/b
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/rgb_en
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/href_cnt
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/vsync_rise
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray} /tb_cmos2sobel/inst_cmos2sobel/inst_cmos2gray/href_rise
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/clk
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/rst_n
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/pic_start
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/first_href
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/second_href
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/last_href
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/href_start
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/href_end
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/gray_en
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/gray_data
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/cmos_h
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/sobel_data
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/sobel_en
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/sobel_pic_start
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/sobel_href_end
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/sobel_first_href
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/fifo1_wr
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/fifo1_wr_data
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/fifo1_rd
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/fifo1_rd_data
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/fifo2_wr
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/fifo2_wr_data
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/fifo2_rd
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/fifo2_rd_data
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/fifo2_rd_reg
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/gray_data_reg
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/a1
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/b1
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/c1
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/a2
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/b2
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/c2
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/a3
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/b3
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/c3
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/gx
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/gy
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/gxy
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/gxy_gray
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/gxy_gray_en
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/gxy_gray_en_reg
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/abc_ctrl
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel} -radix unsigned /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/abc_cnt
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/Data
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/Clk
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/WrEn
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/RdEn
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/Reset
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/Q
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/Empty
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/Full
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/GND
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/VCC
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n7_5 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n11_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wfull_val }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wfull_val_5 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wfull_val_6 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wfull_val_7 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/rbin_next_2_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/rbin_next_4_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/rbin_next_6_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/rbin_next_8_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/rbin_next_9_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wbin_next_2_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wbin_next_4_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wbin_next_6_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wbin_next_8_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wbin_next_11_6 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wfull_val_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wfull_val_9 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wfull_val_10 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wfull_val_11 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/rbin_next_6_9 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wfull_val_12 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wfull_val_13 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wfull_val_14 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wfull_val_16 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/rbin_next_0_9 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wbin_next_0_9 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/rbin_next_11_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wbin_next_10_10 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wbin_next_9_10 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/rempty_val }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n147_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n147_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n148_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n148_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n149_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n149_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n150_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n150_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n151_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n151_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n152_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n152_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n153_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n153_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n154_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n154_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n155_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n155_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n156_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n156_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n157_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/n157_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/rbin_next }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wbin_next }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/rbin }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/wbin }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo1/\fifo_sc_inst/DO }
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/Data
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/Clk
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/WrEn
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/RdEn
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/Reset
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/Q
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/Empty
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/Full
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/GND
add wave -noupdate -expand -label sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/Group1 -group {Region: sim:/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2} /tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/VCC
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n7_5 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n11_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wfull_val }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wfull_val_5 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wfull_val_6 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wfull_val_7 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/rbin_next_2_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/rbin_next_4_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/rbin_next_6_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/rbin_next_8_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/rbin_next_9_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wbin_next_2_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wbin_next_4_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wbin_next_6_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wbin_next_8_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wbin_next_11_6 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wfull_val_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wfull_val_9 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wfull_val_10 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wfull_val_11 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/rbin_next_6_9 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wfull_val_12 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wfull_val_13 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wfull_val_14 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wfull_val_16 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/rbin_next_0_9 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wbin_next_0_9 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/rbin_next_11_8 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wbin_next_10_10 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wbin_next_9_10 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/rempty_val }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n147_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n147_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n148_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n148_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n149_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n149_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n150_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n150_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n151_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n151_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n152_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n152_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n153_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n153_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n154_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n154_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n155_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n155_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n156_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n156_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n157_1_SUM }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/n157_3 }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/rbin_next }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wbin_next }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/rbin }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/wbin }
add wave -noupdate {/tb_cmos2sobel/inst_cmos2sobel/inst_gray2sobel/inst_fifo_sc_fifo2/\fifo_sc_inst/DO }
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {692133 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 340
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {4673120 ps}
