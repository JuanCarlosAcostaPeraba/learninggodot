extends DirectionalLight3D

# Script simple de día/noche - Solo rotación X y cambios de color básicos

# Variables que puedes ajustar
@export var velocidad_dia: float = 30.0  # Segundos para completar un día

# Colores
var color_blanco = Color(1.0, 1.0, 1.0)        # Blanco normal (mediodía)
var color_anaranjado = Color(1.0, 0.8, 0.6)     # Blanco-anaranjado (mañana/tarde)

# Variable interna para contar el tiempo
var tiempo_actual: float = 0.0

func _process(delta):
	# Aumentar el tiempo
	tiempo_actual += delta
	
	# Calcular el ángulo de rotación en el eje X
	# Empezar a las 12:00 (mediodía) con el sol arriba (0°)
	var progreso = fmod(tiempo_actual, velocidad_dia) / velocidad_dia  # 0.0 a 1.0
	# Desplazar el progreso para que empiece en mediodía (0.5 del ciclo)
	var progreso_ajustado = fmod(progreso + 0.5, 1.0)
	var angulo_x = 179.9 - (progreso_ajustado * 359.8)  # 179.9° a -179.9°
	rotation_degrees.x = angulo_x
	
	# Cambiar color según la posición del sol
	#if angulo_x > 60.0:  # Mediodía (sol muy alto)
		#light_color = color_blanco
	#elif angulo_x > 20.0:  # Mañana/tarde (sol medio alto)
		#light_color = color_anaranjado
	#else:  # Sol bajo (amanecer/atardecer) o noche
		#light_color = color_anaranjado
	#pass
