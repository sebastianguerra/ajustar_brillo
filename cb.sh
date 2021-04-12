ruta=/sys/class/backlight/intel_backlight;
actual_brightness=$(cat $ruta/actual_brightness);
max_brightness=$(cat $ruta/max_brightness);
if [ $# -eq 0 ]; then
	echo $(($actual_brightness * 100 / $max_brightness));
elif [ $# -eq 1 ]; then
	if [ $1 -ge 0 ] && [ $1 -le 100 ]; then
		echo $(( $max_brightness * $1 / 100 )) > /sys/class/backlight/intel_backlight/brightness
	else
		echo Debes ingresar un valor entre 0 y 100
	fi
else 
	echo Ingresa una cantidad correcta de parametros
fi;
