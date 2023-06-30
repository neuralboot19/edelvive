class HomeController < ApplicationController
  def index
    array = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l']
    num_subdivisiones = 3
    longitud = array.length
    elementos_por_subdivision = longitud / num_subdivisiones
    resto = longitud % num_subdivisiones
  
    @resultado = []
    indice = 0
  
    num_subdivisiones.times do |i|
      elementos = elementos_por_subdivision + (i < resto ? 1 : 0)
      subdivision = array.slice(indice, elementos)
      indice += elementos
      @resultado << subdivision
    end
  
    @resultado
  end
end
