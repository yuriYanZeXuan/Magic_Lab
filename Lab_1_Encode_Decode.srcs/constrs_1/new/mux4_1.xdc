## this constraint file is for module mux4_1(input a, b, c, d, input[1:0] s, output y).

#### Switches
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { a }]; # sw[0]
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { b }]; # sw[1]
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { c }]; # sw[2]
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { d }]; # sw[3]

set_property -dict { PACKAGE_PIN U11   IOSTANDARD LVCMOS33 } [get_ports { s[0] }]; # sw[14]
set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { s[1] }]; # sw[15]

#### LEDs
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { y }]; # led[0]
