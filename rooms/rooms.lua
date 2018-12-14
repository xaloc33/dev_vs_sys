-- ROOM 0 - Para cargar el texto del inicio y seleccionar personaje
function room0()
	inicio = "¿Eres de Desarrollo o de Sistemas?"
	cursor = "#"
	love.graphics.setFont(font)
	love.graphics.setColor(0, 255, 0)
	love.graphics.printf(inicio, 220, 230, love.graphics.getWidth())
	love.graphics.printf(cursor, 220, 260, love.graphics.getWidth())
	love.graphics.printf(comando, 235, 260, love.graphics.getWidth())
end

function room1()
	-- Esta sala conecta por el este con la 2 y por el sur con la 5.
	room = {}
	room.id = 1
	room.name = "Archivo"
	room.norte = 0
	room.este = 1
	room.sur = 1
	room.oeste = 0

	-- Desarrollo
	if player1.tipojugador == "Developer" then
		room.descripcion = "Te encuentras en la sala de Archivo.\n\nEn las estanterias se encuentra documentación impresa de viejos proyectos. Una capa de polvo cubre cajas de disquetes y cintas.\n\nEl código de juegos ya olvidados está allí esperando que alguien algún día se digne a recuperarlo y liberarlo como software libre.\n\nHas intentado varias veces que la empresa liberase el código de esos viejos juegos. La última vez fue el año pasado pero esos perros de sistemas se metieron por medio y no pudo ser.\n\nHuele como a fiesta secreta en alguna otra habitación colindante. Fiesta a la que no te invitaron.\n\nSalidas: este y sur."
	else
	-- Sistemas
		room.descripcion = "Te encuentras en la sala de Archivo.\n\nEn las estanterias se encuentra documentación impresa de viejos proyectos. Una capa de polvo cubre cajas de disquetes y cintas. Copias de distros ya olvidadas están archivadas.\n\nUna de las estanterias tiene manuales de sistemas operativos. Existe literatura tecnica de bases de datos y licencias de software privativo de hace decadas.\n\nHuele como a fiesta secreta en alguna otra habitación colindante. Fiesta a la que no te invitaron.\n\nSalidas: este y sur."
	end

	mostrarBarraInfo()
	mostrarSalidas()
	mostrarDescripcion()
	mostrarEntradaTexto()

end


function room2()
	room = {}
	room.id = 2
	room.name = "La fiesta salvaje"
	room.norte = 0
	room.este = 1
	room.sur = 1
	room.oeste = 1

	if player1.alcohol == 1 then
		-- Desarrollo
		if player1.tipojugador == "Developer" then
			room.descripcion = "La haitacn hle a m4rijuanaa.. obre la esa centr quan bollas vaias de whky, vzka y paran. En el suel vs caloillos btante riculo yun par.. d sjeadrs.\n\nAlgen s lopasó bin trs l trajo pias. Segurte esda genta d semas qe no reetan naa n a nae. El peral de limpiezaaaa se lo paará pia limpia eta mida mñana xr la maana.\n\nUn reoj n la paed indila ra y fha.\n\nSalidas: Este, Sur y Oeste"
		else
		-- Sistemas
			room.descripcion = "La hbición hule a mahuana. Sobe la mesa cetral quan btelas vcia de whky, vzka y pachaan. Enelsulo vesss cazonclls btante ridulos y 1 par d suadore.\n\nAlgen se lo pasóooo ben tas l trabo pisas. Seamente ea gtuza d desollo q no restan nda ni a nae. El prsnal de liieza s lo pará ppa limndo esa merda mñna pr la mana.\n\nUn roj en la ped inca la hoa y fcha.\n\nSalidas: Este, Sur y Oeste"	
		end
	else
		-- Desarrollo
		if player1.tipojugador == "Developer" then
			room.descripcion = "La habitación huele a marihuana. Sobre la mesa central quedan botellas vacias de whisky, vozka y pacharan. En el suelo ves calzoncillos bastante ridiculos y un par de sujetadores.\n\nAlguien se lo pasó bien tras el trabajo piensas. Seguramente esa gentuza de sistemas que no respetan nada ni a nadie. El personal de limpieza se lo pasará pipa limpiando esta mierda mañana por la mañana.\n\nUn reloj en la pared indica la hora y fecha.\n\nSalidas: Este, Sur y Oeste"
		else
		-- Sistemas
			room.descripcion = "La habitación huele a marihuana. Sobre la mesa central quedan botellas vacias de whisky, vozka y pacharan. En el suelo ves calzoncillos bastante ridiculos y un par de sujetadores.\n\nAlguien se lo pasó bien tras el trabajo piensas. Seguramente esa gentuza de desarrollo que no respetan nada ni a nadie. El personal de limpieza se lo pasará pipa limpiando esta mierda mañana por la mañana.\n\nUn reloj en la pared indica la hora y fecha.\n\nSalidas: Este, Sur y Oeste"	
		end
	end
        mostrarBarraInfo()
        mostrarSalidas()
        mostrarDescripcion()
        mostrarEntradaTexto()

end

function room3()
	room = {}
	room.id = 3
	room.name = "Cuadro eléctrico zona norte"
	room.norte = 0
	room.este = 1
	room.sur = 1
	room.oeste = 1

	-- Desarrollo
	if player1.tipojugador == "Developer" then
		room.descripcion = "La sala es bastante pequeña y está completamente vacía.\n\nSolamente un cuadro eléctrico sin tapa se ve colgando en la pared.\n\nUn ejemplo más de como se toman la seguridad en la empresa."
	else
	-- Sistemas
		room.descripcion = "La sala es bastante pequeña y está completamente vacía.\n\nSolamente un cuadro eléctrico sin tapa se ve colgando en la pared.\n\nUn ejemplo más de como se toman la seguridad en la empresa."	
	end

	mostrarBarraInfo()
	mostrarSalidas()
	mostrarDescripcion()
	mostrarEntradaTexto()
	
end

function room4()
	room = {}
	room.id = 4
	room.name = "Baños oscuros"
	room.norte = 0
	room.este = 0
	room.sur = 1
	room.oeste = 1

	-- Desarrollo
	if player1.tipojugador == "Developer" then
		room.descripcion = "Estás en el baño. Las luces no funcionan y todo anda en penumbra absoluta.\n\nAl caminar escuchas el sonido de estar pisando agua. Puedes notar la humedad en el ambiente y al fondo de la habitación se escucha el sonido de un grifo abierto.\n\nSi esto es una broma de la gentuza de sistemas no tiene nada de gracioso.\n\nEnchufas el smartphone al enchufe justo al lado del switch de la luz para recargar a ELIZA. Pero no parece que en esta habitación el sistema electrico tenga ahora mismo energia. Lo desenchufas por tanto.\n\nSalidas: Oeste y Sur"
	else
	-- Sistemas
		room.descripcion = "Estás en el baño. Las luces no funcionan y todo anda en penumbra absoluta.\n\nAl caminar escuchas el sonido de estar pisando agua. Puedes notar la humedad en el ambiente y al fondo de la habitación se escucha el sonido de un grifo abierto.\n\nSi esto es una broma de la gentuza de desarrollo no tiene nada de gracioso.\n\nEnchufas el smartphone al enchufe justo al lado del switch de la luz para recargar a ELIZA. Pero no parece que en esta habitación el sistema electrico tenga ahora mismo energia. Lo desenchufas por tanto.\n\nSalidas: Oeste y Sur"	
	end	

	mostrarBarraInfo()
	mostrarSalidas()
	mostrarDescripcion()
	mostrarEntradaTexto()

end

function room5()
	room = {}
	room.id = 5
	room.name = "nombre room 5"
	room.norte = 1
	room.este = 1
	room.sur = 1
	room.oeste = 0

	-- Desarrollo
	if player1.tipojugador == "Developer" then
		room.descripcion = "bla bla bla bla desarrollo"
	else
	-- Sistemas
		room.descripcion = "bla bla bla bla sistemas"	
	end

	mostrarBarraInfo()
	mostrarSalidas()
	mostrarDescripcion()
	mostrarEntradaTexto()

end

function room6()
	room = {}
	room.id = 6
	room.name = "nombre room 6"
	room.norte = 1
	room.este = 1
	room.sur = 1
	room.oeste = 1

	-- Desarrollo
	if player1.tipojugador == "Developer" then
		room.descripcion = "bla bla bla bla desarrollo"
	else
	-- Sistemas
		room.descripcion = "bla bla bla bla sistemas"	
	end

	mostrarBarraInfo()
	mostrarSalidas()
	mostrarDescripcion()
	mostrarEntradaTexto()

end

function room7()
	room = {}
	room.id = 7
	room.name = "nombre room 7"
	room.norte = 1
	room.este = 1
	room.sur = 1
	room.oeste = 1

	-- Desarrollo
	if player1.tipojugador == "Developer" then
		room.descripcion = "bla bla bla bla desarrollo"
	else
	-- Sistemas
		room.descripcion = "bla bla bla bla sistemas"	
	end

	mostrarBarraInfo()
	mostrarSalidas()
	mostrarDescripcion()
	mostrarEntradaTexto()

end

function room8()
	room = {}
	room.id = 8
	room.name = "nombre room 8"
	room.norte = 1
	room.este = 0
	room.sur = 1
	room.oeste = 1

	-- Desarrollo
	if player1.tipojugador == "Developer" then
		room.descripcion = "bla bla bla bla desarrollo"
	else
	-- Sistemas
		room.descripcion = "bla bla bla bla sistemas"	
	end

	mostrarBarraInfo()
	mostrarSalidas()
	mostrarDescripcion()
	mostrarEntradaTexto()

end

function room9()
	room = {}
	room.id = 9
	room.name = "nombre room 9"
	room.norte = 1
	room.este = 1
	room.sur = 1
	room.oeste = 0

	-- Desarrollo
	if player1.tipojugador == "Developer" then
		room.descripcion = "bla bla bla bla desarrollo"
	else
	-- Sistemas
		room.descripcion = "bla bla bla bla sistemas"	
	end

	mostrarBarraInfo()
	mostrarSalidas()
	mostrarDescripcion()
	mostrarEntradaTexto()

end

function room10()
	room = {}
	room.id = 10
	room.name = "nombre room 10"
	room.norte = 1
	room.este = 1
	room.sur = 1
	room.oeste = 1

	-- Desarrollo
	if player1.tipojugador == "Developer" then
		room.descripcion = "bla bla bla bla desarrollo"
	else
	-- Sistemas
		room.descripcion = "bla bla bla bla sistemas"	
	end

	mostrarBarraInfo()
	mostrarSalidas()
	mostrarDescripcion()
	mostrarEntradaTexto()

end

function room11()
	room = {}
	room.id = 11
	room.name = "nombre room 11"
	room.norte = 1
	room.este = 1
	room.sur = 1
	room.oeste = 1
	
	-- Desarrollo
	if player1.tipojugador == "Developer" then
		room.descripcion = "bla bla bla bla desarrollo"
	else
	-- Sistemas
		room.descripcion = "bla bla bla bla sistemas"	
	end

	mostrarBarraInfo()
	mostrarSalidas()
	mostrarDescripcion()
	mostrarEntradaTexto()

end

function room12()
	room = {}
	room.id = 12
	room.name = "nombre room 12"
	room.norte = 1
	room.este = 0
	room.sur = 1
	room.oeste = 1
	
	-- Desarrollo
	if player1.tipojugador == "Developer" then
		room.descripcion = "bla bla bla bla desarrollo"
	else
	-- Sistemas
		room.descripcion = "bla bla bla bla sistemas"	
	end

	mostrarBarraInfo()
	mostrarSalidas()
	mostrarDescripcion()
	mostrarEntradaTexto()

end

function room13()
	room = {}
	room.id = 13
	room.name = "nombre room 13"
	room.norte = 1
	room.este = 1
	room.sur = 0
	room.oeste = 0
	
	-- Desarrollo
	if player1.tipojugador == "Developer" then
		room.descripcion = "bla bla bla bla desarrollo"
	else
	-- Sistemas
		room.descripcion = "bla bla bla bla sistemas"	
	end

	mostrarBarraInfo()
	mostrarSalidas()
	mostrarDescripcion()
	mostrarEntradaTexto()
	
end

function room14()
	room = {}
	room.id = 14
	room.name = "nombre room 14"
	room.norte = 1
	room.este = 1
	room.sur = 0
	room.oeste = 1

	-- Desarrollo
	if player1.tipojugador == "Developer" then
		room.descripcion = "bla bla bla bla desarrollo"
	else
	-- Sistemas
		room.descripcion = "bla bla bla bla sistemas"	
	end

	mostrarBarraInfo()
	mostrarSalidas()
	mostrarDescripcion()
	mostrarEntradaTexto()
	
end

function room15()
	room = {}
	room.id = 15
	room.name = "nombre room 15"
	room.norte = 1
	room.este = 1
	room.sur = 0
	room.oeste = 1

	-- Desarrollo
	if player1.tipojugador == "Developer" then
		room.descripcion = "bla bla bla bla desarrollo"
	else
	-- Sistemas
		room.descripcion = "bla bla bla bla sistemas"	
	end

	mostrarBarraInfo()
	mostrarSalidas()
	mostrarDescripcion()
	mostrarEntradaTexto()
	
end

function room16()
	room = {}
	room.id = 16
	room.name = "nombre room 16"
	room.norte = 1
	room.este = 0
	room.sur = 0
	room.oeste = 1

	-- Desarrollo
	if player1.tipojugador == "Developer" then
		room.descripcion = "bla bla bla bla desarrollo"
	else
	-- Sistemas
		room.descripcion = "bla bla bla bla sistemas"	
	end
	
	mostrarBarraInfo()
	mostrarSalidas()
	mostrarDescripcion()
	mostrarEntradaTexto()
end
