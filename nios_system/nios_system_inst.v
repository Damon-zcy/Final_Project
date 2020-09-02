	nios_system u0 (
		.clk_clk                  (<connected-to-clk_clk>),                  //             clk.clk
		.data_request_export      (<connected-to-data_request_export>),      //    data_request.export
		.keycode_export           (<connected-to-keycode_export>),           //         keycode.export
		.keycode2_export          (<connected-to-keycode2_export>),          //        keycode2.export
		.otg_hpi_address_export   (<connected-to-otg_hpi_address_export>),   // otg_hpi_address.export
		.otg_hpi_cs_export        (<connected-to-otg_hpi_cs_export>),        //      otg_hpi_cs.export
		.otg_hpi_data_in_port     (<connected-to-otg_hpi_data_in_port>),     //    otg_hpi_data.in_port
		.otg_hpi_data_out_port    (<connected-to-otg_hpi_data_out_port>),    //                .out_port
		.otg_hpi_r_export         (<connected-to-otg_hpi_r_export>),         //       otg_hpi_r.export
		.otg_hpi_reset_export     (<connected-to-otg_hpi_reset_export>),     //   otg_hpi_reset.export
		.otg_hpi_w_export         (<connected-to-otg_hpi_w_export>),         //       otg_hpi_w.export
		.reset_reset_n            (<connected-to-reset_reset_n>),            //           reset.reset_n
		.sdram_clk_clk            (<connected-to-sdram_clk_clk>),            //       sdram_clk.clk
		.sdram_wire_addr          (<connected-to-sdram_wire_addr>),          //      sdram_wire.addr
		.sdram_wire_ba            (<connected-to-sdram_wire_ba>),            //                .ba
		.sdram_wire_cas_n         (<connected-to-sdram_wire_cas_n>),         //                .cas_n
		.sdram_wire_cke           (<connected-to-sdram_wire_cke>),           //                .cke
		.sdram_wire_cs_n          (<connected-to-sdram_wire_cs_n>),          //                .cs_n
		.sdram_wire_dq            (<connected-to-sdram_wire_dq>),            //                .dq
		.sdram_wire_dqm           (<connected-to-sdram_wire_dqm>),           //                .dqm
		.sdram_wire_ras_n         (<connected-to-sdram_wire_ras_n>),         //                .ras_n
		.sdram_wire_we_n          (<connected-to-sdram_wire_we_n>),          //                .we_n
		.sram_DQ                  (<connected-to-sram_DQ>),                  //            sram.DQ
		.sram_ADDR                (<connected-to-sram_ADDR>),                //                .ADDR
		.sram_LB_N                (<connected-to-sram_LB_N>),                //                .LB_N
		.sram_UB_N                (<connected-to-sram_UB_N>),                //                .UB_N
		.sram_CE_N                (<connected-to-sram_CE_N>),                //                .CE_N
		.sram_OE_N                (<connected-to-sram_OE_N>),                //                .OE_N
		.sram_WE_N                (<connected-to-sram_WE_N>),                //                .WE_N
		.wdone_export             (<connected-to-wdone_export>),             //           wdone.export
		.write_switch_export      (<connected-to-write_switch_export>),      //    write_switch.export
		.buffer_export_new_signal (<connected-to-buffer_export_new_signal>)  //   buffer_export.new_signal
	);

