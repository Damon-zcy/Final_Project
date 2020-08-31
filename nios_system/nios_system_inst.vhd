	component nios_system is
		port (
			clk_clk                : in    std_logic                     := 'X';             -- clk
			keycode_export         : out   std_logic_vector(15 downto 0);                    -- export
			keycode2_export        : out   std_logic_vector(15 downto 0);                    -- export
			otg_hpi_address_export : out   std_logic_vector(1 downto 0);                     -- export
			otg_hpi_cs_export      : out   std_logic;                                        -- export
			otg_hpi_data_in_port   : in    std_logic_vector(15 downto 0) := (others => 'X'); -- in_port
			otg_hpi_data_out_port  : out   std_logic_vector(15 downto 0);                    -- out_port
			otg_hpi_r_export       : out   std_logic;                                        -- export
			otg_hpi_reset_export   : out   std_logic;                                        -- export
			otg_hpi_w_export       : out   std_logic;                                        -- export
			reset_reset_n          : in    std_logic                     := 'X';             -- reset_n
			sdram_clk_clk          : out   std_logic;                                        -- clk
			sdram_wire_addr        : out   std_logic_vector(11 downto 0);                    -- addr
			sdram_wire_ba          : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n       : out   std_logic;                                        -- cas_n
			sdram_wire_cke         : out   std_logic;                                        -- cke
			sdram_wire_cs_n        : out   std_logic;                                        -- cs_n
			sdram_wire_dq          : inout std_logic_vector(31 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm         : out   std_logic_vector(3 downto 0);                     -- dqm
			sdram_wire_ras_n       : out   std_logic;                                        -- ras_n
			sdram_wire_we_n        : out   std_logic;                                        -- we_n
			sram_DQ                : inout std_logic_vector(15 downto 0) := (others => 'X'); -- DQ
			sram_ADDR              : out   std_logic_vector(19 downto 0);                    -- ADDR
			sram_LB_N              : out   std_logic;                                        -- LB_N
			sram_UB_N              : out   std_logic;                                        -- UB_N
			sram_CE_N              : out   std_logic;                                        -- CE_N
			sram_OE_N              : out   std_logic;                                        -- OE_N
			sram_WE_N              : out   std_logic                                         -- WE_N
		);
	end component nios_system;

	u0 : component nios_system
		port map (
			clk_clk                => CONNECTED_TO_clk_clk,                --             clk.clk
			keycode_export         => CONNECTED_TO_keycode_export,         --         keycode.export
			keycode2_export        => CONNECTED_TO_keycode2_export,        --        keycode2.export
			otg_hpi_address_export => CONNECTED_TO_otg_hpi_address_export, -- otg_hpi_address.export
			otg_hpi_cs_export      => CONNECTED_TO_otg_hpi_cs_export,      --      otg_hpi_cs.export
			otg_hpi_data_in_port   => CONNECTED_TO_otg_hpi_data_in_port,   --    otg_hpi_data.in_port
			otg_hpi_data_out_port  => CONNECTED_TO_otg_hpi_data_out_port,  --                .out_port
			otg_hpi_r_export       => CONNECTED_TO_otg_hpi_r_export,       --       otg_hpi_r.export
			otg_hpi_reset_export   => CONNECTED_TO_otg_hpi_reset_export,   --   otg_hpi_reset.export
			otg_hpi_w_export       => CONNECTED_TO_otg_hpi_w_export,       --       otg_hpi_w.export
			reset_reset_n          => CONNECTED_TO_reset_reset_n,          --           reset.reset_n
			sdram_clk_clk          => CONNECTED_TO_sdram_clk_clk,          --       sdram_clk.clk
			sdram_wire_addr        => CONNECTED_TO_sdram_wire_addr,        --      sdram_wire.addr
			sdram_wire_ba          => CONNECTED_TO_sdram_wire_ba,          --                .ba
			sdram_wire_cas_n       => CONNECTED_TO_sdram_wire_cas_n,       --                .cas_n
			sdram_wire_cke         => CONNECTED_TO_sdram_wire_cke,         --                .cke
			sdram_wire_cs_n        => CONNECTED_TO_sdram_wire_cs_n,        --                .cs_n
			sdram_wire_dq          => CONNECTED_TO_sdram_wire_dq,          --                .dq
			sdram_wire_dqm         => CONNECTED_TO_sdram_wire_dqm,         --                .dqm
			sdram_wire_ras_n       => CONNECTED_TO_sdram_wire_ras_n,       --                .ras_n
			sdram_wire_we_n        => CONNECTED_TO_sdram_wire_we_n,        --                .we_n
			sram_DQ                => CONNECTED_TO_sram_DQ,                --            sram.DQ
			sram_ADDR              => CONNECTED_TO_sram_ADDR,              --                .ADDR
			sram_LB_N              => CONNECTED_TO_sram_LB_N,              --                .LB_N
			sram_UB_N              => CONNECTED_TO_sram_UB_N,              --                .UB_N
			sram_CE_N              => CONNECTED_TO_sram_CE_N,              --                .CE_N
			sram_OE_N              => CONNECTED_TO_sram_OE_N,              --                .OE_N
			sram_WE_N              => CONNECTED_TO_sram_WE_N               --                .WE_N
		);

