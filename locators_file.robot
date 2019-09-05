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
