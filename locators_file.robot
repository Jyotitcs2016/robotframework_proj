*** Settings ***
Library           OperatingSystem
Library           Screenshot

*** Variables ***
${element2}       //*[@id="a8d4A0000008pOgQAI"]/h5/span/span/i
${account_type}    JCI Corporate General Account
@{cat3}           Air Conditioners / Split Systems    Air Handling Units (AHUs)    Coils    Gas Furnaces    Heat Pumps    Rooftop Units
@{cat4}           Aftermarket Parts    Commercial Parts    Residential Parts
${element3}       //*[@id="a8d4A0000008pOhQAI"]/h5/span/span/i
${element1}       //*[@id="a8d4A0000008pOfQAI"]/h5/span/span/i
${element4}       //*[@id="a8d4A0000008pOiQAI"]/h5/span/span/i
@{cat1}           Controls and Accessories    Indoor Units    Multi Zone    Outdoor Units/Outdoor Mini VRF    Single Zone
@{cat2}           Commercial Split System Heat Pumps    Commercial Split Systems    Packaged Heat Pumps    Packaged Rooftop Units
${URL}            https://test.salesforce.com
${outputdir}      C://Users//JPP//Documents//Testing//Robot//screenshots//
${username}       jyotiprakash.panda-ext@jci.com
${password}       Jyoti@1995
@{controls_cat}    Products_DefaultTest    Actuators    Air Flow Level Switches    Air Quality Sensors    Airflow Measuring Stations    Current Switches and Relays    Dampers
...               Empty Enclosures    Engines & Controllers    Lighting Control Panels    Power Devices    Pressure Sensors    Pressure Switches    Refrigeration Controls
...               Room Pressure Monitors    Security Devices    Standard Panels    Starters    Temperature and Humidity Sensors    Temperature Switches    Thermostats
...               Valves    Variable Speed Drives    Verasys Controls    Water Flow Sensors    Miscellaneous
${userid_uat}     jyotiprakash.panda-ext@jci.com.uat
${ch_id0}         //*[@id="a8dG0000000KylqIAC"]/h5/span/span/i
${ch_id1}         //*[@id="a8dG0000000KylsIAC"]/h5/span/span/i
${ch_id2}         //*[@id="a8dG0000000KylwIAC"]/h5/span/span/i
${ch_id3}         //*[@id="a8dG0000000KylyIAC"]/h5/span/span/i
${ch_id4}         //*[@id="a8dG0000000Kym1IAC"]/h5/span/span/i
${ch_id5}         //*[@id="a8dG0000000Kym8IAC"]/h5/span/span/i
${ch_id6}         //*[@id="a8dG0000000Kym4IAC"]/h5/span/span/i
${ch_id7}         //*[@id="a8dG0000000KyloIAC"]/h5/span/span/i
${ch_id8}         //*[@id="a8dG0000000KylnIAC"]/h5/span/span/i
@{ch_cat0}        Centrifugal Compressors    Reciprocating Compressors    Screw Compressors    Scroll Compressors
@{ch_cat1}        Angles    Ball Joints    Bearings    Casings    Castings    Collars    Couplings
...               Covers    Crankshafts    Eliminators    Filters, Oil    Flywheels    Gaskets    Gears
...               Impellars    Kits    Miscellaneous    Mufflers    Orifices    O-Rings    Pistons
...               Pumps and Parts    Rotor Assemblies    Rupture/Burst Disks    Shafts    Shims    Spacers    Springs
...               Unloader Parts    Valves    YMC2 Chiller Parts    York Semi Hermetic Screw Parts    Flywheels
@{ch_cat2}        Adhesives    Lubricants and Sealants    Oil.    Paint    Motors
@{ch_cat3}        Eductors, Oil    Oil Separators    Capillaries    Float and Float Parts    Indicators    Miscellaneous    Thermostatic Expansion Valves
...               Valves
@{ch_cat4}        Condenser Coils    Condenser Water Coils    Cooler, Oil    Cooler, Water    Evaporator Coils    Headers    Heaters
...               Miscellaneous    Steam Coils
@{ch_cat5}        Codekits    Air-Mod III Parts    Micro Panel Parts    Gauges    ISN Controls and Parts    Miscellaneous    Monitors
...               Pressure Controls    Thermometers and Temperature Control    Valves    Annunciators    Bulbs    Capacitors    Circuit Breakers
...               Coils and Solenoids    Contactors    Control Boards    Electrical Sockets    Electronic Boards    Fuses    Heaters
...               Miscellaneous    Panel Box Controls    Receptacles    Relays    Resistors    Switches    Time Delay Relays
...               Transformers    Turbo Mod Parts    Valves    Starters    Thermometers and Temperature Control    Thermostats    # Controls and Electrical
@{ch_cat6}        Belts    Filters, Air    Air Handler Cone    Bearings    Blower Wheels and Assemblies    Dampers    Fan Blades
...               Fan Guards    Grilles    Miscellaneous    Refrigeration Parts    Shafts, Wheels and Assemblies
@{ch_cat7}        Adaptors, Fittings, Connections    Bolts    Caps and Sealing Flares    Clamps    Clips    Flanges    Hardware, Locks, Hinges, and Handles
...               Insulation    Miscellaneous    New Items    Pumps and Parts    Screws    Consumable-Spares    Bushings
...               External Equalizer Lines    Miscellaneous    Nuts, Washers    Couplings    Isolators    Miscellaneous    Piping
...               Panels and Brackets    Residential Parts    Pumps and Parts    Tools    # Hardware
@{ch_cat8}        Miscellaneous    Refrigeration Storage and Recycling Parts    Speed Increaser Parts    Backup Batteries    Fabricated Parts    Instructions    Labels
...               NamePlates    PM Kits    # General
${locator_plp_upg}    xpath://div[@class="panel-body cc_body"]/h4
${browser}        gc
