# Nagios plugin by Alberto AlBlog Leoni
# you have to install jq and, if missing, also curl

Instruction:

into config file commands.cfg

define command{
        command_name check_meteo
        command_line $USER1$/check_meteo.sh $ARG1$ $ARG2$
        }

into your .crg file

define service{
        use                             local-service
        host_name                       <your server here, i use my nagios server that checks it self>
        service_description             Check meteo
        check_command                   check_meteo!45.46!9.19
        }

