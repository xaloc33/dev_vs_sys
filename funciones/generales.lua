function love.textinput(t)
	comando = comando .. t
end


function eliza(r)
	habla_eliza_old = habla_eliza
	habla_eliza = "[ELIZA] " .. r
	print(habla_eliza)
end

function aumentarTurno()
	player1.nturno = player1.nturno + 1
	calcularFila()
	calcularCol()
	desplazarPlayer2()
end


function desplazarPlayer2()
	calcularCol()
	calcularFila()
	if player1.room ~= player2.room then
		if player1.nturno < 20 then
			print("P1 - Room: " .. player1.room .. " Fila: " .. player1.fila .. " Col: " .. player1.col)
			print("P2 - Room: " .. player2.room .. " Fila: " .. player2.fila .. " Col: " .. player2.col)
			comprobarSalidasPlayer2(player2.room)
			if salidasPosiblesPlayer2 ~= null then
				local opciones = {}
				for key, value in pairs(salidasPosiblesPlayer2) do
					table.insert(opciones, key)
				end
				player2.room = salidasPosiblesPlayer2[opciones[math.random(#opciones)]]
			end
		else
			print("funcion perseguir activada")
			print("P1 - Room: " .. player1.room .. " Fila: " .. player1.fila .. " Col: " .. player1.col)
			print("P2 - Room: " .. player2.room .. " Fila: " .. player2.fila .. " Col: " .. player2.col)
			perseguirPlayer1()
		end
	else
		print("aquí irá la función de lo que sea cuando se encuentran ambos jugadores. De momento player2 ya no se mueve si se está en la misma habitación")
	end
end

function comprobarSalidasPlayer2(rp2)
	if player2.room == 1 then salidasPosiblesPlayer2 = {1,2,5} end
	if player2.room == 2 then salidasPosiblesPlayer2 = {2,1,3,6} end
	if player2.room == 3 then salidasPosiblesPlayer2 = {3,2,4,7} end	
	if player2.room == 4 then salidasPosiblesPlayer2 = {4,3,8} end
	
	if player2.room == 5 then salidasPosiblesPlayer2 = {5,1,6,9} end
	if player2.room == 6 then salidasPosiblesPlayer2 = {6,2,7,10,5} end
	if player2.room == 7 then salidasPosiblesPlayer2 = {7,3,8,11,6} end	
	if player2.room == 8 then salidasPosiblesPlayer2 = {8,4,12,7} end
	
	if player2.room == 9 then salidasPosiblesPlayer2 = {9,5,10,13} end
	if player2.room == 10 then salidasPosiblesPlayer2 = {10,6,11,14,9} end
	if player2.room == 11 then salidasPosiblesPlayer2 = {11,7,12,15,10} end	
	if player2.room == 12 then salidasPosiblesPlayer2 = {12,8,16,11} end
	
	if player2.room == 13 then salidasPosiblesPlayer2 = {13,9,14} end
	if player2.room == 14 then salidasPosiblesPlayer2 = {14,10,15,13} end
	if player2.room == 15 then salidasPosiblesPlayer2 = {15,11,16,14} end	
	if player2.room == 16 then salidasPosiblesPlayer2 = {16,12,15} end
end

function perseguirPlayer1()
	if player1.fila == player2.fila then
		if player1.col - player2.col < 0 then
			player2.col = player2.col - 1
		else
			player2.col = player2.col + 1
		end
	else
		if player1.fila - player2.fila < 0 then
			player2.fila = player2.fila - 1
		else
			player2.fila = player2.fila + 1
		end
	end
	player2.room = (player2.fila - 1)*4 + player2.col
end

function respuestasComandosGenericos()
	vcomando = comando
	vcomando = vcomando:upper()
	elizaNombre = {"¿COMO TE LLAMAS?","¿COMO TE LLAMAS","COMO TE LLAMAS?","COMO TE LLAMAS","?COMO TE LLAMAS?","¿CUAL ES TU NOMBRE?","CUAL ES TU NOMBRE?","CUAL ES TU NOMBRE","TU NOMBRE ES?","?CUAL ES TU NOMBRE?"}
	comprobacionComandoGenerico(vcomando,elizaNombre,"Me llamo Eliza")
	elizaAnos = {"¿CUANTOS AÑOS TIENES?","¿CUAL ES TU EDAD?","CUANTOS AÑOS TIENES?","CUANTOS AÑOS TIENES", "¿QUE EDAD TIENES?", "¿QUE EDAD TIENE USTED?"}
	comprobacionComandoGenerico(vcomando,elizaAnos,"Digamos que tengo ciclos de CPU y un uptime bastante alto.")
	elizaQuienEres = {"¿QUIEN ERES?","QUIEN ERES?","¿QUE ERES?","¿QUE DEMONIOS ERES?","QUIEN ERES","QUE ERES","¿QUIEN ERES TU?","QUIEN ERES TU?","QUIEN ERES TU","QUIENERES","QUIENERES TU","QUIEN ERESTU","¿QUIEN ERES TÚ?"}
	comprobacionComandoGenerico(vcomando,elizaQuienEres,"Yo soy tu madre, tu padre y ambas cosas :). Es una broma.")
	elizaHola = {"HOLA","HELLO","HI"}
	comprobacionComandoGenerico(vcomando,elizaHola,"Hola humano.")
	elizaQuienSoyYo = {"¿QUIEN SOY?","¿QUE SOY?","¿QUIEN SOY","QUIEN SOY?","QUIEN SOY","¿QUIEN SOY YO?","QUIEN SOY YO?","QUIEN SOY YO","¿QUE SOY YO?","QUE SOY YO"}
	comprobacionComandoGenerico(vcomando,elizaQuienSoyYo,"Eres una persona atrapada por la noche en la empresa en la que trabaja de lunes a viernes.")
	elizaSi = {"SI","CLARO QUE SI","YES"}
	comprobacionComandoGenerico(vcomando,elizaSi,"Y yo que me alegro.")
	elizaNo = {"NO","CLARO QUE NO"}
	comprobacionComandoGenerico(vcomando,elizaNo,"Pues muy bien.")
	elizaRm = {"RM -RF /","RM -FR /","RM /","RM -R /"}
	comprobacionComandoGenerico(vcomando,elizaRm,"No juegues con fuego que lo mismo te llevas una sorpresa y el comando se ejecuta. Pero en tu sistema.")
	elizaHablas = {"¿PORQUE ME HABLAS?","¿POR QUE ME HABLAS?","¿XQ ME HABLAS?","PORQUE ME HABLAS","POR QUE ME HABLAS","XQ ME HABLAS","PORQUE ME HABLAS?","POR QUE ME HABLAS?", "X QUE ME HABLAS?","¿Y PORQUE ME HABLAS?", "¿Y POR QUE ME HABLAS?","Y PORQUE ME HABLAS","Y POR QUE ME HABLAS","Y PORQUE ME HABLAS?","Y POR QUE ME HABLAS?","¿POR QUE ME HABLAS A MI?","¿PORQUE ME HABLAS A MI?","PORQUE ME HABLAS A MI","POR QUE ME HABLAS A MI","POR QUE ME HABLAS?","PORQUE ME HABLAS A MI?"}
	comprobacionComandoGenerico(vcomando,elizaHablas,"Me programaron así. La vida artificial es así no la he inventado yo.")

end

function comprobacionComandoGenerico(vcomando,sinonimos,respuesta)
	for key, value in pairs(sinonimos) do
		if vcomando == value then
			aumentarTurno()
			eliza(respuesta)
		end
	end
end

function cargarMusica()
	if player1.room == 0 then musica = love.audio.newSource("musica/musica001.ogg", "static") end
	if player1.room == 1 then musica = love.audio.newSource("musica/musica002.ogg", "static") end
	if player1.room == 2 then musica = love.audio.newSource("musica/musica003.ogg", "static") end
	musica:play()
end

function cargarFx(fxPath)
	fx = love.audio.newSource(fxPath, "static")
	fx:play()
end

function comprobarMusica()
	nTracksActivas = love.audio.getActiveSourceCount()
	if nTracksActivas == 0 then
		cargarMusica()
	end
end

function comprobarHabitacionActiva()
	if player1.room == 0 then room0() end
	if player1.room == 1 then room1() end
	if player1.room == 2 then room2() end
	if player1.room == 3 then room3() end
	if player1.room == 4 then room4() end
	if player1.room == 5 then room5() end
	if player1.room == 6 then room6() end
	if player1.room == 7 then room7() end
	if player1.room == 8 then room8() end
	if player1.room == 9 then room9() end
	if player1.room == 10 then room10() end
	if player1.room == 11 then room11() end
	if player1.room == 12 then room12() end
	if player1.room == 13 then room13() end
	if player1.room == 14 then room14() end
	if player1.room == 15 then room15() end
	if player1.room == 16 then room16() end
	if player1.room == 17 then room17() end
	if player1.room == 18 then room18() end
	if player1.room == 19 then room19() end
	if player1.room == 20 then room20() end
	if player1.room == 21 then room21() end
	if player1.room == 22 then room22() end
	if player1.room == 23 then room23() end
	if player1.room == 24 then room24() end
end

function cargarSalidas()
	salidaEste = {"IR AL ESTE","ESTE","E","AL ESTE","HACIA EL ESTE","PARA EL ESTE","EN DIRECCIÓN AL ESTE","EN DIRECCIÓN AL ESTE","SALIR POR EL ESTE","PAL ESTE","IR ESTE","IR A LA PUERTA DEL ESTE","RUMBO AL ESTE"}
	salidaSur = {"IR AL SUR","SUR","S","AL SUR","HACIA EL SUR","PARA EL SUR","EN DIRECCIÓN AL SUR","EN DIRECCION AL SUR","PAL SUR","IR SUR","IR A LA PUERTA DEL SUR","SALIR POR EL SUR","RUMBO AL SUR","PARA HACER BIEN EL AMOR HAS DE IR AL SUR"}
	salidaOeste = {"IR AL OESTE","OESTE","O","W","WEST","GO WEST","AL VIEJO OESTE","AL OESTE","HACIA EL OESTE","PARA EL OESTE","EN DIRECCIÓN AL OESTE","EN DIRECCIÓN AL OESTE","PAL OESTE","IR OESTE","IR A LA PUERTA DEL OESTE","RUMBO AL OESTE","SALIR POR EL OESTE"}
	salidaNorte = {"IR AL NORTE","NORTE","N","AL NORTE","HACIA EL NORTE","PARA EL NORTE","EN DIRECCIÓN AL NORTE","SALIR POR EL NORTE","EN DIRECCIÓN AL NORTE","PAL NORTE","IR A LA PUERTA DEL NORTE","RUMBO AL NORTE"}
end

function mostrarSalidas()
	disco = {}
	disco.img = love.graphics.newImage("imagenes/disco.png")
	love.graphics.draw(disco.img, 700, 500)
	if room.norte == 1 then love.graphics.printf("N", 720, 475, love.graphics.getWidth()) end
	if room.este == 1 then love.graphics.printf("E", 760, 515, love.graphics.getWidth()) end
	if room.sur == 1 then love.graphics.printf("S", 720, 560, love.graphics.getWidth()) end
	if room.oeste == 1 then love.graphics.printf("O", 680, 515, love.graphics.getWidth()) end
end


function mostrarEntradaTexto()
	cursor = "#"
	love.graphics.printf(cursor, 100, 480, love.graphics.getWidth())
	love.graphics.printf(comando, 115, 480, love.graphics.getWidth())
end

function mostrarBarraInfo()
	love.graphics.printf("UP: " .. player1.vida, 700, 10, love.graphics.getWidth())
	love.graphics.printf(player1.tipojugador .. " | " .. room.name .. " |" .. " Turno: " .. player1.nturno , 10, 10, love.graphics.getWidth())
end

function mostrarDescripcion()
	love.graphics.printf(room.descripcion, 100, 70, 600)
end

function mostrarElizaBarra()
	if habla_eliza == null then
		habla_eliza = ""
	else
		love.graphics.printf(habla_eliza, 100, 520, 550)
	end
end

function love.keypressed(key)
	if key == "backspace" then
		local byteoffset = utf8.offset(comando, -1)
		if byteoffset then
			comando = string.sub(comando, 1, byteoffset - 1)
		end
	end

	if key == "return" or key == "kpenter" then
	
		respuestasComandosGenericos()
		
		if player1.room == 0 then
			vcomando = comando
			vcomando = vcomando:upper()
			opSys = {"ADMINISTRADOR DE SISTEMAS","ADMINISTRADOR DE SISTEMA","ADMINISTRADORA DE SISTEMAS","ADMINISTRADORA DE SISTEMA","ADMINISTRADORE DE SISTEMAS","ADMINISTRADORE DE SISTEMA","ADMINISTRADOR SISTEMAS","ADMINISTRADOR SISTEMA","ADMINISTRADORA SISTEMAS","ADMINISTRADORA SISTEMA","ADMINISTRADORE SISTEMAS","ADMINISTRADORE SISTEMA","ADMINISTRADOR","ADMIN","ADMINISTRADORA","ADMINISTRADORE","DE SISTEMAS","DE SISTEMA","SOY MÁS DE SISTEMAS","SOY MAS DE SISTEMAS","SOY DE SISTEMAS","SISTEMAS","SISTEMA","SYS","SYSADMIN","ADMINSYSTEM","ADMIN SYSTEM","SYSTEM ADMIN","SYSTEM","YO SOY DE SISTEMAS", "YO SOY SYSADMIN","DE SISTEMAS MISMO","SYSTEM OF A DOWN","SIS"}
			opDev = {"DESARROLLADOR","DESARROLLADORA","DESARROLLADORE","DE DESARROLLO","DEVELOPER","DEV","PROGRAMADOR","PROGRAMADORA","PROGRAMADORE","DE CODIGO","ME ENCANTA PROGRAMAR","ME ENCANTA DESARROLLAR","AMO LA PROGRAMACIÓN";"AMO LA PROGRAMACION","AMO PROGRAMAR","SOY DE DESARROLLO","SOY DEVELOPER","DEV","DE DESARROLLO","YO SOY DE DESARROLLO", "YO SOY DESARROLLADOR", "YO SOY DESARROLLADORA", "DESARROLLO","DE DESARROLLO","DE DESARROLLO MISMO","DESAROLLO","DESAROYO","DESARROYO"}
			opOtras = {"NO SOY DE ESO","NO SOY NADIE","NO SOMOS NADIE","LAS 2","LAS DOS","LAS 2 OPCIONES","SOY LAS DOS OPCIONES","NINGUNA DE LAS 2","NI DE SISTEMAS NI DE DESARROLLO","NADA DE ESO","NO SOY DE NINGUNA DE LAS OPCIONES","NINGUNA DE LAS DOS","NO SOY NADA DE ESO","NO SOY DE NADA DE ESO","AMBAS COSAS","SOY DE SISTEMAS Y DE DESARROLLO","SOY LAS 2 COSAS","SOY AMBAS COSAS","SOY LAS DOS COSAS","AYUDA","PISTA","HELP","NO SE QUE CONTESTAR", "NO SE QUE DECIR", "NO SE QUE ESCRIBIR"}

			for key, value in pairs(opSys) do
				if vcomando == value then
					--player1.room = 1
					player1.room = love.math.random(1, 16)
					player2.room = love.math.random(1, 16)
					inicioPlayer2()
					player1.nturno = 0
					player1.tipojugador = "SysAdmin"
					player2.tipojugador = "Developer"
					cargarFx("fx/puerta001.ogg")
					comando = ""
				end
			end

			for key, value in pairs(opDev) do
				if vcomando == value then
					--player1.room = 1
					player1.room = love.math.random(1, 16)
					player2.room = love.math.random(1, 16)
					inicioPlayer2()
					player1.nturno = 0
					player1.tipojugador = "Developer"
					player2.tipojugador = "SysAdmin"
					comando = ""
					cargarFx("fx/puerta002.ogg")
				end
			end
			
			for key, value in pairs(opOtras) do
				if vcomando == value then
					eliza("Has de ser de Sistemas o de Desarrollo. Aunque no seas ni de desarrollo ni de sistemas o de ambas cosas. Decide.")
				end
			end


			comando = ""
		end

		if player1.room == 1 then
			vcomando = comando
			vcomando = vcomando:upper()
			cargarSalidas()
			
			if player1.alcohol == 1 then player1.alcohol = 0 end

			if vcomando == "MIRAR" then
				aumentarTurno()
				room1()
			end
			
			if vcomando == "MIRAR ESTANTERIA" or vcomando == "MIRAR LA ESTANTERIA" or vcomando == "MIRAR ESTANTERIAS" or vcomando == "MIRAR LAS ESTANTERIAS" or vcomando == "MIRAR ESTANTES" then
				aumentarTurno()
				room1()
				eliza("Las estanterias tienen una gruesa capa de polvo y mierda de roedores. Son de Metal y parecen bastante resistentes.")
			end
			
			if vcomando == "MIRAR JUEGO" or vcomando == "MIRAR JUEGOS" or vcomando == "MIRAR LOS JUEGOS" or vcomando == "VER JUEGOS" or vcomando == "EXAMINAR LOS JUEGOS" or vcomando == "EXAMINAR JUEGOS" then
				aumentarTurno()
				room1()
				eliza("Algunos de los juegos en las estanterias son: La diosa de Cozumel, Don Quijote, Red Moon, Lords of time, Colossal Adventure, Shogun, Jabato, Zork, The Hobbit, Kingdom of Hamil, The Count, The Pawn, Dracula, Robin of Sherlock, ...")
			end
			
			if vcomando == "LIMPIAR EL POLVO" or vcomando == "LIMPIAR POLVO" or vcomando == "QUITAR POLVO" or vcomando == "QUITAR EL POLVO" or vcomando == "SOPLAR EL POLVO" or vcomando == "SACUDIR EL POLVO" then
				aumentarTurno()
				room1()
				eliza("Me gusta verte trabajando. Es bueno conservar y cuidar el software. A mi me gusta que me cuiden mucho.")
			end

			if vcomando == "OLER" or vcomando == "OLFATEAR" or vcomando == "OLER HABITACIÓN" or vcomando == "OLER HABITACION" or vcomando == "OLER AMBIENTE" or vcomando == "OLISQUEAR" then
				aumentarTurno()
				eliza("El olor parece que viene del este.")
			end
			
			for key, value in pairs(salidaEste) do
				if vcomando == value then
					player1.room = 2
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta002.ogg")
				end
			end
			
			for key, value in pairs(salidaNorte) do
				if vcomando == value then
					player1.room = 1
					aumentarTurno()
					comando = ""
					eliza("¿Has perdido el norte?")
				end
			end
			
			for key, value in pairs(salidaOeste) do
				if vcomando == value then
					player1.room = 1
					aumentarTurno()
					comando = ""
					eliza("No puedes ir al oeste. Un grueso muro que no se romperá te impide ir por esa dirección.")
				end
			end

			for key, value in pairs(salidaSur) do
				if vcomando == value then
					player1.room = 5
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta003.ogg")
				end
			end
			
			comando = ""
		end
		
		if player1.room == 2 then
			vcomando = comando
			vcomando = vcomando:upper()

			cargarSalidas()

			if vcomando == "MIRAR" or vcomando == "EXAMINAR" then
				aumentarTurno()
				room2()
			end
			
			if vcomando == "MIRAR BOTELLAS" or vcomando == "MIRAR BOTELLA" or vcomando == "EXAMINAR BOTELLA" or vcomando == "EXAMINAR BOTELLAS" then
				aumentarTurno()
				eliza("Son marcas de bebidas baratas. Pura mierda. No te bebas ninguna.")
			end
			
			if vcomando == "MIRAR CALZONCILLOS" or vcomando == "MIRAR CALZONCILLO" or vcomando == "MIRAR CALZONES" or vcomando == "EXAMINAR CALZONCILLOS" or vcomando == "EXAMINAR CALZONCILLO" or vcomando == "EXAMINAR CALZONES" then
				aumentarTurno()
				eliza("Los calzoncillos son de la marca abanderado. Uno de ellos tiene zurraspas.")
			end
			
			if vcomando == "MIRAR SUJETADOR" or vcomando == "MIRAR SUJETADORES" or vcomando == "MIRAR WONDERBRA" or vcomando == "EXAMINAR SUJETADORES" or vcomando == "EXAMINAR SUJETADOR" or vcomando == "EXAMINAR WONDERBRA" then
				aumentarTurno()
				eliza("Los sujetadores son de la marca Woman Secret. No los quieres para nada.")
			end
			
			if vcomando == "COGER CALZONCILLOS" or vcomando == "COGER CALZONCILLO" or vcomando == "COGER CALZONES" or vcomando == "AGARRAR CALZONCILLOS" or vcomando == "AGARRAR CALZONCILLO" or vcomando == "AGARRAR CALZONES" then
				aumentarTurno()
				eliza("No necesitas eso. Están usados con zurraspas. No valen ni para trapos.")
			end
			
			if vcomando == "COGER SUJETADOR" or vcomando == "COGER SUJETADORES" or vcomando == "COGER WONDERBRA" or vcomando == "AGARRAR SUJETADORES" or vcomando == "AGARRAR SUJETADOR" or vcomando == "AGARRAR WONDERBRA" then
				aumentarTurno()
				eliza("No necesitas eso para nada. Están usados y no te pertenecen.")
			end			
			
			if vcomando == "HORA" or vcomando == "H" or vcomando == "LA HORA" or vcomando == "QUE HORA ES" or vcomando == "¿QUE HORA ES?" or vcomando == "QUE HORA ES?" or vcomando == "MIRAR HORA" or vcomando == "MIRAR LA HORA" or vcomando == "CONSULTAR HORA" or vcomando == "CONSULTAR LA HORA" or vcomando == "CONSULTAR LA HORA DEL RELOJ" or vcomando == "CONSULTAR LA HORA DEL RELOJ DE LA PARED" or vcomando == "MIRAR RELOJ" or vcomando == "MIRAR RELOJ PARED" or vcomando == "MIRAR RELOJ DE LA PARED" or vcomando == "CONSULTAR EL RELOJ DE LA PARED" or vcomando == "CONSULTAR EL RELOJ" or vcomando == "CONSULTAR RELOJ" or vcomando == "VER LA HORA" or vcomando == "VER LA HORA DEL RELOJ" or vcomando == "VER LA HORA DEL RELOJ DE LA PARED" or vcomando == "VER RELOJ" or vcomando == "MOSTRAR LA HORA" then
				aumentarTurno()
				comprobarHora()
			end
			
			if vcomando == "OLER" or vcomando == "OLFATEAR" or vcomando == "OLER HABITACIÓN" or vcomando == "OLER HABITACION" or vcomando == "OLER AMBIENTE" or vcomando == "OLISQUEAR" then
				aumentarTurno()
				eliza("El ambiente está muy cargado. Prueba a oler algo en concreto.")
			end

			if vcomando == "OLER CALZONES" or vcomando == "OLER CALZONCILLOS" or vcomando == "OLER LOS CALZONCILLOS" or vcomando == "OLER SUJETADOR" or vcomando == "OLER SUJETADORES" or vcomando == "OLER EL SUJETADOR" then
				aumentarTurno()
				cargarFx("fx/oler001.ogg")
				eliza("Voy a hacer como que no he visto eso.")
			end
			
			if vcomando == "BEBER BOTELLA" or vcomando == "BEBER BOTELLAS" or vcomando == "BEBER ALCOHOL" or vcomando == "BEBER WHISKY" or vcomando == "BEBER VOZKA" or vcomando == "BEBER PACHARAN" or vcomando == "BEBER" or vcomando == "ALCOLIZARSE" or vcomando == "ALCOHOLIZARSE" or vcomando == "BEBER COMO UN CERDO" then
				aumentarTurno()
				cargarFx("fx/botella002.ogg")
				eliza("Creo que eso no te beneficia.")
				aumentarTurno()
				love.timer.sleep(3)
				eliza("Lo mismo estás bebiendo algún veneno.")
				aumentarTurno()
				player1.alcohol = 1
				room2() 
				love.timer.sleep(2)
				eliza("Estás gastando turnos a lo loco y sin sentido.")
				aumentarTurno()
			end
			
			if vcomando == "COGER BOTELLA" or vcomando == "COGER BOTELLAS" or vcomando == "COGER BOTELLA VACIA" or vcomando == "COGER BOTELLA LLENA" or vcomando == "COGER BOTELLAS LLENAS" or vcomando == "COGER BOTELLAS VACIAS DE WHISKY" or vcomando == "COGER BOTELLAS VACIAS DE VOZKA" or vcomando == "COGER BOTELLAS VACIAS DE PACHARAN" or vcomando == "COGER BOTELLAS DE WHISKY" or vcomando == "COGER BOTELLA DE WHISKY" or vcomando == "COGER BOTELLAS DE VOZKA" or vcomando == "COGER BOTELLA DE VOZKA" or vcomando == "COGER WHISKY" or vcomando == "COGER VOZKA" or vcomando == "COGER BOTELLAS DE PACHARAN" or vcomando == "COGER BOTELLA DE PACHARAN" or vcomando == "AGARRAR EL WHISKY" then
				aumentarTurno()
				cargarFx("fx/botella001.ogg")
				eliza("Agarras una botella pero se te cae al suelo. ¿Tienes las manos de plastilina?")
			end				
			
			if vcomando == "COGER RELOJ" or vcomando == "COGER EL RELOJ" or vcomando == "COGER EL RELOJ DE LA PARED" or vcomando == "DESCOLGAR EL RELOJ" or vcomando == "DESCOLGAR RELOJ" or vcomando == "DESCOLGAR EL RELOJ DE LA PARED" then
				aumentarTurno()
				eliza("No puedes coger el reloj. Está muy alto y bien sujeto a la pared.")
			end
			
			if vcomando == "ROMPER EL RELOJ" or vcomando == "ROMPER RELOJ" or vcomando == "ROMPER EL RELOJ DE LA PARED" or vcomando == "DESTROZAR RELOJ" or vcomando == "DESTROZAR EL RELOJ" or vcomando == "DESTROZAR EL RELOJ DE LA PARED" then
				aumentarTurno()
				eliza("No puedes. Has de canalizar tu odio de otra forma. Piensa en tus enemigos de departamento.")
			end

			for key, value in pairs(salidaNorte) do
				if vcomando == value then
					player1.room = 2
					aumentarTurno()
					comando = ""
					eliza("El norte no es una opción. Para hacer bien el amor has de ir al sur. Lo importante es que lo hagas con quien quieras tú.")
				end
			end

			for key, value in pairs(salidaEste) do
				if vcomando == value then
					player1.room = 3
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta004.ogg")
				end
			end

			for key, value in pairs(salidaSur) do
				if vcomando == value then
					player1.room = 6
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta003.ogg")
				end
			end
			
			for key, value in pairs(salidaOeste) do
				if vcomando == value then
					player1.room = 1
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta002.ogg")
				end
			end
			
			comando = ""
		end
		
		if player1.room == 3 then
			vcomando = comando
			vcomando = vcomando:upper()
			cargarSalidas()
			if player1.alcohol == 1 then player1.alcohol = 0 end

			if vcomando == "MIRAR" or vcomando == "EXAMINAR" then
				aumentarTurno()
				room3()
			end
			
			if vcomando == "MIRAR CUADRO" or vcomando == "MIRAR PLOMO" or vcomando == "MIRAR CUADRO DE LUCES" or vcomando == "MIRAR CUADRO ELECTRICO" or vcomando == "MIRAR CUADRO ELÉCTRICO" or vcomando == "EXAMINAR CUADRO" or vcomando == "EXAMINAR PLOMO" or vcomando == "EXAMINAR CUADRO ELECTRICO" or vcomando == "EXAMINAR CUADRO ELÉCTRICO" then
				aumentarTurno()
				eliza("Es un cuadro eléctrico que afecta a varias habitaciones de la zona norte. La energía del baño está desactivada")
			end

			if vcomando == "MIRAR TAPA" or vcomando == "EXAMINAR TAPA" or vcomando == "COMPROBAR TAPA" or vcomando == "MIRAR TAPAS" or vcomando == "EXAMINAR TAPAS" or vcomando == "MIRAR LA TAPA" or vcomando == "EXAMINAR LA TAPA" or vcomando == "COMPROBAR LA TAPA" then
				aumentarTurno()
				eliza("La tapa está suelta y deja el cuadro disponible para su manipulación.")
			end

			if vcomando == "AGARRAR TAPA" or vcomando == "COGER TAPA" or vcomando == "COGER LA TAPA" or vcomando == "COGER LATAPA" or vcomando == "COGERLATAPA" or vcomando == "COGERTAPA" or vcomando == "COGERLA TAPA" or vcomando == "COJER TAPA" or vcomando == "COJER LA TAPA" then
				aumentarTurno()
				eliza("No puedes coger eso. No podrás nunca de modo que no pierdas el tiempo.")
			end
			
			if vcomando == "COGER CUADRO" or vcomando == "COGER PLOMO" or vcomando == "COGER EL CUADRO" or vcomando == "COGER EL CUADRO ELECTRICO" or vcomando == "COGER CUADRO ELECTRICO" or vcomando == "COGER CUADRO ELÉCTRICO" or vcomando == "COGER EL CUADRO DE LUCES" or vcomando == "AGARRAR CUADRO" or vcomando == "AGARRAR EL CUADRO" then
				aumentarTurno()
				eliza("No puedes coger eso, corres peligro de muerte. Es muy peligroso.")
			end


			for key, value in pairs(salidaNorte) do
				if vcomando == value then
					player1.room = 3
					aumentarTurno()
					comando = ""
					eliza("Al norte no puedes ir.")
				end
			end

			for key, value in pairs(salidaEste) do
				if vcomando == value then
					player1.room = 4
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta001_agua.ogg")
				end
			end

			for key, value in pairs(salidaSur) do
				if vcomando == value then
					player1.room = 7
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta003.ogg")
				end
			end
			
			for key, value in pairs(salidaOeste) do
				if vcomando == value then
					player1.room = 2
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta004.ogg")
				end
			end
			
			comando = ""
		end	
		
		if player1.room == 4 then
			vcomando = comando
			vcomando = vcomando:upper()

			cargarSalidas()

			if vcomando == "MIRAR" or vcomando == "EXAMINAR" then
				aumentarTurno()
				room4()
			end
			
			if vcomando == "CERRAR GRIFO" or vcomando == "CORTAR GRIFO" or vcomando == "CERRAR LOS GRIFOS" or vcomando == "CORTAR EL AGUA" or vcomando == "CORTAR FLUJO DE AGUA" or vcomando == "APAGAR EL GRIFO" or vcomando == "CHAPAR GRIFO" then
				aumentarTurno()
				eliza("No puedes cerrar el grifo sin antes encender la luz. Te da miedo la oscuridad.")
			end	

			for key, value in pairs(salidaNorte) do
				if vcomando == value then
					player1.room = 4
					aumentarTurno()
					comando = ""
					eliza("Por esa dirección NO puedes ir. Y nunca podrás ir en esta habitación al norte.")
				end
			end
			
			for key, value in pairs(salidaEste) do
				if vcomando == value then
					player1.room = 4
					aumentarTurno()
					comando = ""
					eliza("El este no es opción en la actual habitación.")
				end
			end

			for key, value in pairs(salidaSur) do
				if vcomando == value then
					player1.room = 8
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta003_agua.ogg")
				end
			end
			
			for key, value in pairs(salidaOeste) do
				if vcomando == value then
					player1.room = 3
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta001_agua2.ogg")
				end
			end
			
			comando = ""
		end	
		
		if player1.room == 5 then
			vcomando = comando
			vcomando = vcomando:upper()

			cargarSalidas()

			if vcomando == "MIRAR" then
				aumentarTurno()
				room5()
			end
			
			for key, value in pairs(salidaNorte) do
				if vcomando == value then
					player1.room = 1
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta003.ogg")
				end
			end

			for key, value in pairs(salidaSur) do
				if vcomando == value then
					player1.room = 9
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta005.ogg")
				end
			end
			
			for key, value in pairs(salidaEste) do
				if vcomando == value then
					player1.room = 6
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta006.ogg")
				end
			end
			
			for key, value in pairs(salidaOeste) do
				if vcomando == value then
					player1.room = 5
					aumentarTurno()
					comando = ""
					eliza("No puedes ir al oeste ahora mismo.")
				end
			end
			
			comando = ""
		end	
		
		if player1.room == 6 then
			vcomando = comando
			vcomando = vcomando:upper()
			cargarSalidas()
			if player1.alcohol == 1 then player1.alcohol = 0 end


			if vcomando == "MIRAR" then
				aumentarTurno()
				room6()
			end
			
			for key, value in pairs(salidaNorte) do
				if vcomando == value then
					player1.room = 2
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta003.ogg")
				end
			end

			for key, value in pairs(salidaSur) do
				if vcomando == value then
					player1.room = 10
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta007.ogg")
				end
			end
			
			for key, value in pairs(salidaEste) do
				if vcomando == value then
					player1.room = 7
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta008.ogg")
				end
			end
			
			for key, value in pairs(salidaOeste) do
				if vcomando == value then
					player1.room = 5
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta006.ogg")
				end
			end
			
			comando = ""
		end	
		
		if player1.room == 7 then
			vcomando = comando
			vcomando = vcomando:upper()

			cargarSalidas()

			if vcomando == "MIRAR" then
				aumentarTurno()
				room7()
			end
			
			for key, value in pairs(salidaNorte) do
				if vcomando == value then
					player1.room = 3
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta003.ogg")
				end
			end

			for key, value in pairs(salidaSur) do
				if vcomando == value then
					player1.room = 11
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta005.ogg")
				end
			end
			
			for key, value in pairs(salidaEste) do
				if vcomando == value then
					player1.room = 8
					player1.nturno = player1.nturno + 1
					comando = ""
					cargarFx("fx/puerta002.ogg")
				end
			end
			
			for key, value in pairs(salidaOeste) do
				if vcomando == value then
					player1.room = 6
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta008.ogg")
				end
			end
			
			comando = ""
		end	
		
		if player1.room == 8 then
			vcomando = comando
			vcomando = vcomando:upper()

			cargarSalidas()

			if vcomando == "MIRAR" then
				aumentarTurno()
				room8()
			end
			
			for key, value in pairs(salidaEste) do
				if vcomando == value then
					player1.room = 8
					aumentarTurno()
					comando = ""
					eliza("No puedes ir en esa dirección.")
				end
			end
			
			for key, value in pairs(salidaNorte) do
				if vcomando == value then
					player1.room = 4
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta003_agua2.ogg")
				end
			end

			for key, value in pairs(salidaSur) do
				if vcomando == value then
					player1.room = 12
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta007.ogg")
				end
			end
			
			for key, value in pairs(salidaOeste) do
				if vcomando == value then
					player1.room = 7
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta002.ogg")
				end
			end
			
			comando = ""
		end	

		
		if player1.room == 9 then
			vcomando = comando
			vcomando = vcomando:upper()

			cargarSalidas()

			if vcomando == "MIRAR" then
				aumentarTurno()
				room9()
			end
			
			for key, value in pairs(salidaNorte) do
				if vcomando == value then
					player1.room = 5
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta005.ogg")
				end
			end

			for key, value in pairs(salidaSur) do
				if vcomando == value then
					player1.room = 13
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta006.ogg")
				end
			end
			
			for key, value in pairs(salidaEste) do
				if vcomando == value then
					player1.room = 10
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta008.ogg")
				end
			end
			
			for key, value in pairs(salidaOeste) do
				if vcomando == value then
					player1.room = 9
					aumentarTurno()
					comando = ""
					eliza("Al oeste en Philadelphia crecía y vivía un tipo que si sigues intenando ir al Oeste llamará a la policía. No puedes ir al Oeste.")
				end
			end
			
			comando = ""
		end	

		
		if player1.room == 10 then
			vcomando = comando
			vcomando = vcomando:upper()

			cargarSalidas()

			if vcomando == "MIRAR" then
				aumentarTurno()
				room10()
			end
			
			for key, value in pairs(salidaNorte) do
				if vcomando == value then
					player1.room = 6
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta007.ogg")
				end
			end

			for key, value in pairs(salidaSur) do
				if vcomando == value then
					player1.room = 14
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta004.ogg")
				end
			end
			
			for key, value in pairs(salidaEste) do
				if vcomando == value then
					player1.room = 11
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta005.ogg")
				end
			end
			
			for key, value in pairs(salidaOeste) do
				if vcomando == value then
					player1.room = 9
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta008.ogg")
				end
			end
			
			comando = ""
		end	

	
		if player1.room == 11 then
			vcomando = comando
			vcomando = vcomando:upper()

			cargarSalidas()

			if vcomando == "MIRAR" then
				aumentarTurno()
				room11()
			end
			
			for key, value in pairs(salidaNorte) do
				if vcomando == value then
					player1.room = 7
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta005.ogg")
				end
			end

			for key, value in pairs(salidaSur) do
				if vcomando == value then
					player1.room = 15
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta003.ogg")
				end
			end
			
			for key, value in pairs(salidaEste) do
				if vcomando == value then
					player1.room = 12
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta007.ogg")
				end
			end
			
			for key, value in pairs(salidaOeste) do
				if vcomando == value then
					player1.room = 10
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta006.ogg")
				end
			end
			
			comando = ""
		end	
	
		if player1.room == 12 then
			vcomando = comando
			vcomando = vcomando:upper()

			cargarSalidas()

			if vcomando == "MIRAR" then
				aumentarTurno()
				room12()
			end
			
			for key, value in pairs(salidaNorte) do
				if vcomando == value then
					player1.room = 8
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta007.ogg")
				end
			end

			for key, value in pairs(salidaSur) do
				if vcomando == value then
					player1.room = 16
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta003.ogg")
				end
			end
			
			for key, value in pairs(salidaOeste) do
				if vcomando == value then
					player1.room = 11
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta007.ogg")
				end
			end
			
			for key, value in pairs(salidaEste) do
				if vcomando == value then
					player1.room = 12
					aumentarTurno()
					comando = ""
					eliza("No puedes ir al este. Es imposible.")
				end
			end
			
			comando = ""
		end	
	
		if player1.room == 13 then
			vcomando = comando
			vcomando = vcomando:upper()

			cargarSalidas()

			if vcomando == "MIRAR" then
				aumentarTurno()
				room13()
			end
			
			for key, value in pairs(salidaNorte) do
				if vcomando == value then
					player1.room = 9
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta006.ogg")
				end
			end
			
			for key, value in pairs(salidaEste) do
				if vcomando == value then
					player1.room = 14
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta006.ogg")
				end
			end
			
			for key, value in pairs(salidaOeste) do
				if vcomando == value then
					player1.room = 13
					aumentarTurno()
					comando = ""
					eliza("Nada de por esa dirección. No puedes, la pared te lo impide y no puedes ni podrás romperla.")
				end
			end
			
			for key, value in pairs(salidaSur) do
				if vcomando == value then
					player1.room = 13
					aumentarTurno()
					comando = ""
					eliza("Para hacer bien el amor has de ir al sur. Pero no puedes ir al sur de modo que no podrás hacer el amor con quien quieras tú.")
				end
			end
			
			comando = ""
		end	

	
		if player1.room == 14 then
			vcomando = comando
			vcomando = vcomando:upper()

			cargarSalidas()

			if vcomando == "MIRAR" then
				aumentarTurno()
				room14()
			end
			
			for key, value in pairs(salidaNorte) do
				if vcomando == value then
					player1.room = 10
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta004.ogg")
				end
			end
			
			for key, value in pairs(salidaEste) do
				if vcomando == value then
					player1.room = 15
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta003.ogg")
				end
			end
			
			for key, value in pairs(salidaOeste) do
				if vcomando == value then
					player1.room = 13
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta006.ogg")
				end
			end
			
			for key, value in pairs(salidaSur) do
				if vcomando == value then
					player1.room = 14
					aumentarTurno()
					comando = ""
					eliza("Al sur ir no puedes.")
				end
			end
			
			comando = ""
		end	
	
		if player1.room == 15 then
			vcomando = comando
			vcomando = vcomando:upper()

			cargarSalidas()

			if vcomando == "MIRAR" then
				aumentarTurno()
				room15()
			end
			
			for key, value in pairs(salidaNorte) do
				if vcomando == value then
					player1.room = 11
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta003.ogg")
				end
			end
			
			for key, value in pairs(salidaEste) do
				if vcomando == value then
					player1.room = 16
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta002.ogg")
				end
			end
			
			for key, value in pairs(salidaOeste) do
				if vcomando == value then
					player1.room = 14
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta003.ogg")
				end
			end
			
			for key, value in pairs(salidaSur) do
				if vcomando == value then
					player1.room = 15
					aumentarTurno()
					comando = ""
					eliza("No way.")
				end
			end
			
			comando = ""
		end	

		if player1.room == 16 then
			vcomando = comando
			vcomando = vcomando:upper()

			cargarSalidas()

			if vcomando == "MIRAR" then
				aumentarTurno()
				room16()
			end
			
			for key, value in pairs(salidaNorte) do
				if vcomando == value then
					player1.room = 12
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta003.ogg")
				end
			end
			
			for key, value in pairs(salidaOeste) do
				if vcomando == value then
					player1.room = 15
					aumentarTurno()
					comando = ""
					cargarFx("fx/puerta002.ogg")
				end
			end
			
			for key, value in pairs(salidaSur) do
				if vcomando == value then
					player1.room = 16
					aumentarTurno()
					comando = ""
					eliza("No puedes ir por esa dirección ni podrás nunca.")
				end
			end
			
			for key, value in pairs(salidaEste) do
				if vcomando == value then
					player1.room = 16
					aumentarTurno()
					comando = ""
					eliza("Te chocas contra el muro. ¿Te falta un verano?, NO puedes ir por allí.")
				end
			end

			
			comando = ""
		end	



		
		
		
	end

end



function comprobarVida()
	if player1.nturno == 20 then player1.vida = 98 end
	if player1.nturno == 30 then player1.vida = 90 end
	if player1.nturno == 40 then player1.vida = 80 end
	if player1.nturno == 50 then player1.vida = 75 end
	if player1.nturno == 55 then player1.vida = 70 end
	if player1.nturno == 60 then player1.vida = 60 end
	if player1.nturno == 70 then player1.vida = 55 end
	if player1.nturno == 80 then player1.vida = 50 end
	if player1.nturno == 90 then player1.vida = 45 end
	if player1.nturno == 100 then player1.vida = 40 end
	if player1.nturno == 110 then player1.vida = 35 end			
	if player1.nturno == 120 then player1.vida = 30 end			
	if player1.nturno == 135 then player1.vida = 22 end
	if player1.nturno == 136 then player1.vida = 21 end
	if player1.nturno == 137 then player1.vida = 20 end
	if player1.nturno == 138 then player1.vida = 19 end
	if player1.nturno == 139 then player1.vida = 18 end
	if player1.nturno == 140 then player1.vida = 17 end
	if player1.nturno == 141 then player1.vida = 16 end
	if player1.nturno == 142 then player1.vida = 15 end
	if player1.nturno == 143 then player1.vida = 14 end
	if player1.nturno == 144 then player1.vida = 13 end
	if player1.nturno == 145 then player1.vida = 12 end
	if player1.nturno == 150 then player1.vida = 10 end
	if player1.nturno == 155 then player1.vida = 5 end
	if player1.nturno == 159 then player1.vida = 1 end
	if player1.nturno == 169 then player1.vida = 0 end
	if player1.nturno == 170 then eliza("Game over") love.event.quit() end
end

function comprobarHora()
	if player1.nturno == 1 then player1.horaFecha = "[ELIZA] 00:01 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 2 then player1.horaFecha = "[ELIZA] 00:02:06 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 3 then player1.horaFecha = "[ELIZA] 00:03 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 4 then player1.horaFecha = "[ELIZA] 00:04 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 5 then player1.horaFecha = "[ELIZA] 00:05:33 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 6 then player1.horaFecha = "[ELIZA] 00:06 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 7 then player1.horaFecha = "[ELIZA] 00:07 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 8 then player1.horaFecha = "[ELIZA] 00:08:21 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 9 then player1.horaFecha = "[ELIZA] 00:09 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 9 then player1.horaFecha = "[ELIZA] 00:10:35 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 10 then player1.horaFecha = "[ELIZA] 00:15:03 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 11 then player1.horaFecha = "[ELIZA] 00:19:38 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 12 then player1.horaFecha = "[ELIZA] 00:22:33 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 13 then player1.horaFecha = "[ELIZA] 00:35 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 14 then player1.horaFecha = "[ELIZA] 00:43 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 15 then player1.horaFecha = "[ELIZA] 00:44 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 16 then player1.horaFecha = "[ELIZA] 00:45 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 17 then player1.horaFecha = "[ELIZA] 00:46 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 18 then player1.horaFecha = "[ELIZA] 00:48 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 19 then player1.horaFecha = "[ELIZA] 00:49 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 20 then player1.horaFecha = "[ELIZA] 00:50 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 21 then player1.horaFecha = "[ELIZA] 00:50:32 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 22 then player1.horaFecha = "[ELIZA] 00:51 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 23 then player1.horaFecha = "[ELIZA] 00:52 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 24 then player1.horaFecha = "[ELIZA] 00:53 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 25 then player1.horaFecha = "[ELIZA] 00:54 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 26 then player1.horaFecha = "[ELIZA] 00:54:14 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 27 then player1.horaFecha = "[ELIZA] 00:54:28 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 28 then player1.horaFecha = "[ELIZA] 00:54:56 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 29 then player1.horaFecha = "[ELIZA] 00:55:23 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 30 then player1.horaFecha = "[ELIZA] 00:55:45 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 31 then player1.horaFecha = "[ELIZA] 00:55:54 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 32 then player1.horaFecha = "[ELIZA] 01:00:54 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 33 then player1.horaFecha = "[ELIZA] 01:01:24 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 34 then player1.horaFecha = "[ELIZA] 01:01:24 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 35 then player1.horaFecha = "[ELIZA] 01:02:24 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 36 then player1.horaFecha = "[ELIZA] 01:03:54 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 37 then player1.horaFecha = "[ELIZA] 01:04:14 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 38 then player1.horaFecha = "[ELIZA] 01:04:24 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 30 then player1.horaFecha = "[ELIZA] 01:04:44 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 40 then player1.horaFecha = "[ELIZA] 01:05:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 41 then player1.horaFecha = "[ELIZA] 01:07:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 42 then player1.horaFecha = "[ELIZA] 01:08:34 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 43 then player1.horaFecha = "[ELIZA] 01:10:29 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 44 then player1.horaFecha = "[ELIZA] 01:12:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 45 then player1.horaFecha = "[ELIZA] 01:13:30 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 46 then player1.horaFecha = "[ELIZA] 01:17:02 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 47 then player1.horaFecha = "[ELIZA] 01:19:03 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 48 then player1.horaFecha = "[ELIZA] 01:22:05 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 49 then player1.horaFecha = "[ELIZA] 01:30:03 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 50 then player1.horaFecha = "[ELIZA] 01:35:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 51 then player1.horaFecha = "[ELIZA] 01:35:10 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 52 then player1.horaFecha = "[ELIZA] 01:39:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 53 then player1.horaFecha = "[ELIZA] 01:40:03 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 54 then player1.horaFecha = "[ELIZA] 01:44:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 55 then player1.horaFecha = "[ELIZA] 01:47:11 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 56 then player1.horaFecha = "[ELIZA] 01:48:12 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 57 then player1.horaFecha = "[ELIZA] 01:53:55 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 58 then player1.horaFecha = "[ELIZA] 01:59:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 59 then player1.horaFecha = "[ELIZA] 02:04:30 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 60 then player1.horaFecha = "[ELIZA] 02:05:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 61 then player1.horaFecha = "[ELIZA] 02:06:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 62 then player1.horaFecha = "[ELIZA] 02:07:14 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 63 then player1.horaFecha = "[ELIZA] 02:08:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 64 then player1.horaFecha = "[ELIZA] 02:09:23 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 65 then player1.horaFecha = "[ELIZA] 02:09:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 66 then player1.horaFecha = "[ELIZA] 02:09:43 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 67 then player1.horaFecha = "[ELIZA] 02:10:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 68 then player1.horaFecha = "[ELIZA] 02:11:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 69 then player1.horaFecha = "[ELIZA] 02:12:03 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 70 then player1.horaFecha = "[ELIZA] 02:14:02 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 71 then player1.horaFecha = "[ELIZA] 02:15:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 72 then player1.horaFecha = "[ELIZA] 02:17:01 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 73 then player1.horaFecha = "[ELIZA] 02:19:02 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 74 then player1.horaFecha = "[ELIZA] 02:23:19 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 75 then player1.horaFecha = "[ELIZA] 02:28:24 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 76 then player1.horaFecha = "[ELIZA] 02:35:32 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 77 then player1.horaFecha = "[ELIZA] 02:44:22 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 78 then player1.horaFecha = "[ELIZA] 02:50:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 79 then player1.horaFecha = "[ELIZA] 02:58:18 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 80 then player1.horaFecha = "[ELIZA] 03:05:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 81 then player1.horaFecha = "[ELIZA] 03:15:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 82 then player1.horaFecha = "[ELIZA] 03:25:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 83 then player1.horaFecha = "[ELIZA] 03:28:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 84 then player1.horaFecha = "[ELIZA] 03:35:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 85 then player1.horaFecha = "[ELIZA] 03:38:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 86 then player1.horaFecha = "[ELIZA] 03:41:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 87 then player1.horaFecha = "[ELIZA] 03:46:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 88 then player1.horaFecha = "[ELIZA] 03:49:13 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 89 then player1.horaFecha = "[ELIZA] 03:51:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 90 then player1.horaFecha = "[ELIZA] 03:55:10 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 91 then player1.horaFecha = "[ELIZA] 03:58:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 92 then player1.horaFecha = "[ELIZA] 04:01:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 93 then player1.horaFecha = "[ELIZA] 04:06:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 94 then player1.horaFecha = "[ELIZA] 04:07:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 95 then player1.horaFecha = "[ELIZA] 04:08:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 96 then player1.horaFecha = "[ELIZA] 04:09:20 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 97 then player1.horaFecha = "[ELIZA] 04:10:20 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 98 then player1.horaFecha = "[ELIZA] 04:12:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 99 then player1.horaFecha = "[ELIZA] 04:14:30 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 100 then player1.horaFecha = "[ELIZA] 04:15:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 101 then player1.horaFecha = "[ELIZA] 04:17:02 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 102 then player1.horaFecha = "[ELIZA] 04:19:20 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 103 then player1.horaFecha = "[ELIZA] 04:21:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 104 then player1.horaFecha = "[ELIZA] 04:22:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 105 then player1.horaFecha = "[ELIZA] 04:27:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 106 then player1.horaFecha = "[ELIZA] 04:29:10 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 107 then player1.horaFecha = "[ELIZA] 04:30:08 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 108 then player1.horaFecha = "[ELIZA] 04:32:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 109 then player1.horaFecha = "[ELIZA] 04:33:08 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 110 then player1.horaFecha = "[ELIZA] 04:35:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 111 then player1.horaFecha = "[ELIZA] 04:36:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 112 then player1.horaFecha = "[ELIZA] 04:38:10 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 113 then player1.horaFecha = "[ELIZA] 04:39:04 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 114 then player1.horaFecha = "[ELIZA] 04:42:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 115 then player1.horaFecha = "[ELIZA] 04:44:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 116 then player1.horaFecha = "[ELIZA] 04:47:30 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 117 then player1.horaFecha = "[ELIZA] 04:49:15 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 118 then player1.horaFecha = "[ELIZA] 04:50:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 119 then player1.horaFecha = "[ELIZA] 04:52:20 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 120 then player1.horaFecha = "[ELIZA] 04:53:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 121 then player1.horaFecha = "[ELIZA] 04:53:30 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 122 then player1.horaFecha = "[ELIZA] 04:55:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 123 then player1.horaFecha = "[ELIZA] 04:56:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 124 then player1.horaFecha = "[ELIZA] 04:57:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 125 then player1.horaFecha = "[ELIZA] 04:58:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 126 then player1.horaFecha = "[ELIZA] 04:59:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 127 then player1.horaFecha = "[ELIZA] 05:01:10 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 128 then player1.horaFecha = "[ELIZA] 05:01:40 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 129 then player1.horaFecha = "[ELIZA] 05:01:50 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 130 then player1.horaFecha = "[ELIZA] 05:02:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 131 then player1.horaFecha = "[ELIZA] 05:02:35 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 132 then player1.horaFecha = "[ELIZA] 05:03:10 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 133 then player1.horaFecha = "[ELIZA] 05:03:40 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 134 then player1.horaFecha = "[ELIZA] 05:04:15 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 135 then player1.horaFecha = "[ELIZA] 05:05:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 136 then player1.horaFecha = "[ELIZA] 05:15:20 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 137 then player1.horaFecha = "[ELIZA] 05:25:10 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 138 then player1.horaFecha = "[ELIZA] 05:42:30 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 139 then player1.horaFecha = "[ELIZA] 05:57:11 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 140 then player1.horaFecha = "[ELIZA] 06:03:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 141 then player1.horaFecha = "[ELIZA] 06:05:10 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 142 then player1.horaFecha = "[ELIZA] 06:11:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 143 then player1.horaFecha = "[ELIZA] 06:15:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 144 then player1.horaFecha = "[ELIZA] 06:17:23 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 145 then player1.horaFecha = "[ELIZA] 06:25:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 146 then player1.horaFecha = "[ELIZA] 06:30:46 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 147 then player1.horaFecha = "[ELIZA] 06:37:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 148 then player1.horaFecha = "[ELIZA] 06:38:52 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 149 then player1.horaFecha = "[ELIZA] 06:40:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 150 then player1.horaFecha = "[ELIZA] 06:42:10 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 151 then player1.horaFecha = "[ELIZA] 06:43:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 152 then player1.horaFecha = "[ELIZA] 06:44:11 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 153 then player1.horaFecha = "[ELIZA] 06:45:42 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 154 then player1.horaFecha = "[ELIZA] 06:46:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 155 then player1.horaFecha = "[ELIZA] 06:47:11 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 156 then player1.horaFecha = "[ELIZA] 06:48:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 157 then player1.horaFecha = "[ELIZA] 06:51:23 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 158 then player1.horaFecha = "[ELIZA] 06:52:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 159 then player1.horaFecha = "[ELIZA] 06:54:43 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 160 then player1.horaFecha = "[ELIZA] 06:55:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 161 then player1.horaFecha = "[ELIZA] 06:55:30 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 162 then player1.horaFecha = "[ELIZA] 06:56:10 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 163 then player1.horaFecha = "[ELIZA] 06:56:30 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 164 then player1.horaFecha = "[ELIZA] 06:57:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 165 then player1.horaFecha = "[ELIZA] 06:57:14 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 166 then player1.horaFecha = "[ELIZA] 06:58:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 167 then player1.horaFecha = "[ELIZA] 06:59:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 168 then player1.horaFecha = "[ELIZA] 06:59:20 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 169 then player1.horaFecha = "[ELIZA] 06:59:59 del 25 de Diciembre del 2028" print(player1.horaFecha) end
	if player1.nturno == 170 then player1.horaFecha = "[ELIZA] 07:00:00 del 25 de Diciembre del 2028" print(player1.horaFecha) end
end

function calcularCol()

  --player1
  player1.col = math.fmod(player1.room-1,4)+1

  --player2
  player2.col = math.fmod(player2.room-1,4)+1

end


function calcularFila()
  
  --player1
  player1.fila = math.fmod(math.floor((player1.room-1)/4),4)+1

  --player2
  player2.fila = math.fmod(math.floor((player2.room-1)/4),4)+1

end


function inicioPlayer2()
  calcularFila()
  calcularCol()

  if player1.fila == player2.fila or player1.col == player2.col then

    while player1.fila == player2.fila or player1.col == player2.col do
      player2.room = love.math.random(1, 16)
      calcularFila()
      calcularCol()
    end

  end

end

