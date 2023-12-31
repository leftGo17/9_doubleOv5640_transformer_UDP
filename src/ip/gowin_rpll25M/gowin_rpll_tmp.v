//Copyright (C)2014-2023 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//GOWIN Version: V1.9.9 Beta-5
//Part Number: GW2AR-LV18EQ144C8/I7
//Device: GW2AR-18
//Device Version: C
//Created Time: Thu Oct 26 05:07:20 2023

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    Gowin_rPLL25M your_instance_name(
        .clkout(clkout_o), //output clkout
        .lock(lock_o), //output lock
        .clkin(clkin_i) //input clkin
    );

//--------Copy end-------------------
