utf8 = require("utf8")
require("funciones/generales")
require("rooms/rooms")

function love.load()
	comando = ""
	tipojugador= ""
	
	-- Seteamos variables de Eliza
	player0 = {}
	player0.vida = 999
	player0.room = 666
	player0.tipojugador = "Narradora"
	player0.nturno = 0
	player0.nivel = 0
	player0.horaFecha = "00:00 del 25 de Diciembre del 2028"
	player0.alcohol = 0
	

	-- Seteamos variables de jugador 1 iniciales
	player1 = {}
	player1.vida = 100
	player1.room = 0
	player1.tipojugador = ""
	player1.nturno = 0
	player1.nivel = 0
	player1.horaFecha = "00:00 del 25 de Diciembre del 2028"
	player1.alcohol = 0


	-- Seteamos variables de jugador 2 iniciales
	player2 = {}
	player2.vida = 100
	player2.room = 0
	player2.tipojugador = ""
	player2.nturno = 0
	player2.nivel = 0
	player2.horaFecha = "00:00 del 25 de Diciembre del 2028"
	player1.alcohol = 0


	cargarMusica()
	font = love.graphics.newFont("fuentes/pxplus_ibm_vga8.ttf", 20)
	love.keyboard.setKeyRepeat(true)
end

function love.draw()
	comprobarHabitacionActiva()
	comprobarMusica()
	comprobarVida()
end

