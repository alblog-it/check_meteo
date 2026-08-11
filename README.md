# Nagios plugin to check weather by Alberto AlBlog Leoni
# you have to install jq and, if missing, also curl

Instruction:

into config file commands.cfg

define command{
        command_name check_weather
        command_line $USER1$/check_weather.sh $ARG1$ $ARG2$
        }

into your .crg file

define service{
        use                             local-service
        host_name                       <your server here, i use my nagios server that checks it self>
        service_description             Check weather
        check_command                   check_weather!45.46!9.19
        }

